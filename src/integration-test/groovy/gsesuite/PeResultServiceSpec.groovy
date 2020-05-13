package gsesuite

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PeResultServiceSpec extends Specification {

    PeResultService peResultService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new PeResult(...).save(flush: true, failOnError: true)
        //new PeResult(...).save(flush: true, failOnError: true)
        //PeResult peResult = new PeResult(...).save(flush: true, failOnError: true)
        //new PeResult(...).save(flush: true, failOnError: true)
        //new PeResult(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //peResult.id
    }

    void "test get"() {
        setupData()

        expect:
        peResultService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<PeResult> peResultList = peResultService.list(max: 2, offset: 2)

        then:
        peResultList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        peResultService.count() == 5
    }

    void "test delete"() {
        Long peResultId = setupData()

        expect:
        peResultService.count() == 5

        when:
        peResultService.delete(peResultId)
        sessionFactory.currentSession.flush()

        then:
        peResultService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        PeResult peResult = new PeResult()
        peResultService.save(peResult)

        then:
        peResult.id != null
    }
}
