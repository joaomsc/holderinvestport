package holderinvestport

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import javax.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional
class PortifolioController {

    PortifolioService portifolioService
    def springSecurityService

    static allowedMethods = [add: "PUT", remove: "PUT"]


    @Secured(['ROLE_USER'])
    def show(Long id) {

        def portf = null;

        if(id == null){
            def currentUser = User.get(springSecurityService.principal.id)
            portf = currentUser.getPortifolios().first();
        } else {
            portf = portifolioService.get(id)

            if(portf.getOwnerId() != springSecurityService.principal.id) {
                notAllowed()
                return
            }
        }

        respond portf
    }

    @Secured(['ROLE_USER'])
    def addCompany(Long companyId) {

        def currentUser = User.get(springSecurityService.principal.id)
        def portf = currentUser.getPortifolios().first();

        def company = Company.get(companyId)

        if(portf && company){
            portf.addToCompanies(company).save()

            Portifolio.withTransaction { sess ->
                sess.flush()
            }

            render (contentType: "application/json",
                    status: CREATED,
                    text: portf as JSON)
        } else {
            notFound()
            return
        }
    }

    @Secured(['ROLE_USER'])
    def removeCompany(Long companyId) {

        def currentUser = User.get(springSecurityService.principal.id)
        def portf = currentUser.getPortifolios().first();

        def company = Company.get(companyId)

        if(portf && company){
            portf.removeFromCompanies(company).save()

            Portifolio.withTransaction { sess ->
                sess.flush()
            }

            render (contentType: "application/json",
                    status: CREATED,
                    text: portf as JSON)


        } else {
            notFound()
            return
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'portifolio.label', default: 'Portifolio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    protected void notAllowed() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'portifolio.label', default: 'Portifolio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: CONFLICT }
        }
    }

}
