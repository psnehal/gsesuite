package gsesuite

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PeakpergeneServiceSpec extends Specification {

    PeakpergeneService peakpergeneService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Peakpergene(...).save(flush: true, failOnError: true)
        //new Peakpergene(...).save(flush: true, failOnError: true)
        //Peakpergene peakpergene = new Peakpergene(...).save(flush: true, failOnError: true)
        //new Peakpergene(...).save(flush: true, failOnError: true)
        //new Peakpergene(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //peakpergene.id
    }

    void "test get"() {
        setupData()

        expect:
        peakpergeneService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Peakpergene> peakpergeneList = peakpergeneService.list(max: 2, offset: 2)

        then:
        peakpergeneList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        peakpergeneService.count() == 5
    }

    void "test delete"() {
        Long peakpergeneId = setupData()

        expect:
        peakpergeneService.count() == 5

        when:
        peakpergeneService.delete(peakpergeneId)
        sessionFactory.currentSession.flush()

        then:
        peakpergeneService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Peakpergene peakpergene = new Peakpergene()
        peakpergeneService.save(peakpergene)

        then:
        peakpergene.id != null
    }
}
