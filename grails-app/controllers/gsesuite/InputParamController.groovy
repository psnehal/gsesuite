package gsesuite


import grails.validation.ValidationException
import grails.plugin.springsecurity.annotation.Secured
import grails.util.Environment

//import gsesuite.Peaks

import groovy.io.FileType

class InputParamController {

    InputParamService inputParamService
    JobDetailsService jobDetailsService
    def exportService
    def springSecurityService
    RegisterService registerService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured('ROLE_USER')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond inputParamService.list(params), model:[inputParamCount: inputParamService.count()]
    }

    def upload() {
        def f = request.getFile('myFile')
        if (f.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'uploadForm')
            return
        }
        def currentUser
        def user = SecUser.get(springSecurityService.principal.id)

        println(user)
        f.transferTo(new File('/Users/snehalpatil/Documents/GithubProjects/chipPolySuite/filestorage/test.txt'))
        response.sendError(200, 'Done')
    }

    def peaksresults() {

        //ocusdef One of: 'nearest_tss', 'nearest_gene', 'exon', 'intron', '1kb',
        //#' '1kb_outside', '1kb_outside_upstream', '5kb', '5kb_outside', '5kb_outside_upstream',
        //#' '10kb', '10kb_outside', '10kb_outside_upstream'.

        println(params)

        def uuid = params.uuid
        println(uuid)
        def peakgn = Peakpergene.findByUuid(uuid)

       // println(peakgn)

        def datadirpath =''
        if (Environment.current == Environment.DEVELOPMENT) {
            datadirpath = '/Users/snehalpatil/Documents/DataFiles/peak2genes/'
        } else
        if (Environment.current == Environment.TEST) {
            datadirpath = '/Users/snehalpatil/Documents/GithubProjects/PRSwebData/shareSnehal/data/'
        } else
        if (Environment.current == Environment.PRODUCTION) {
            datadirpath = '/var/lib/tomcat8/webapps/data/Variable/'
        }

        String status = peakgn.jobstatus
        String outname = peakgn.outname
        String outpath = datadirpath + outname+uuid
        String filename = peakgn.filename
        String newfilepath = outpath+"/"+filename
        String ld = peakgn.ld


        def peakspergenefile = outpath + "/" +'test_peaks.tab'
        println(peakspergenefile)



        ArrayList<ChipEnrichPeaks> peaklist = new ArrayList<ChipEnrichPeaks>();

        BufferedReader br = new BufferedReader(new FileReader(peakspergenefile))
        String line
        br.readLine()


        while ((line = br.readLine()) != null) {

            String [] tokens = line.split("\t")

            String chrom = tokens[1]
            String peakS= tokens[2]
            String peakE= tokens[3]
            String pmid= tokens[0]
            String geneid= tokens[4]
            String geneSym= tokens[5]
            String lstart= tokens[6]
            String lend= tokens[7]
            String ntss= tokens[8]
            String dtss= tokens[9]
            String ntssgene= tokens[10]
            String tssgs= tokens[11]
            String ntssgenestrand= tokens[12]



                peaklist.add(new ChipEnrichPeaks(chrom,peakS,peakE,pmid,geneid,geneSym,lstart,lend,ntss,dtss,ntssgene,tssgs,ntssgenestrand,"NA","NA","NA"))



        }

        //Sort the list by grp name and then by code so they all stay together

        Collections.sort(peaklist, new Comparator<ChipEnrichPeaks>() {
            @Override
            public int compare(ChipEnrichPeaks u1, ChipEnrichPeaks u2) {


                String x3 = u1.getChrom();
                String x4 = u1.getChrom();
                 int sComp = x3.compareTo(x4)
                return sComp

                 return u1.getPeakS().compareTo(u2.getPeakS());
            }
        });

//String chrom, String peakS, String peakE, String pmid, String geneid, String geneSym, String lstart, String lend, String ntss, String dtss, String ntssgene, String tssgs, String ntssgenestrand, String log_dtss, String loggene, String scaled_dtss) {
//		this.chrom = chrom;

        //println(peaklist)

        if(params?.f && params.f != "html"){
            response.contentType = grailsApplication.config.grails.mime.types[params.f]
            response.setHeader("Content-disposition", "attachment; filename=${uuid}")

            List fields = ["chrom", "peakS", "peakE","geneid", "geneSym", "lstart", "lend"]
            Map labels = ["chrom":"Chrom", "peakS":"Peak Start", "peakE":"Peak End", "geneid":"Geneid", "geneSym":"Gene Symbol", "lstart":"Annotation Start", "lend":"Annotation End"]

            exportService.export(params.f, response.outputStream,peaklist,fields,labels, [:], [:])

            response.getOutputStream().flush();
            response.getOutputStream().close();

        }

        println (peaklist.size())

        [peaklist:peaklist.drop(params.int('offset')?:0).take(params.int('max')?:500),listsize:peaklist.size(),uuid:params.uuid]

    }

    def peaktogeneerror()
    {
        println("from peaktogeneerror")

        def uuid = params.uuid
        def status = params.status

        [uuid:uuid, status:status]

    }


    def connectdatabase() {

        //println("inside  : "+params)


        def uuid = params.uuid


        def peakpergene = Peakpergene.findByUuid(uuid)
        def status = peakpergene.jobstatus

        def statusfinal= uuid+"\t"+status

        //println("connectdatabase : "+statusfinal)

        render statusfinal




    }

    def peakpergeneresult()
    {

        def uuid = params.uuid
        println(uuid)
        def peakgn = Peakpergene.findByUuid(uuid)

        println(peakgn)

        def datadirpath =''
        if (Environment.current == Environment.DEVELOPMENT) {
            datadirpath = '/Users/snehalpatil/Documents/DataFiles/peak2genes/'
        } else
        if (Environment.current == Environment.TEST) {
            datadirpath = '/Users/snehalpatil/Documents/GithubProjects/PRSwebData/shareSnehal/data/'
        } else
        if (Environment.current == Environment.PRODUCTION) {
            datadirpath = '/var/lib/tomcat8/webapps/data/Variable/'
        }

        String status = peakgn.jobstatus
        String outname = peakgn.outname
        String outpath = datadirpath + outname+uuid
        String filename = peakgn.filename
        String newfilepath = outpath+"/"+filename
        String ld = peakgn.ld


        def peakspergenefile = outpath + "/" +'test_peaks-per-gene.tab'
        println(peakspergenefile)


       // def peakspergenefile = "/Users/snehalpatil/Documents/DataFiles/peak2genes/testeb73ebfb-68ab-499a-b098-2c525646b956/" + "/" + 'test_peaks-per-gene.tab'

        ArrayList<PeaksperGeneResult> peaklist = new ArrayList<PeaksperGeneResult>();

        BufferedReader br = new BufferedReader(new FileReader(peakspergenefile))
        String line
        br.readLine()

        while ((line = br.readLine()) != null) {

            String[] tokens = line.split("\t")

            String geneid = tokens[0]
            int length = Integer.parseInt(tokens[1])
            double log10_length = Double.parseDouble(tokens[2])
            int num_peaks = Integer.parseInt(tokens[3])
            int peaks = Integer.parseInt(tokens[4])


            //public PeaksperGene(String geneid, Double length, Double log10len, Integer numpeaks, int peak) {


            peaklist.add(new PeaksperGeneResult(geneid,length,log10_length,num_peaks,peaks))





        }

        //String geneid, Double length, Double log10len, Integer numpeaks, int peak)


        def geneids = peaklist.geneid

        def geneinfo = GeneInfo.createCriteria()

        def geneidsymbol = geneinfo.list
                {
                    projections {
                        property('geneid')
                        property('symbol')

                    }

                            'in'("geneid",geneids)

                }



        //println(geneidsymbol)

        Map<String, String> map = new HashMap<>();

        for(int i = 0 ; i < geneidsymbol.size(); i ++)
        {

            //println(geneidsymbol.get(i)[0])

            map.put(geneidsymbol.get(i)[0],geneidsymbol.get(i)[1])
        }


        println(map.get('101101772'))




        def peaklistfinal = peaklist.collect {en ->
            return [geneid:en.geneid, length: en.length, log10len: en.log10len, numpeaks: en.numpeaks,symbol: map.get(en.geneid)]
        }

       def downfilename = "peaks_per_gene"

        if(params?.f && params.f != "html"){
            response.contentType = grailsApplication.config.grails.mime.types[params.f]
            response.setHeader("Content-disposition", "attachment; filename=${downfilename}")

            List fields = ["geneid", "symbol","length", "log10len","numpeaks"]
            Map labels = ["geneid":"GeneID","symbol":"Symbol", "length":"Length", "log10len":"Log 10 Length", "numpeaks":"No of peaks",]
            exportService.export(params.f, response.outputStream,peaklistfinal,fields, labels, [:], [:])

            response.getOutputStream().flush();
            response.getOutputStream().close();

        }

        println (peaklist.size())



        [peaklist:peaklistfinal,listsize:peaklistfinal.size(),uuid:params.uuid]
    }


    def findsymbol()
    {



    }

    def downloadFile()
    {

        def filename = params.filename

        def datadirpath

        def runanalysis


        if (Environment.current == Environment.DEVELOPMENT) {
            datadirpath = '/Users/snehalpatil/Documents/GithubProjects/gsesuite-data/locusdefs/'
        } else
        if (Environment.current == Environment.TEST) {
            datadirpath = '/Users/snehalpatil/Documents/GithubProjects/PRSwebData/shareSnehal/data/'
        } else
        if (Environment.current == Environment.PRODUCTION) {
            datadirpath = '/var/lib/tomcat8/webapps/data/locusdefs/'
        }

        def filepath = datadirpath+filename

        render file: new File (filepath), fileName: filename,contentType: 'text/rtf'
    }

    def peakToGeneStatus()
    {


        println(params)

        def sglist=params.sglist

        def uploadfile = request.getFile('myfile')
        def uploadfilename = uploadfile.originalFilename

        println(uploadfilename)

        if (uploadfile.empty) {
            println("f is emmpty")
        }

        UUID uuid = UUID.randomUUID()


        def outname = "test"
        def outpath
        def outname2 =''


        //creating folder and saving upoaded file in the flder
        def dirpath
        def dirpath1

        if (Environment.current == Environment.DEVELOPMENT) {
            dirpath1 = "/Users/snehalpatil/Documents/DataFiles/peak2gene/"
        } else
        if (Environment.current == Environment.TEST) {
            dirpath1 = '/Users/snehalpatil/Documents/GithubProjects/PRSwebData/shareSnehal/data/'
        } else
        if (Environment.current == Environment.PRODUCTION) {
            dirpath1 = '/var/lib/tomcat8/webapps/data/Variable/'
        }

        dirpath = dirpath1 + outname +uuid


        File newfolder = new File(dirpath1);
            dirpath =dirpath1 + outname + uuid
            newfolder = new File(dirpath);
            newfolder.mkdir();
            outpath = dirpath
            outname2 = outname+uuid


        def newfilepath = dirpath + '/' + uploadfilename

        println("outname2:"+newfilepath)
        uploadfile.transferTo(new File(newfilepath))



        def slist = params.slist

        def datadirpath

        def runanalysis


        if (Environment.current == Environment.DEVELOPMENT) {
            datadirpath = '/Users/snehalpatil/Documents/GithubProjects/gsesuite-data/locusdefs/'
        } else
        if (Environment.current == Environment.TEST) {
            datadirpath = '/Users/snehalpatil/Documents/GithubProjects/PRSwebData/shareSnehal/data/'
        } else
        if (Environment.current == Environment.PRODUCTION) {
            datadirpath = '/var/lib/tomcat8/webapps/data/locusdefs/'
        }








        /*String uuid
        String outname2
        String jobstatus
        String filename
*/

        def ld = ""

        def custld

        if(slist.equals("enhan")|| slist.equals("distal"))
        {

            println("got the enhancer")
            def metregions

            if(params.regions != null)
            {
                println("Got the regions")

                 metregions = String.join("_",params.regions)
                custld=metregions+".0."


            }

            def methods = params.method


            if(methods.equals("general"))
            {



                if(params.gtargets != null)
                {
                    def mettargets = String.join("_",params.gtargets)
                    if(params.gtargets.contains("P2P"))
                    {
                        custld = custld + "P2P"
                    }

                }

                def target1 = params.gtargets1

                println(target1)

                if(target1)
                {



                    if(target1.equals("E1"))
                    {
                        custld = custld + '_E'
                    }
                    else if(target1.equals("E2"))
                    {
                        custld = custld + '_E2'
                    }
                    else  if(target1.equals("E3"))
                    {
                        custld = custld + '_E3'
                    }



                }
                if(params.gtargets.contains("thurman"))
                {
                        custld = custld + '_thurman'
                }
                if(params.gtargets.contains("fantom"))
                {
                    println("thurman loo[  with fantom")
                    custld = custld + '_fantom'

                }
                if(params.gtargets.contains("chromhmm"))
                {


                    custld = custld + '_chromhmm'

                }


                custld = custld+".ldef.gz"



                custld= custld.replace("0._","0.").replace("__","_")





            }
            else if (methods.equals("cellspe"))
            {
                def cellline = params.ctargets
                def loops = params.ctargets1
                def cmethod= params.ctargets2
                if(cellline)
                {
                    if(cmethod)
                    {

                        custld = custld + cmethod+"_"+cellline

                    }

                    if(loops)
                    {





                            if(loops.equals("E1"))
                            {
                                loops =  'E'
                            }





                        if(cmethod)
                        {
                            custld=custld+"_"
                        }

                        custld= custld+loops+"_"+cellline

                    }



                }


                custld = custld+".ldef.gz"
                custld= custld.replace("0._","0.").replace("__","_")









            }
            //thurman_fantom.1000.P2P_E2_thurman_fantom_nearest_All.ldef

            //custld = custld+mettargets+"_nearest_All.ldef"


            println(custld)

            def filePathString = datadirpath + custld

            File f = new File(filePathString);
            if(f.exists() && !f.isDirectory()) {
                println("file exissts")

                ld = filePathString

                runanalysis = "true"
                //registerService.register(uuid.toString())
                //PeaktogenejobService.triggerNow([uuid:uuid] )


            }
            else{

                println("file doesn not exissts")
                runanalysis ='false'
                println(ld)

            }


        }

        else if(slist.equals("dist"))
        {

            println("All distal regions (using enhancer-target gene links where available")
            def metregions

            if(params.regions != null)
            {
                println("Got the regions")

                metregions = String.join("_",params.regions)
                custld=metregions+".0."


            }

            def methods = params.method


            if(methods.equals("general"))
            {



                if(params.gtargets != null)
                {
                    def mettargets = String.join("_",params.gtargets)
                    if(params.gtargets.contains("P2P"))
                    {
                        custld = custld + "P2P"
                    }

                }

                def target1 = params.gtargets1

                println(target1)

                if(target1)
                {



                    if(target1.equals("E1"))
                    {
                        custld = custld + '_E'
                    }
                    else if(target1.equals("E2"))
                    {
                        custld = custld + '_E2'
                    }
                    else  if(target1.equals("E3"))
                    {
                        custld = custld + '_E3'
                    }



                }
                if(params.gtargets.contains("thurman"))
                {
                    custld = custld + '_thurman'
                }
                if(params.gtargets.contains("fantom"))
                {
                    println("thurman loo[  with fantom")
                    custld = custld + '_fantom'

                }
                if(params.gtargets.contains("chromhmm"))
                {


                    custld = custld + '_chromhmm'

                }


                custld = custld+"_nearest_All.ldef.gz"



                custld= custld.replace("0._","0.").replace("__","_")





            }
            else if (methods.equals("cellspe"))
            {
                def cellline = params.ctargets
                def loops = params.ctargets1
                def cmethod= params.ctargets2
                if(cellline)
                {
                    if(cmethod)
                    {

                        custld = custld + cmethod+"_"+cellline

                    }

                    if(loops)
                    {
                        if(cmethod)
                        {
                            custld=custld+"_"
                        }

                        custld= custld+loops+"_"+cellline

                    }



                }


                custld = custld+"_nearest_All.ldef.gz"
                custld= custld.replace("0._","0.").replace("__","_")









            }
            //thurman_fantom.1000.P2P_E2_thurman_fantom_nearest_All.ldef

            //custld = custld+mettargets+"_nearest_All.ldef"


            println(custld)

            def filePathString = datadirpath + custld

            File f = new File(filePathString);
            if(f.exists() && !f.isDirectory()) {
                println("file exissts")

                ld = filePathString

                runanalysis = "true"
                //registerService.register(uuid.toString())
                //PeaktogenejobService.triggerNow([uuid:uuid] )


            }
            else{

                println("file doesn not exissts")
                runanalysis ='false'
                println(ld)

            }


        }

        else{

            ld = params.ld
            runanalysis ="true"
        }







        println("runanalysis is ::"+ runanalysis)

        if(runanalysis.equals("true"))
        {
            println("its true")
            def cpara= new Peakpergene(uuid:uuid,outname:"test",jobstatus:"queued",filename:uploadfilename,ld:ld,sglist:sglist)

            cpara.save(insert:true)
            if (!cpara.save()) {
                cpara.errors.each {
                    println it
                }
            }
            println ("capara is $cpara.id")

            println(params)


            registerService.register(uuid.toString())
        }
        else
        {

            println("file doenst exists")

        }













        [uuid:uuid,runanalysis:runanalysis,ld:ld.replace(datadirpath,""),custld:custld,method:slist]


    }



    def subJob()
{

    println(params)


    def currentUser
    def user = User.get(springSecurityService.principal.id)

    println(user.id)
    //def userfolder = "/usr/share/gsesuitedata/data/userdata/"+user.id
    def userfolder = "/Users/snehalpatil/Documents/GithubProjects/userdata/"+user.id

    File fol = new File(userfolder);

    boolean exists = fol.exists();

    if(!exists)
    {
        fol.mkdirs();

    }



    def f = request.getFile('myfile')

    println("file name is $f.originalFilename")

    if (f.empty) {
        println("f is emmpty")

        def dlist = params.flist



            def filepath = userfolder+"/"+dlist
            println("dlist[i] $dlist[i].name")
            def filename = dlist.name.toString().substring(dlist[i].findLastIndexOf {"/"}, dlist[i].name.toString().length())
            f.transferTo(new File(filepath))

            println("filename from dropdown loop $filename")






    }
    else {
        def filepath = userfolder+"/"+f.originalFilename
        def filename =f.originalFilename
        f.transferTo(new File(filepath))
    }



   // response.sendError(200, 'Done')





  //  def cpara = new JobDetails(usename:user.id.toString(), filename:f.originalFilename, method:"chip", locus:"nearest_gene", results:"submitted")




}


