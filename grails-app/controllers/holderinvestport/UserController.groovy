package holderinvestport

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*

class UserController {

    def springSecurityService
    UserService userService

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //@TODO remove current user from de list
        //@TODO return just username and fullname
        respond User.list(params), model:[userCount: User.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(Long id) {
        respond User.get(id)
    }

    @Secured('ROLE_ADMIN')
    def delete(Long id) {
        def user = User.findById(id)
        if (id == null && user) {
            notFound()
            return
        } else if(user.getId() == springSecurityService.principal.id){
            confict()
            return
        }

        UserRole.withTransaction { status ->
            UserRole.removeAll(user)
        }
        userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    protected void confict() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Você não pode deletar seu próprio usuário', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: CONFLICT }
        }
    }
}
