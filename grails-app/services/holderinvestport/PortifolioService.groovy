package holderinvestport

import grails.gorm.services.Service

@Service(Portifolio)
interface PortifolioService {

    Portifolio get(Serializable id)

    List<Portifolio> list(Map args)

    Long count()

    void delete(Serializable id)

    Portifolio save(Portifolio portifolio)

}