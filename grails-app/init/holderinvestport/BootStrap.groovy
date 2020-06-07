package holderinvestport

class BootStrap {

    def init = { servletContext ->
        //Creating default roles
        new Role(authority: 'ROLE_USER').save()
        def admRole = new Role(authority: 'ROLE_ADMIN').save()

        //Creating adm user
        def admUser = new User(username: "admin@admin.com", password: "admin", fullname: "Admin").save()
        UserRole.create admUser, admRole

        //Populating some data
        new Company(tradingName: 'nome fantasia', name: 'razão social', description: 'produtora de café').save()

    }
    def destroy = {
    }
}
