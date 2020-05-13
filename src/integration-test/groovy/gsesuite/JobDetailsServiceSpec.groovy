package gsesuite

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class JobDetailsServiceSpec extends Specification {

    JobDetailsService jobDetailsService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new JobDetails(...).save(flush: true, failOnError: true)
        //new JobDetails(...).save(flush: true, failOnError: true)
        //JobDetails jobDetails = new JobDetails(...).save(flush: true, failOnError: true)
        //new JobDetails(...).save(flush: true, failOnError: true)
        //new JobDetails(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //jobDetails.id
    }

    void "test get"() {
        setupData()

        expect:
        jobDetailsService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<JobDetails> jobDetailsList = jobDetailsService.list(max: 2, offset: 2)

        then:
        jobDetailsList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        jobDetailsService.count() == 5
    }

    void "test delete"() {
        Long jobDetailsId = setupData()

        expect:
        jobDetailsService.count() == 5

        when:
        jobDetailsService.delete(jobDetailsId)
        sessionFactory.currentSession.flush()

        then:
        jobDetailsService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        JobDetails jobDetails = new JobDetails()
        jobDetailsService.save(jobDetails)

        then:
        jobDetails.id != null
    }
}