def redirectView()
{

    println(params)




}

def main() {


}
def contact() {


    println(params)

}

    def sendemail()
    {
        println(params)

        JavaMailer jm = new JavaMailer();
        jm.sendMail("pepcentric@gmail.com", "tatagroup" , "inspiresnehal@gmail.com", "TITLE", "TEXT");









    }




def chipInput(){

    println("1")

    def list = []
    println("1")

    //def dir = new File("/usr/share/gsesuitedata/data/")
    def dir = new File("/Users/snehalpatil/Documents/DataFiles/DataFiles/")
    println("1")
    dir.eachFileRecurse (FileType.FILES) { file ->



        list << file
    }

    println("1")
    list.each {
        println it.name
    }


    [list:list]

}


@Secured('ROLE_USER')
def readfile()
{

    println("params fromthe readfile $params")

    def check = 1;

    def f = request.getFile('myfile')
    if (f.empty) {
        flash.message = 'file cannot be empty'
        render(view: 'list')
        return
    }

    def lineNo = 1
    def line
    f.withReader { reader ->
        while ((line = reader.readLine())!=null) {
            println "${lineNo}. ${line}"
            lineNo++
        }
    }







    redirect( action: "gre", params: [author: "Stephen King"])



}

@Secured('ROLE_USER')
def gre(){

    println("gse")

    def list = []
    def infile =[]
    def resfile =[]


    def currentUser
    def user = User.get(springSecurityService.principal.id)

    println("user id  $user.id")

//********************Input folder*********
    //def userfolder ="/usr/share/gsesuitedata/data/userdata/"+user.id
    def userfolder = "/Users/snehalpatil/Documents/GithubProjects/userdata/"+user.id


    File directory = new File(userfolder);
    if (! directory.exists()){
        directory.mkdir();
        // If you require it to make the entire directory path including parents,
        // use directory.mkdirs(); here instead.
    }



    def indir = new File(userfolder)

    indir.eachFile { if(it.file)
    {
        if(!it.name.contains(".DS_Store"))
        {
            println(it.name)
            infile << it
        }



    }}
//********************Output folder*********
    def resfolder = userfolder+"/results"

    File resdirectory = new File(resfolder);
    if (! resdirectory.exists()){
        resdirectory.mkdir();
        // If you require it to make the entire directory path including parents,
        // use directory.mkdirs(); here instead.
    }


    def resdir = new File(resfolder)
    resdir.eachFile { if(it.file)
    {
        if(!it.name.startsWith(".")) {
            resfile << it
            println(it)
        }

    }}
//********************Drop down files*********
    //def dir = new File("/usr/share/gsesuitedata/data/")
    def dir = new File("/Users/snehalpatil/Documents/DataFiles/DataFiles/")
    println("1")
    dir.eachFileRecurse (FileType.FILES) { file ->
        if(!file.name.startsWith(".")) {
            list << file
        }
    }
    indir.eachFile(FileType.FILES) { file ->
        if(!file.name.startsWith(".")) {

            list << file
            println("file is $file.name")
        }



    }



    [list:list, infile:infile,resfile:resfile]

}

