package gsesuite


import com.agileorbit.schwartz.QuartzService
import com.agileorbit.schwartz.builder.BuilderFactory
import groovy.time.TimeCategory
import groovy.transform.CompileDynamic
import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j
import org.quartz.JobDataMap
import org.quartz.JobDetail
import org.quartz.JobKey
import org.quartz.Trigger
import org.quartz.TriggerBuilder

import java.text.SimpleDateFormat



class RegisterService {

    QuartzService quartzService

    void register(String uuid) {
        log.info 'saving {} at {}', uuid, new SimpleDateFormat("dd/M/yyyy hh:mm:ss").format(new Date())
        scheduleRJOb(uuid)
    }

    @CompileDynamic
    Date startAtDate() {
        Date startAt = new Date()
        use(TimeCategory) {
            startAt = startAt + 1.second
        }
        startAt
    }

    void scheduleRJOb(String uuid) {

        JobDataMap jobDataMap = new JobDataMap()
        println(uuid)
        println(PeaktogenejobService.simpleName)

        jobDataMap.put('uuid', uuid)
        Trigger trigger = TriggerBuilder.newTrigger()
                .forJob(JobKey.jobKey(PeaktogenejobService.simpleName))
                .usingJobData(jobDataMap)
                .startAt(startAtDate())
                .build()

        println(trigger)
        quartzService.scheduleTrigger(trigger)
    }
}
