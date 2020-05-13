package gsesuite

import grails.gorm.services.Service

@Service(PeakInfo)
interface PeakInfoService {

    PeakInfo get(Serializable id)

    List<PeakInfo> list(Map args)

    Long count()

    void delete(Serializable id)

    PeakInfo save(PeakInfo peakInfo)

}