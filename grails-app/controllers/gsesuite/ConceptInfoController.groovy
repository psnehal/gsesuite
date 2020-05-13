package gsesuite

import com.google.gson.GsonBuilder
import com.google.gson.reflect.TypeToken
import grails.validation.ValidationException

import java.text.DecimalFormat

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException
import groovy.json.*
import  org.grails.web.json.*

import com.google.gson.JsonObject
import com.google.gson.Gson
import  grails.util.GrailsNameUtils
import gsesuite.peResultsFnames
import java.lang.reflect.*
import java.text.DecimalFormat.*
import java.io.PrintStream;
import groovy.json.JsonSlurper

class ConceptInfoController {

    ConceptInfoService conceptInfoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond conceptInfoService.list(params), model:[conceptInfoCount: conceptInfoService.count()]
    }

    def show(Long id) {
        respond conceptInfoService.get(id)
    }

    def create() {
        respond new ConceptInfo(params)
    }

    def ajaxFindCity = {
        println("From ajax find city and params are"+params)
        // log.debug "Find city:${params.term}"

        def filter = params.radio.toString()


            def foundCities = ConceptInfo.withCriteria {
                ilike 'coname', params.term + '%'
                order("coname", "asc")	 }

            def ans = foundCities?.coname+"(" + foundCities?.conid + ")"
            println("FfoundCities"+ ans)
            render (foundCities?.coname as JSON)




    }


    def testHeatmap()
    {}


    def testD3()
    {

        //get al the celltypes for the given concept id

        //get all the TF factor with thr cell line

        def locusdef= ['5kb','5kb_outside']


        def concept = ConceptInfo.withCriteria {
            ilike('coname', params.q)
            order("coname", "asc")
        }

        def conid = concept.conid.toString().replace("[", "").replace("]","").trim()

        //the filter selecred by user :so for the given user condition extract the file names

        ///***********************************************************************Significant records for the fdr***********************************************************************

        def peakinfotoal = PeakInfo.createCriteria()
        def pifil
        pifil = peakinfotoal.list {
            'in' "fname", PeResult.where {
                conid == conid
                fdr <= 0.7
            }.list().peakfile



        }
        println("consid is $conid.")
        println(pifil.size)
        Double fdrhold = 0.7

        def test2 = PeResult.createCriteria()
        def ptest = test2.list {
            eq("conid", conid)
            le("fdr", fdrhold)
            if(!locusdef.isEmpty())
            {
                'in'("locusdef", locusdef )
            }

        }

        HashMap<String, HashMap<String, Double>>Outer= new HashMap<Integer, HashMap<Integer,Double>>();

        for (int y = 0; y < pifil.size(); y++) {
            def piobj = pifil.getAt(y)
            def cel = piobj.cellline
            def transf = piobj.transF
            def fname = piobj.fname
            def peobj = ptest.findAll { p -> p.peakfile.toString().equals(fname) }

            if(Outer.isEmpty() || !Outer.containsKey(transf))
            {
                HashMap<String, Double> inner = new HashMap<String, Double>();
                inner.put(cel,peobj.pval);
                Outer.put(transf, inner)
            }
            else if(Outer.containsKey(transf)) {
                HashMap<String, Double> inner = (HashMap<String, Double>) Outer.get(transf).clone();
                inner.put(cel, peobj.pval)
                Outer.put(transf, inner)
            }
        }


       // println(Outer)
        //println(Outer.size())
        def cellines = pifil.cellline.unique { a, b -> a <=> b }
        int total = 0 ;
        int r1 =Outer.size() +1; // for total and compounds
        int c1 = cellines.size()+1; // for concpets name
        Object [][] board = new Object[r1][c1];
        ArrayList track = new ArrayList();
        println("matrix no of rows $r1 colrs are  $c1");

        //Running for each compound


        int rowj = 0
        DecimalFormat df = new DecimalFormat("#.######")
        for (Map.Entry me : Outer.entrySet()) {
            int coli = 0;
            if(rowj == 0 )
            {
                if(coli == 0 )
                {
                    board[rowj][coli] = 0;
                    coli++
                }
                if(coli > 0)
                {

                    for (int k = 0; k < cellines.size; k++) {
                        print(cellines.get(k))
                       // println("added at col $coli and row at $rowj and k=$k")
                        board[rowj][coli] = cellines.get(k)
                        coli++

                    }

                }

                rowj++
            }
           // println("Just before the hashmap loop at col $coli and row at $rowj")
            coli =0

            if(rowj > 0)
            {
               // System.out.println("transf: " + me.getKey() + " & cellline pair: " + me.getValue());
                def transf = me.getKey()
                HashMap<String, Double> cellmap = (HashMap<String, Double>) Outer.get(transf).clone();

                if(coli == 0 && rowj !=0)
                {
                   // println("added $transf col $coli and row at $rowj")
                    board[rowj][coli] =transf
                    coli++
                }
                for (int k = 0; k < cellines.size; k++) {
                    def cellcol = cellines.get(k)
                   // println("********checking for cellcol is $cellcol added at col $coli and row at $rowj")
                   // println(cellmap.containsKey(cellcol))
                    if (cellmap.containsKey(cellcol)) {

                       // println("inserted pval for $cellcol")
                        def pvalcell = cellmap.get(cellcol)[0].toDouble()
                        //println("added at col $coli and row at $rowj")
                        board[rowj][coli] = (Math.log10(pvalcell)* -1)
                    }
                    else {
                        board[rowj][coli] = 1
                        //println("inserted 0 for $cellcol")
                    }
                    coli++
                }

                rowj++


            }

                    }







       // println (board)
        UUID uuid = UUID.randomUUID();

        def filename = uuid.toString()+".txt"
        def fpath  = '/Users/snehalpatil/Documents/GithubProjects/gsesuite/heatmaps/'+filename


        PrintStream ps;
        try {
            ps = new PrintStream(new FileOutputStream(fpath));

            for(int row=0;row < board.length;row++){

                for(int col=0; col < board[1].length;col++ ){
                    //System.out.println("column is" + row + "length"+array[row].length+  "value "+ array[row][col]);

                    if(col == (board[1].length-1))
                    {
                        ps.print(board[row][col]+"\n");
                    }
                    else
                    {
                        ps.print(board[row][col]+"\t");
                    }
                }
            }
            ps.close();
        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        }


        String command = "/Users/snehalpatil/Documents/GithubProjects/gsesuite/gsesuite/grails-app/controllers/gsesuite/createJsonscript.py "+"-f test2.txt"



        def cmd = ["/usr/local/bin/python",  "/Users/snehalpatil/Documents/GithubProjects/gsesuite/gsesuite/grails-app/controllers/gsesuite/createJsonscript.py", filename]
        def proc = cmd.execute()
        proc.waitFor()
        println proc?.err?.text
        println("******************")

        def jsonname = fpath.replace(".txt",".json")





        def inputFile = new File(jsonname)
        def InputJSON = new JsonSlurper().parseText(inputFile.text)
         def finaljson = new JsonBuilder(InputJSON).toPrettyString()


       // println(finaljson)



        [finaljson:finaljson]



    }


    def returnTestHeatmap()
    {
        def jsontest=''

    }

    def showConceptInfo() {

        ///***********************************************************************Get paramsr***********************************************************************

        println(params)
        def pubid = params.pubid.toString().replace("[", "").replace("]", "").replaceAll("\\s", "")
        println("type of pubid is ${pubid.getClass()} and==${pubid}")
        def peps
        List<String> pubid2 = new ArrayList<String>(Arrays.asList(params.pubid?.split(",")));
        def fdr = params.fdr.toDouble()
        def pval = params.pval.toString()
        def locusdef= ['5kb','5kb_outside']
        def treatments = params.treatid.toString()
        ArrayList<String> treatmentslis = new ArrayList<String>()
        ArrayList<String> tranFactors = new ArrayList<String>()
        JSONArray ja = new JSONArray();
        List<ReverseQueryOutput> resultrq
        def totchipdata
        def displayfilpi
        def transftreatlist
        def treatmentslis2 =new ArrayList<String>()
        List<String> treatments2 = new ArrayList<String>(Arrays.asList(params.treatid?.split(",")));
        println("treatments2 is $treatments2")
        println(treatments2.size())
        println("pubid2 is $pubid2")
        println(pubid2.isEmpty())


        ///***********************************************************************Get concept info r*******************************************************************

        def concept = ConceptInfo.withCriteria {
            ilike('coname', params.q)
            order("coname", "asc")
        }
        def conid = concept.conid.toString().replace("[", "").replace("]","").trim()
        println("consid is $conid.")
        //the filter selecred by user :so for the given user condition extract the file names

        ///***********************************************************************Significant records for the fdr***********************************************************************

        def peakinfotoal = PeakInfo.createCriteria()
        def pifil
        pifil = peakinfotoal.list {
            'in' "fname", PeResult.where {
                conid == conid
                fdr <= fdr

                if(!locusdef.isEmpty())
                {
                    'in'("locusdef", locusdef )
                }


            }.list().peakfile

            if(!treatments.isEmpty())
            {
                'in'("treatment", treatments2)
            }
            if(!pubid.isEmpty())
            {
                'in'("transF", pubid2)
            }
     projections
                    {
                        groupProperty "transF"
                        count "fname"
                    }
        }



        ///***********************************************************************Total records without the fdr filter**********************************************************************
        def test2 = PeResult.createCriteria()
        def ptest = test2.list {
            eq("conid", conid)
            if(!locusdef.isEmpty())
            {
                'in'("locusdef", locusdef )
            }

        }


        def peakfilelist = ptest.peakfile

        if (ptest.size > 0)
        {

        //From the file name extract the transcription factor
            def peakinfoFilter = PeakInfo.createCriteria()
            def pifilter = peakinfoFilter.list {
            'in'("fname", peakfilelist)
            if(!treatments.isEmpty())
            {
                'in'("treatment", treatments2)
            }
            if(!pubid.isEmpty())
            {
                'in'("transF", pubid2)
            }
            projections {
                groupProperty "transF"
                count "fname"
            }
            }


        def peakinfolist = PeakInfo.createCriteria()
        def pilist = peakinfolist.list {
            'in'("fname", peakfilelist)
           if(!treatments.isEmpty())
            {
                'in'("treatment", treatments2)
            }
            if(!pubid.isEmpty())
            {
                'in'("transF", pubid2)
            }

        }


            /***********************Just to the get list of treatments and transcription factors in the given dataset */


             displayfilpi = PeakInfo.createCriteria()
             transftreatlist = displayfilpi.list {
                'in'("fname", peakfilelist)
            }




            for (int i = 0; i < transftreatlist.size(); i ++)
            {

                String treat = transftreatlist.getAt(i).transF
                 //println(treat)

                    if (!treatmentslis2.contains(treat)) {
                        treatmentslis2.add(treat)
                    }




            }





            /* def peakfile = Peakfilemapping.createCriteria()
              totchipdata = peakfile.list {
                 eq('conid', conid.toString().replace("[", "").replace("]", ""))

             }*/


        DecimalFormat df = new DecimalFormat("#.######")

              for (int i = 0; i < pifilter.size(); i++) {
            JSONObject json = new JSONObject()
            def transf = pifilter.getAt(i)[0]
            def sigcount
            if(pifil.find { p -> p?.getAt(0)?.toString().equals(transf)})
            {
               sigcount = pifil.find { p -> p?.getAt(0)?.toString().equals(transf)}[1]

            }
            else(
                   sigcount =0
            )


            def piobj = pilist.findAll { p -> p.transF.toString().equals(transf) }
            def tfegid = piobj.tfegid[0]
            def tfclean= piobj.tfclean[0]
            def fnames = piobj.fname
            def totchipdataset = totchipdata.findAll { p -> p.tfclean.toString().equals(transf) }
            def fullname

            if(GeneInfo.findByGeneid(tfegid))
            {
                //println("geneinfo tfegid $tfegid")
                def naw = GeneInfo.findByGeneid(tfegid)
                fullname =GeneInfo.findByGeneid(tfegid).fullname


            }
            else {

                fullname =''
            }

           // println("totalchip is $totchipdataset")
            json.put("transf", transf)
            json.put("sigcount", sigcount)
            json.put("totalcount", pifilter.getAt(i)[1])
            json.put("tfegid", tfegid)
            json.put("totalchip", totchipdataset)
            json.put("fullname", fullname)

            JSONArray fja = new JSONArray();

            Double pvalavg = 0.0
            int count = 0
            for (int j = 0; j < fnames.size(); j++) {
                def fname = fnames.get(j).toString().replace("[", "").replace("]", "")
                //println("from the loop $fname and transf $transf")
                JSONObject fjson = new JSONObject()
                def peobj = ptest.findAll { p -> p.peakfile.toString().equals(fname) }

                //println(df.format(peobj.pval[0]))
                fjson.put("fname", fname)

                def peaklist = peobj.peakgenes.toString().replace("[", "").replace("]", "").split(",")
                //println("geneinfo object $peaklist")
                def peakgenenames = ""
                for (pl in peaklist) {
                   // println ("from the peaklist loop $pl")
                    //String fnm = GeneInfo.findByGeneid(pl.trim())?.symbol
                    peakgenenames=pl+"; "+peakgenenames
                   // println ("from the peaklist loop$pl and fnam is $fnm")
                }



                fjson.put("peakgenes", peakgenenames)
                fjson.put("fdr", df.format(peobj.fdr[0]))
                fjson.put("locusdef", peobj.locusdef[0])
                fjson.put("pval", df.format(peobj.pval[0]))

                pvalavg = pvalavg+(Math.log10(peobj.pval[0])* -1)
                count++
                fjson.put("status", peobj.status[0])
                fjson.put("cellline", piobj.find { p -> p.fname.toString().equals(fname) }.cellline.toString().replace("[", "").replace("]", ""))

                //println("***********************    ")
                // println(piobj.find {p -> p.fname.toString().equals(fname) }.cellline)
                def treatmentname= piobj.find { p -> p.fname.toString().equals(fname) }.treatment.toString().replace("[", "").replace("]", "")
                fjson.put("treatment",treatmentname )
                fja.put(fjson)
            }
            json.put("fnames", fja)

            Double finpvalavg= pvalavg/count
            json.put("pvalavg", df.format(finpvalavg))
            ja.put(json)






        }





        Gson gson = new Gson()
        //ReverseQueryOutput rb = gson.fromJson(ja, ReverseQueryOutput.class);

        // Type collectionType = new TypeToken<Collection<ReverseQueryOutput>>(){}.getType();
        // Collection<ReverseQueryOutput> enums = gson.fromJson(ja.toString(), collectionType);

        resultrq = gson.fromJson(ja.toString(), new TypeToken<List<ReverseQueryOutput>>() {
        }.getType());

        //println(ja.treatment)






        for (ReverseQueryOutput trobj : resultrq) {
            String tf = trobj.transf
            if (!tranFactors.contains(tf)) {
                tranFactors.add(tf)
            }


        }

    }
        println(treatmentslis)
        //println(ja.toString())


        [concept:concept,ja:ja.toString(), resultrq:resultrq, treatments:treatments,treatmentslis:treatmentslis2, tf:transftreatlist.transF, pubid:pubid2, fdr:fdr,q:concept.coname.toString().replaceAll("\\[", "").replaceAll("\\]",""),totchipdata:totchipdata]

    }


      def showConcept()
    {
        println(params)

        def concept = ConceptInfo.withCriteria {
            ilike ('coname', params.q)
            order("coname", "asc")	 }


        def conid = concept.conid
        println(conid)
        def peresults2 = PeResult.findAllByConid(conid,params).peakfile

        def peakinfo4 = PeakInfo.createCriteria()
                def pinfo = peakinfo4.list{
                    'in' ("fname" ,peresults2.toList())
                    projections {
                        groupProperty "transF"
                        count "fname"
                    }

                }
        println(pinfo)
        def peresults = PeResult.findAllByConid(conid,params)
        println(peresults.size())
        def combinedres ;
        def peakinfos = []
        for (int i = 0 ; i< peresults.size(); i++)
        {

            def peobj = peresults.get(i)

            def peakfile  = peresults.get(i).peakfile

            def peakinfo = PeakInfo.findAllByFname(peakfile,params)

            println( peakfile)

            def sizep1 = peakinfo.size();

           // println("peakfile is $peakfile peakinfo is $sizep1")

            //right now asssumption is for one peakfile only one tf is available but threr might be many tfs for the peakfile
            //will have to create complex json with tf and many tf



        def test = peakinfo.collect {ids  -> return[ locusdef: peobj.locusdef.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     pval:peobj.pval.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     fdr: peobj.fdr.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     effect:peobj.effect.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     status:peobj.status.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     ngenes: peobj.ngenes.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     npeakgenes: peobj.npeakgenes.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     fname: ids.fname.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     cellline: ids.cellline.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     tfclean:ids.tfclean.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     antibody:ids.antibody.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     institute:ids.institute.replaceAll("\\[", "").replaceAll("\\]",""),
                                                     tfegid:ids.tfegid.replaceAll("\\[", "").replaceAll("\\]","")] }

            peakinfos.add(test)
            def sizep = peakfile.size()

        }
         println(peakinfos as JSON)


        [concept:concept,peresults:peresults,total:peakinfos.size(),peakinfos:peakinfos]
    }




    def Object save(ConceptInfo conceptInfo) {
        if (conceptInfo == null) {
            notFound()
            return
        }

        try {
            conceptInfoService.save(conceptInfo)
        } catch (ValidationException e) {
            respond conceptInfo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'conceptInfo.label', default: 'ConceptInfo'), conceptInfo.id])
                redirect conceptInfo
            }
            '*' { respond conceptInfo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond conceptInfoService.get(id)
    }

    def update(ConceptInfo conceptInfo) {
        if (conceptInfo == null) {
            notFound()
            return
        }

        try {
            conceptInfoService.save(conceptInfo)
        } catch (ValidationException e) {
            respond conceptInfo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'conceptInfo.label', default: 'ConceptInfo'), conceptInfo.id])
                redirect conceptInfo
            }
            '*'{ respond conceptInfo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        conceptInfoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'conceptInfo.label', default: 'ConceptInfo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptInfo.label', default: 'ConceptInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