def saveReview()
{
    println("from save review with params $params.val1")

    File file = new File(params.val1)
    println "Below is the content of the file ${file.absolutePath}"
    def lineNo = 1
    def line

    def regwid = []
    file.withReader { reader ->
        while ((line = reader.readLine())!=null) {
            println "${lineNo}. ${line}"

            def information = line.split("\t");
            def  start = Double.parseDouble(information[1].trim());
            def end = Double.parseDouble(information[2]);
            def regionwidths = end - start;
            regwid.add(regionwidths)

            println("regionwidths$regionwidths for end$end and start$start")



            lineNo++
        }
    }

    println(regwid.size())


    //******************   50%

    //int Index = (int)Math.Ceiling(((double)50 / (double)100) * (double)regwid.size());


    println(regwid.sort())

    regwid




    render  regwid

}



def tutorials() {

}

def checksuerlogin()
{

    if (isLoggedIn()) {
        //String email = getAuthenticatedUser().id
        forward  action: "gre"

    }
    else
    {
        forward  action: "chipInput"

    }

}
@Secured('ROLE_USER')
def news() {

}


def peakToGene()
{



}



def peakToGeneOld()
{

}

def reverseQuery()
{

}

def showConcept()

{
  println(params)

}


def show(Long id) {
    respond inputParamService.get(id)
}

