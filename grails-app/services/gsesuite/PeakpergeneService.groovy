package gsesuite

import grails.gorm.services.Service

@Service(Peakpergene)
interface PeakpergeneService {

    Peakpergene get(Serializable id)

    List<Peakpergene> list(Map args)

    Long count()

    void delete(Serializable id)

    Peakpergene save(Peakpergene peakpergene)

}