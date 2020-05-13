package gsesuite

import grails.gorm.services.Service

@Service(ConceptInfo)
interface ConceptInfoService {

    ConceptInfo get(Serializable id)

    List<ConceptInfo> list(Map args)

    Long count()

    void delete(Serializable id)

    ConceptInfo save(ConceptInfo conceptInfo)

}