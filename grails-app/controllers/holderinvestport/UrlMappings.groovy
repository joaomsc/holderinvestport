package holderinvestport

class UrlMappings {

    static mappings = {
        "/$controller/$id?/$action?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/company/create"(controller: "company", action: "create")
        "/company/save"(controller: "company", action: "save")

        "/portifolio/show"(controller: "portifolio", action: "show")
        "/portifolio/add/$companyId?"(controller: "portifolio", action: "addCompany")
        "/portifolio/remove/$companyId?"(controller: "portifolio", action: "removeCompany")

        "/register" (controller: 'register', action: "register", method: "POST")
        "/"(controller:'login', action:'auth')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
