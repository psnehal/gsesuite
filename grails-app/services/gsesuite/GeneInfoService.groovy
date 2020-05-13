package gsesuite

import grails.gorm.services.Service

@Service(GeneInfo)
interface GeneInfoService {

    GeneInfo get(Serializable id)

    List<GeneInfo> list(Map args)

    Long count()

    void delete(Serializable id)

    GeneInfo save(GeneInfo geneInfo)

}