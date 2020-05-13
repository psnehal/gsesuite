package gsesuite

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ConceptInfoServiceSpec extends Specification {

    ConceptInfoService conceptInfoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new ConceptInfo(...).save(flush: true, failOnError: true)
        //new ConceptInfo(...).save(flush: true, failOnError: true)
        //ConceptInfo conceptInfo = new ConceptInfo(...).save(flush: true, failOnError: true)
        //new ConceptInfo(...).save(flush: true, failOnError: true)
        //new ConceptInfo(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //conceptInfo.id
    }

    void "test get"() {
        setupData()

        expect:
        conceptInfoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<ConceptInfo> conceptInfoList = conceptInfoService.list(max: 2, offset: 2)

        then:
        conceptInfoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        conceptInfoService.count() == 5
    }

    void "test delete"() {
        Long conceptInfoId = setupData()

        expect:
        conceptInfoService.count() == 5

        when:
        conceptInfoService.delete(conceptInfoId)
        sessionFactory.currentSession.flush()

        then:
        conceptInfoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        ConceptInfo conceptInfo = new ConceptInfo()
        conceptInfoService.save(conceptInfo)

        then:
        conceptInfo.id != null
    }
}
