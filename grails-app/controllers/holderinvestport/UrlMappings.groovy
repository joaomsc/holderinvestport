package holderinvestport

class UrlMappings {

    static mappings = {
        "/$controller/$id?/$action?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/portifolio/$id?/add/$companyId?"(controller: "portifolio", action: "addCompany")
        "/portifolio/$id?/remove/$companyId?"(controller: "portifolio", action: "removeCompany")

        "/"(controller:'login', action:'auth')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
