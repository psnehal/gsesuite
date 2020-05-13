<!DOCTYPE html>
<html>



<head>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <meta name="layout" content="main3" />

    <title>Genomic Region Enrichment</title>

    <asset:javascript src="validation.js"/>
    <asset:javascript src="menu.js"/>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">




    <style>
    body {
        position: relative;
    }
    ul.nav-pills {
        top: 20px;
        position: fixed;
    }
    div.col-sm-9 div {
        height: 250px;
        font-size: 28px;
    }
    #section1 {color: #fff; background-color: #1E88E5;}
    #section2 {color: #fff; background-color: #673ab7;}
    #section3 {color: #fff; background-color: #ff9800;}
    #section41 {color: #fff; background-color: #00bcd4;}
    #section42 {color: #fff; background-color: #009688;}

    @media screen and (max-width: 810px) {
        #section1, #section2, #section3, #section41, #section42  {
            margin-left: 150px;
        }
    }
    .wizard {
        margin: 20px auto;
        background: #fff;
    }

    .wizard .nav-tabs {
        position: relative;
        margin: 40px auto;
        margin-bottom: 0;
        border-bottom-color: #e0e0e0;
    }

    .wizard > div.wizard-inner {
        position: relative;
    }

    .connecting-line {
        height: 2px;
        background: #e0e0e0;
        position: absolute;
        width: 80%;
        margin: 0 auto;
        left: 0;
        right: 0;
        top: 50%;
        z-index: 1;
    }

    .wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
        color: #555555;
        cursor: default;
        border: 0;
        border-bottom-color: transparent;
    }

    span.round-tab {
        width: 70px;
        height: 70px;
        line-height: 70px;
        display: inline-block;
        border-radius: 100px;
        background: #fff;
        border: 2px solid #e0e0e0;
        z-index: 2;
        position: absolute;
        left: 0;
        text-align: center;
        font-size: 25px;
    }
    span.round-tab i{
        color:#555555;
    }
    .wizard li.active span.round-tab {
        background: #fff;
        border: 2px solid #5bc0de;

    }
    .wizard li.active span.round-tab i{
        color: #5bc0de;
    }

    span.round-tab:hover {
        color: #333;
        border: 2px solid #333;
    }

    .wizard .nav-tabs > li {
        width: 25%;
    }

    .wizard li:after {
        content: " ";
        position: absolute;
        left: 46%;
        opacity: 0;
        margin: 0 auto;
        bottom: 0px;
        border: 5px solid transparent;
        border-bottom-color: #5bc0de;
        transition: 0.1s ease-in-out;
    }

    .wizard li.active:after {
        content: " ";
        position: absolute;
        left: 46%;
        opacity: 1;
        margin: 0 auto;
        bottom: 0px;
        border: 10px solid transparent;
        border-bottom-color: #5bc0de;
    }

    .wizard .nav-tabs > li a {
        width: 70px;
        height: 70px;
        margin: 20px auto;
        border-radius: 100%;
        padding: 0;
    }

    .wizard .nav-tabs > li a:hover {
        background: transparent;
    }

    .wizard .tab-pane {
        position: relative;
        padding-top: 50px;
    }

    .wizard h3 {
        margin-top: 0;
    }

    @media( max-width : 585px ) {

        .wizard {
            width: 90%;
            height: auto !important;
        }

        span.round-tab {
            font-size: 16px;
            width: 50px;
            height: 50px;
            line-height: 50px;
        }

        .wizard .nav-tabs > li a {
            width: 50px;
            height: 50px;
            line-height: 50px;
        }

        .wizard li.active:after {
            content: " ";
            position: absolute;
            left: 35%;
        }
    }

    </style>


    <g:javascript library='jquery'>





        $(function () {



            $('.closeall').click(function () {
                $('.panel-collapse.in')
                        .collapse('hide');
            });

            $('.openall').click(function () {
                $('.panel-collapse:not(".in")')
                        .collapse('show');
            });

            $("#addpro").click(function(){
                $('#geneList').html('>sp|P04637|P53_HUMAN Cellular tumor antigen p53 OS=Homo sapiens OX=9606 GN=TP53 PE=1 SV=p; &nbsp;\n  sMEEPQSDPSVEPPLSQETFSDLWKLLPENNVLSPLPSQAMDDLMLSPDDIEQWFTEDPGPDEAPRMPEAAPPVAPAPAAPTPAAPAPAPSWPLSSSVPSQKTYQGSYGFRLGFLHSGTAK'
                +'SVTCTYSPALNKMFCQLAKTCPVQLWVDSTPPPGTRVRAMAIYKQSQHMTEVVRRCPHHERCSDSDGLAPPQHLIRVEGNLRVEYLDDRNTFRHSVVVPYEPPEVGSDCTTIHYNYMCNS'
                +'SCMGGMNRRPILTIITLEDSSGNLLGRNSFEVRVCACPGRDRRTEEENLRKKGEPHHELPPGSTKRALPNNTSSSPQPKKKPLDGEYFTLQIRGRERFEMFRELNEALELKDAQAGKEPG'
                +'GSRAHSSHLKSKKGQSTSRHKKLMFKTEGPDSD');
            });



        });


        var sel ;
        function doExport() {
			  var id= $('input:radio[name=fil]:checked').val();
			  if(id == "concept")
			{
						  $('#city').autocomplete({
						            source: '<g:createLink controller="ConceptInfo" action="ajaxFindCity" params="[radio:'id']"/>' });
				  }
			  else
				  {
				  $('#city').autocomplete({

				            source: '<g:createLink controller="ConceptInfo" action="ajaxFindCity" params="[radio:'name']"/>'
             			 });
				  }
			   jQuery(function () {
	                jQuery("[name='passsel']").submit(function () {
	                    jQuery("[name='id']").val(id);
	                });
	            });



			}


    </g:javascript>


    <g:javascript>
    </g:javascript>

    <g:javascript library='jquery'>

        function toggler(divId) {
            alert("inside");
            $("#" + divId).toggle();
        }
    </g:javascript>


    <g:javascript library='jquery'>
        $(document).ready(function() {


            var select = doExport();

            //Wizard
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                var $target = $(e.target);

                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });

            $(".next-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);

            });
            $(".prev-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                prevTab($active);

            });


            function nextTab(elem) {
                $(elem).next().find('a[data-toggle="tab"]').click();
            }
            function prevTab(elem) {
                $(elem).prev().find('a[data-toggle="tab"]').click();
            }

            $("div.tab-menu>div.list-group>a").click(function(e) {
                e.preventDefault();
                $(this).siblings('a.active').removeClass("active");
                $(this).addClass("active");
                var index = $(this).index();
                $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
                $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
            });

            $("#assoc_btn").click(function(){
                var thislink = $(this);
                $("#assocRules").toggle()
                thislink.html().indexOf("Show") == 0 ? thislink.html("Hide settings &raquo;") : thislink.html("Show settings &raquo;");
            });


        });
    </g:javascript>


