package gsesuite

import grails.gorm.services.Service

@Service(PeResult)
interface PeResultService {

    PeResult get(Serializable id)

    List<PeResult> list(Map args)

    Long count()

    void delete(Serializable id)

    PeResult save(PeResult peResult)

}