package gsesuite

import grails.gorm.services.Service

@Service(InputParam)
interface InputParamService {

    InputParam get(Serializable id)

    List<InputParam> list(Map args)

    Long count()

    void delete(Serializable id)

    InputParam save(InputParam inputParam)

}