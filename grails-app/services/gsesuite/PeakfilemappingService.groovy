package gsesuite

import grails.gorm.services.Service

@Service(Peakfilemapping)
interface PeakfilemappingService {

    Peakfilemapping get(Serializable id)

    List<Peakfilemapping> list(Map args)

    Long count()

    void delete(Serializable id)

    Peakfilemapping save(Peakfilemapping peakfilemapping)

}