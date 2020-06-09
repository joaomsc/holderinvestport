package holderinvestport

import javax.transaction.Transactional

@Transactional
class BootStrap {

    def init = { servletContext ->
        //Creating default roles
        def uRole = new Role(authority: 'ROLE_USER').save()
        def admRole = new Role(authority: 'ROLE_ADMIN').save()

        //Creating adm user
        def admUser = new User(username: "admin@admin.com", password: "admin", fullname: "Admin").save()
        UserRole.create admUser, admRole

        //Creating investment user
        def uUser = new User(username: "johndoo@johndoo.com", password: "johndoo", fullname: "Johndoo").save()
        UserRole.create uUser, uRole
        def portf = new Portifolio(owner: uUser.getId())

        //Populating some company data
        new Company(tradingName: 'nome fantasia', name: 'razão social', description: 'produtora de café').save()
        def comp2 = new Company(tradingName: 'nome fantasia 2', name: 'razão social 2', description: 'produtora de café 2').save()
        def comp3 = new Company(tradingName: 'nome fantasia 3', name: 'razão social 3', description: 'produtora de café 3').save()

        portf.addToCompanies(comp2)
        portf.addToCompanies(comp3)
        portf.save()

        Portifolio.withTransaction { sess ->
            sess.flush()
        }
    }

    def destroy = {
    }
}
