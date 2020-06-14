package holderinvestport

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartFile

import javax.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional
class CompanyController {

    CompanyService companyService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond companyService.list(params), model:[companyCount: companyService.count()]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def show(Long id) {
        respond companyService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def create() {
        respond new Company(params)
    }

    @Secured('ROLE_ADMIN')
    def save(Company company) {
        if (company == null) {
            notFound()
            return
        }

        try {

            companyService.save(company)

            def imageFile = params.imageFile
            if(imageFile.filename != ""){
                MultipartFile multipartFilefile = (MultipartFile) imageFile;
                company.setImage(FileUtil.uploadCompanyImage(company.getId(), multipartFilefile))
            }

            companyService.save(company)

            Company.withTransaction {
                sess ->
                    sess.flush()
            }
        } catch (ValidationException e) {
            respond company.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'company.label', default: 'Company'), company.id])
                redirect company
            }
            '*' { respond company, [status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Long id) {
        respond companyService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def update(Company company) {
        if (company == null) {
            notFound()
            return
        }

        try {

            def imageFile = params.imageFile
            if(imageFile.filename != ""){
                def oldImage = company.getImage()
                MultipartFile multipartFilefile = (MultipartFile) imageFile;
                company.setImage(FileUtil.uploadCompanyImage(company.getId(), multipartFilefile))
                if(oldImage){
                    FileUtil.deleteCompanyImage(oldImage)
                }
            }

            companyService.save(company)
        } catch (ValidationException e) {
            respond company.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'company.label', default: 'Company'), company.id])
                redirect company
            }
            '*'{ respond company, [status: OK] }
        }
    }

    @Secured('ROLE_ADMIN')
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        def company = companyService.get(id)
        FileUtil.deleteCompanyImage(company.getImage())

        Company.withTransaction {sess ->
            company.getPortifolios().each{
                it -> it.removeFromCompanies(company)
            }
            company.save()
            sess.flush()
        }

        companyService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'company.label', default: 'Company'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
