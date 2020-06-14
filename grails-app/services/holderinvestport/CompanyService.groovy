package holderinvestport

import grails.gorm.services.Service

@SuppressWarnings(['LineLength', 'UnusedVariable', 'SpaceAfterOpeningBrace', 'SpaceBeforeClosingBrace'])
@Service(Company)
interface CompanyService {

    Company get(Serializable id)

    List<Company> list(Map args)

    Long count()

    void delete(Serializable id)

    Company save(Company company)

    Company updateImage(Serializable id, String image)

}