@Secured('ROLE_USER')
def create() {
    respond new InputParam(params)
}

def save(InputParam inputParam) {
    if (inputParam == null) {
        notFound()
        return
    }

    try {
        inputParamService.save(inputParam)
    } catch (ValidationException e) {
        respond inputParam.errors, view:'create'
        return
    }

    request.withFormat {
        form multipartForm {
            flash.message = message(code: 'default.created.message', args: [message(code: 'inputParam.label', default: 'InputParam'), inputParam.id])
            redirect inputParam
        }
        '*' { respond inputParam, [status: CREATED] }
    }
}

def edit(Long id) {
    respond inputParamService.get(id)
}

def update(InputParam inputParam) {
    if (inputParam == null) {
        notFound()
        return
    }

    try {
        inputParamService.save(inputParam)
    } catch (ValidationException e) {
        respond inputParam.errors, view:'edit'
        return
    }

    request.withFormat {
        form multipartForm {
            flash.message = message(code: 'default.updated.message', args: [message(code: 'inputParam.label', default: 'InputParam'), inputParam.id])
            redirect inputParam
        }
        '*'{ respond inputParam, [status: OK] }
    }
}

def delete(Long id) {
    if (id == null) {
        notFound()
        return
    }

    inputParamService.delete(id)

    request.withFormat {
        form multipartForm {
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inputParam.label', default: 'InputParam'), id])
            redirect action:"index", method:"GET"
        }
        '*'{ render status: NO_CONTENT }
    }
}

protected void notFound() {
    request.withFormat {
        form multipartForm {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inputParam.label', default: 'InputParam'), params.id])
            redirect action: "index", method: "GET"
        }
        '*'{ render status: NOT_FOUND }
    }
}
}
