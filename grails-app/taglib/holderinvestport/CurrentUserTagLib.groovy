package holderinvestport

class CurrentUserTagLib {
    static defaultEncodeAs = [taglib:'text']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def springSecurityService

    def companyInPortifolio = { attrs, body ->
        Company company = attrs?.company
        if(company.isInPortifolio(springSecurityService.principal.id)) {
            out << body()
        }
    }

    def companyNotInPortifolio = { attrs, body ->
        Company company = attrs?.company
        if(!company.isInPortifolio(springSecurityService.principal.id)) {
            out << body()
        }
    }
}
