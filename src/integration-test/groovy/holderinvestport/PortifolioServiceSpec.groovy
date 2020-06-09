package holderinvestport

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PortifolioServiceSpec extends Specification {

    PortifolioService portifolioService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Portifolio(...).save(flush: true, failOnError: true)
        //new Portifolio(...).save(flush: true, failOnError: true)
        //Portifolio portifolio = new Portifolio(...).save(flush: true, failOnError: true)
        //new Portifolio(...).save(flush: true, failOnError: true)
        //new Portifolio(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //portifolio.id
    }

    void "test get"() {
        setupData()

        expect:
        portifolioService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Portifolio> portifolioList = portifolioService.list(max: 2, offset: 2)

        then:
        portifolioList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        portifolioService.count() == 5
    }

    void "test delete"() {
        Long portifolioId = setupData()

        expect:
        portifolioService.count() == 5

        when:
        portifolioService.delete(portifolioId)
        sessionFactory.currentSession.flush()

        then:
        portifolioService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Portifolio portifolio = new Portifolio()
        portifolioService.save(portifolio)

        then:
        portifolio.id != null
    }
}
