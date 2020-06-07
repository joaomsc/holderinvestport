package holderinvestport

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional
@Secured('permitAll')
class RegisterController {

    static allowedMethods = [register: "POST"]

    def index() { }

    def register() {
        if(!params.password.equals(params.repassword)) {
            flash.message = "Os campos de senha e confirmação não batem"
            redirect action: "index"
            return
        } else {
            try {
                def user = User.findByUsername(params.username)?: new User(username: params.username, password: params.password, fullname: params.fullname).save()
                def role = Role.findByAuthority("ROLE_USER")
                if(user && role) {
                    UserRole.create user, role

                    UserRole.withSession {
                        it.flush()
                        it.clear()
                    }

                    flash.sucmessage = "Parabéns, conta criada com sucesso. Agora, faça o login."
                    redirect controller: "login", action: "auth"
                } else {
                    flash.message = "Problema ao criar sua conta"
                    render view: "index"
                    return
                }
            } catch (ValidationException e) {
                flash.message = "Problema ao criar sua conta"
                redirect action: "index"
                return
            }
        }
    }
}
