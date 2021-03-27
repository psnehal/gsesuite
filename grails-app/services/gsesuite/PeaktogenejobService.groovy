package gsesuite

import com.agileorbit.schwartz.SchwartzJob
import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j
import org.quartz.JobDataMap
import org.quartz.JobExecutionContext
import org.quartz.JobExecutionException
import org.rosuda.REngine.REXP
import org.rosuda.REngine.Rserve.RConnection
import org.rosuda.REngine.Rserve.RserveException
import grails.util.Environment
import gsesuite.Peakpergene

import java.text.SimpleDateFormat

import grails.gorm.transactions.Transactional

import grails.gorm.transactions.Transactional


class PeaktogenejobService  implements SchwartzJob
    {

    void execute(JobExecutionContext context) throws JobExecutionException {


        JobDataMap jobDataMap = context.mergedJobDataMap
        String uuid = jobDataMap.getString('uuid')

        println("Saying hello from the job : "+  uuid)

        def datadirpath
        if (Environment.current == Environment.DEVELOPMENT) {
            datadirpath = '/Users/snehalpatil/Documents/DataFiles/peak2genes/'
        } else
        if (Environment.current == Environment.TEST) {
            datadirpath = '/Users/snehalpatil/Documents/GithubProjects/PRSwebData/shareSnehal/data/'
        } else
        if (Environment.current == Environment.PRODUCTION) {
            datadirpath = '/var/lib/tomcat8/webapps/data/Variable/'
        }



        def peakgn = Peakpergene.findByUuid(uuid)

        String status = peakgn.jobstatus
        String outname = peakgn.outname
        String outpath = datadirpath + outname+uuid
        String filename = peakgn.filename
        String newfilepath = outpath+"/"+filename
        String ld = peakgn.ld
        String sglist= peakgn.sglist



        println("outpath=" + outpath)
        println("outname=" + outname)
        println("newfilepath= " + newfilepath)
        println("outpath=" + outpath)
        println("ld = " + ld)
        println("sglist = " + sglist)


        RConnection connection = new RConnection("127.0.0.1", 6311)
        connection.eval("library(chipenrich)");
        println("at the start of the job start")


        //peaks2genes <- function(peaks,out_name = outname,out_path = outpath,genome = genomedata,locusdef = ld ,weighting = NULL,mappability = NULL,qc_plots = TRUE,
        // num_peak_threshold = 1,randomization = NULL)
        //)

        //connection.eval("options(warn=-1)")

        connection.assign("peaks", newfilepath);
        connection.assign("outname", outname);
        connection.assign("outpath", outpath);
        //connection.assign("genomedata", "hg19");
        connection.assign("ld", ld);
        connection.assign("genome", sglist);


        //genome = supported_genomes(),

        def command = "  peaks2genesResults <- peaks2genes( " +
                "  peaks" +
                ", out_name = outname " +
                ", out_path = outpath" +
                ", genome = genome " +
                ", locusdef = ld " +
                ", mappability = NULL" +
                ", qc_plots = TRUE" +
                ", weighting = NULL" +
                ", randomization = NULL" +
                ", num_peak_threshold = 1)"
        ;


        try {
            REXP r1 = connection.parseAndEval("try(" + command + ",silent=TRUE)");

            // REXP r1 =connection.parseAndEval(command)

            println(r1)

            println("its got the results")
            if (r1.inherits("try-error")) {
                System.err.println("Error: " + r1.asString());
                status = "Error: " + r1.asString();
            } else {
                System.out.println("Hello");
                status = "Done";
            }




        }
            catch (RserveException e) {
                e.printStackTrace();
                throw new IllegalStateException("Unable to run command  parseAndEval on RServer: " + command);
                status ="Rserve Exception"
            }
            catch(Exception e)
            {
                println("in exception")
                status="normal exception"
            }

        connection.close()

        try {


            peakgn.jobstatus = status
            peakgn.save()

        }
        catch(Exception e){
            println("in db save error")
        }

        println("status: $status")
       // println 'Done with the job :: {} ', uuid
    }

    @Override
    void buildTriggers() {

    }

}
