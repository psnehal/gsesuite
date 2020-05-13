package gsesuite

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PeakInfoServiceSpec extends Specification {

    PeakInfoService peakInfoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new PeakInfo(...).save(flush: true, failOnError: true)
        //new PeakInfo(...).save(flush: true, failOnError: true)
        //PeakInfo peakInfo = new PeakInfo(...).save(flush: true, failOnError: true)
        //new PeakInfo(...).save(flush: true, failOnError: true)
        //new PeakInfo(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //peakInfo.id
    }

    void "test get"() {
        setupData()

        expect:
        peakInfoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<PeakInfo> peakInfoList = peakInfoService.list(max: 2, offset: 2)

        then:
        peakInfoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        peakInfoService.count() == 5
    }

    void "test delete"() {
        Long peakInfoId = setupData()

        expect:
        peakInfoService.count() == 5

        when:
        peakInfoService.delete(peakInfoId)
        sessionFactory.currentSession.flush()

        then:
        peakInfoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        PeakInfo peakInfo = new PeakInfo()
        peakInfoService.save(peakInfo)

        then:
        peakInfo.id != null
    }
}
