package gsesuite

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PeakfilemappingServiceSpec extends Specification {

    PeakfilemappingService peakfilemappingService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Peakfilemapping(...).save(flush: true, failOnError: true)
        //new Peakfilemapping(...).save(flush: true, failOnError: true)
        //Peakfilemapping peakfilemapping = new Peakfilemapping(...).save(flush: true, failOnError: true)
        //new Peakfilemapping(...).save(flush: true, failOnError: true)
        //new Peakfilemapping(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //peakfilemapping.id
    }

    void "test get"() {
        setupData()

        expect:
        peakfilemappingService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Peakfilemapping> peakfilemappingList = peakfilemappingService.list(max: 2, offset: 2)

        then:
        peakfilemappingList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        peakfilemappingService.count() == 5
    }

    void "test delete"() {
        Long peakfilemappingId = setupData()

        expect:
        peakfilemappingService.count() == 5

        when:
        peakfilemappingService.delete(peakfilemappingId)
        sessionFactory.currentSession.flush()

        then:
        peakfilemappingService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Peakfilemapping peakfilemapping = new Peakfilemapping()
        peakfilemappingService.save(peakfilemapping)

        then:
        peakfilemapping.id != null
    }
}
