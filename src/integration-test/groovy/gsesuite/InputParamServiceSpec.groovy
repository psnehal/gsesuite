package gsesuite

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class InputParamServiceSpec extends Specification {

    InputParamService inputParamService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new InputParam(...).save(flush: true, failOnError: true)
        //new InputParam(...).save(flush: true, failOnError: true)
        //InputParam inputParam = new InputParam(...).save(flush: true, failOnError: true)
        //new InputParam(...).save(flush: true, failOnError: true)
        //new InputParam(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //inputParam.id
    }

    void "test get"() {
        setupData()

        expect:
        inputParamService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<InputParam> inputParamList = inputParamService.list(max: 2, offset: 2)

        then:
        inputParamList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        inputParamService.count() == 5
    }

    void "test delete"() {
        Long inputParamId = setupData()

        expect:
        inputParamService.count() == 5

        when:
        inputParamService.delete(inputParamId)
        sessionFactory.currentSession.flush()

        then:
        inputParamService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        InputParam inputParam = new InputParam()
        inputParamService.save(inputParam)

        then:
        inputParam.id != null
    }
}
