package gsesuite

import grails.gorm.services.Service

@Service(JobDetails)
interface JobDetailsService {

    JobDetails get(Serializable id)

    List<JobDetails> list(Map args)

    Long count()

    void delete(Serializable id)

    JobDetails save(JobDetails jobDetails)

}