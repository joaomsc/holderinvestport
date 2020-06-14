package holderinvestport

import javax.transaction.Transactional

@Transactional
class BootStrap {

    def init = { servletContext ->
        //Creating default roles
        def uRole = new Role(authority: 'ROLE_USER').save()
        def admRole = new Role(authority: 'ROLE_ADMIN').save()

        //Creating adm user
        def admUser = new User(username: "admin@admin.com", password: "adminP@ss", fullname: "Admin").save()
        UserRole.create admUser, admRole

        //Creating investment user
        def uUser = new User(username: "johndoo@johndoo.com", password: "12345", fullname: "Johndoo").save()
        UserRole.create uUser, uRole
        def portf = new Portifolio(owner: uUser.getId())

        //Populating some company data
        new Company(tradingName: 'ITAU', name: 'ITAU UNIBANCO HOLDING S.A.', description: "Itaú é o maior banco brasileiro, com sede na cidade de São Paulo, no estado homônimo. O banco foi criado em 4 de novembro de 2008 a partir da fusão entre o Banco Itaú e o Unibanco, duas das maiores instituições financeiras do país, resultando no maior conglomerado financeiro do hemisfério sul e num dos 20 maiores do mundo em valor de mercado.", image: "/1-default-comp1.jpg").save()
        def comp2 = new Company(tradingName: 'LOJAS AMERICANAS', name: 'LOJAS AMERICANAS S.A.', description: "Lojas Americanas S.A. é uma empresa brasileira do segmento de varejo fundada em 1929 na cidade de Niterói pelo austríaco Max Landesmann e pelos norte-americanos John Lee, Glen Matson, James Marshall e Batson Borger. A empresa conta com mais de 1320 estabelecimentos de vendas em todo o Brasil.", image: "/2-default-comp2.jpg").save()
        def comp3 = new Company(tradingName: 'WEGE', name: 'WEG S.A.', description: "WEG S.A é uma empresa multinacional brasileira com sede na cidade de Jaraguá do Sul, no estado de Santa Catarina.", image:"/3-default-comp3.jpg").save()

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