</head>

<body onload="myFunction2()">
<div class="container-fluid">
    <div class="row" >
        <div class="tab-container">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 tab-menu">
                <div class="list-group">

                    <a href="#" class="list-group-item  text-left"  style="font-size: 18px;">
                        Genomic Region Enrichment
                    </a>
                    <a href="#" class="list-group-item  active text-left" style="font-size: 18px;">
                        Reverse Enrichment Testing
                    </a>
                    <a href="#" class="list-group-item  text-left" style="font-size: 18px;">
                        Peak to Gene Assignment
                    </a>
                    <a href="#" class="list-group-item text-left" style="font-size: 18px;">
                        Combined Enrichment Genomic Regions + Expression
                    </a>
                    <a href="#" class="list-group-item text-left" style="font-size: 18px;"  >
                        Gene Expression Enrichment
                    </a>
                </div>









            </div>

            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <!-- flight section -->

                <div class="bhoechie-tab-content " style="font-size: 16px">
                    <h7>Genomic Region Enrichment</h7><br/>
                    <span class="ptext">Upload a set of genomic regions to find out which GO terms, pathways,
                    etc are being regulated. Go through each step to choose the most appropriate enrichment
                    testing method, most appropriate type(s) of regulatory regions (e.g., promoters, enhancers, etc),
                    and the desired gene set databases. If desired, the software will use properties of your data and
                    diagnostic plots to help identify your optimal choices.
                    </span>
                    <div class="spacer"></div>
                </div>

                <!-- train section -->
                <div class="bhoechie-tab-content active">
                    <h7>Reverse Enrichment Testing</h7><br/>
                    <span class="ptext">Query a pathway, <a href="http://www.geneontology.org/" target="_blank" >GO term</a>
                        or  <a href="https://meshb.nlm.nih.gov/treeView" target="_blank">MeSH term</a>  to find the set of
                    factors and cell types under which its regulated. We will use the most appropriate method for the
                    queried gene set. Output includes a table and visualizations of the experiments, binding proteins,
                    cell types, enrichment results, and list of genes and locations that are significantly associated
                    with the queried term. </p>
                    </span>
                    <div class="spacer"></div>
                </div>

                <div class="bhoechie-tab-content ">
                    <h7>Peak to Gene Assignment </h7>
                    <p>Just want to find the target genes for your genomic regions?  Upload your set of genomic regions to assign them to genes based on any of our
                        <a href="#" data-toggle="tooltip" class="one" title="A Locus Definition where a gene locus is defined as the region spanning the midpoints between adjacent TSSs and TESs.!">Gene Locus definition</a></span>
                        nearest TSS, <1kb from a TSS, <5kb from a TSS, exons, introns, enhancers, etc</p>
                    <div class="spacer"></div>
                </div>

                <div class="bhoechie-tab-content">
                    <h7> Combined Enrichment Genomic Regions + Expression</h7>
                    <p>If you have gene expression and ChIP-seq data for the same transcription factor or
                    other binding protein, this allows you to do a combined enrichment analysis.
                    The results will tell you which pathways are: bound by the protein and differentially
                    expressed, bound but not differentially expressed (i.e. poised for regulation),
                    differentially expressed only (secondary effects), or neither.</p>
                    <div class="spacer"></div>
                </div>

                <!-- hotel search -->
                <div class="bhoechie-tab-content">
                    <h7>Gene Expression Enrichment</h7>
                    <p>Identify enriched pathways, GO terms, etc, from gene expression data.
                    Choose from a number of different methods and gene set databases, and save
                    your results to compare with others. Visualize multiple experimental results
                    together. Includes optional adjustment for read count level with RNA-seq data.</p>
                    <div class="spacer"></div>
                </div>


                <br/>
                <hr/>


                <h2 style="text-align: center   "> Analysis </h2>
                <div class="container-fluid" style="text-align: center">



                 <div class="row">

                    <g:form controller="ConceptInfo" action="showConceptInfo" method="post" id="upform" name="upform" enctype="multipart/form-data">

                    Search By :  <g:radioGroup name="fil" id="radio" values="['id','name']" labels = "['Concept ID',' Concept Name']">${it.radio} <g:message code="${it.label}" />
                    </g:radioGroup></span>
                        <br/>
                        <br/>
                        Currently all data used for this test is human (hg19).<br/>
                        <br/>
                        <g:textField name="q" id="city" value="${params.q}"/>
                        <g:hiddenField name="fdr" value="0.05" />
                        <g:set var="locusdef" value="['5kb','5kb_outside']"/>
                        <g:hiddenField name="pubid" value="" />
                        <g:hiddenField name="treatid" value="" />
                        <g:submitButton name="Search" class="submit"/>
                        <br/>

                    </g:form>
                    </div>


                </div>
            </div>

</body>
</html>



