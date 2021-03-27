<!DOCTYPE html>


<html>

<! https://bootsnipp.com/snippets/featured/simple-vertical-tab ---!>
    <head>

    <meta name="layout" content="main2" />


    <g:javascript library='jquery'>

        function toggler(divId) {
        alert("inside");
        $("#" + divId).toggle();
    }

        function redirectUrlToTut()
        {

            alert("in the function");

        }

        function myFunction() {


                    var w =window.open('${createLink(action:'peakToGene')}');
                    w.onload = function() { this.document.title = "Concept Information"; }
        }


    </g:javascript>


    <g:javascript library='jquery'>
            $(document).ready(function() {
                $("div.tab-menu>div.list-group>a").click(function(e) {
                    e.preventDefault();
                    $(this).siblings('a.active').removeClass("active");
                    $(this).addClass("active");
                    var index = $(this).index();
                    $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
                    $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
                });


                $('#nologin').on('click', function (event) {


                   var w =window.open('${createLink(action:'chipInput')}');
                    w.onload = function() { this.document.title = "Concept Information"; }

                });

                $('#login').on('click', function (event) {


                   var w =window.open('${createLink(action:'gre')}');
                    w.onload = function() { this.document.title = "Concept Information"; }

                });









            });
    </g:javascript>
    </head>
    <body>
            <div class="container-fluid">
                <div class="row" >
                    <div class="tab-container">
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 tab-menu">
                            <div class="list-group">
                                <a href="#" class="list-group-item active text-left">
                                    Overview
                                </a>
                                <a href="#" class="list-group-item text-left">
                                    Link Genomic Regions to Target Genes
                                </a>
                                <a href="#" class="list-group-item  text-left" >
                                    Genomic Region Enrichment
                                </a>
                                <a href="#" class="list-group-item text-left">
                                    Gene Expression Enrichment
                                </a>
                                <a href="#" class="list-group-item text-left">
                                    Reverse Enrichment Testing
                                </a>

                                <a href="#" class="list-group-item text-left">
                                    Combined Enrichment Genomic Regions + Expression
                                </a>

                            </div>
                        </div>
                        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                            <!-- flight section -->
                            <div class="bhoechie-tab-content active">
                            <h1 style="font-size:30px; text-align: center;">Gene Set Enrichment Suite</h1>
                            <h6>Enrichment testing methods for ChIP-seq, RNA-seq, and other sets of genomic regions</h6>
                        <br/>
                            Recognizing that gene set enrichment (GSE) for gene regulatory data should not be a one-size-fits-all
                            task, GSEsuite offers a variety of methods, resources, and regulatory definitions to choose from. Don’t
                            know what’s best for you? We’ll help determine that based on properties of your data and your goals.
                            %{--Create an account to save and compare results.--}%
                        </br> </br> </br>
                            <div class="col-md-11 text-center nopadding">
                                <div class="spacer"></div>

                            </div>




                        </div>

                            <div class="bhoechie-tab-content">
                                <h2>Link Genomic Regions to Target Genes</h2>
                                <p> Just want to find the target genes for your genomic regions? Upload your set of genomic regions to assign them to target genes based on the selection of regulatory regions, including enhancers, promoters, whole genome, exons, introns, etc. For enhancer to target gene assignments, we use human genome version hg19, however, multiple species and multiple reference genome versions are available for all other regulatory regions. The human enhancer to target gene assignments can be generated by selecting data from a variety of sources and methods.
                                </p>
                                <div class="spacer"></div>


                            </div>

                            <div class="bhoechie-tab-content ">
                                <h2>Genomic Region Enrichment</h2>
                                <span class="ptext">Upload a set of genomic regions to find out which GO terms, pathways,
                                etc are being regulated. Go through each step to choose the most appropriate enrichment
                                testing method, most appropriate type(s) of regulatory regions (e.g., promoters, enhancers, etc),
                                and the desired gene set databases. If desired, the software will use properties of your data and
                                diagnostic plots to help identify your optimal choices.
                                </span>
                                <div class="spacer"></div>
                            </div>

                            <div class="bhoechie-tab-content">
                                <h2>Gene Expression Enrichment</h2>
                                <p>Identify enriched pathways, GO terms, etc, from gene expression data. Choose from a
                                number of different methods and gene set databases, and save your results to compare with
                                others. Visualize multiple experimental results together. Includes optional adjustment for
                                read count level with RNA-seq data.</p>
                                <div class="spacer"></div>
                            </div>

                            <!-- train section -->
                            <div class="bhoechie-tab-content">
                            <h2>Reverse Enrichment Testing</h2>
                            <span class="ptext">Query a pathway, <a href="http://www.geneontology.org/" target="_blank" >GO term</a>
                                or  <a href="https://meshb.nlm.nih.gov/treeView" target="_blank">MeSH term</a>  to find the set of
                            factors and cell types under which its regulated. We will use the most appropriate method for the
                            queried gene set. Output includes a table and visualizations of the experiments, binding proteins,
                            cell types, enrichment results, and list of genes and locations that are significantly associated
                            with the queried term. </p>
                            </span>
                            <div class="spacer"></div>
                            </div>



                            <div class="bhoechie-tab-content">
                                <h2> Combined Enrichment Genomic Regions + Expression</h2>
                                <p>If you have gene expression and ChIP-seq data for the same transcription factor or
                                other binding protein, this allows you to do a combined enrichment analysis.
                                The results will tell you which pathways are: bound by the protein and differentially
                                expressed, bound but not differentially expressed (i.e. poised for regulation),
                                differentially expressed only (secondary effects), or neither.</p>
                                <div class="spacer"></div>


                            </div>

                            <!-- hotel search -->

                            <hr/>
                            <div class="container">
                            <!-- row 1 -->
                            <div class="row">

                                <div class="col-lg-4">
                                    %{--                                <div onclick="myFunction()">--}%
                                    <div>
                                        <g:link controller="inputParam" action="peakToGene"  style="color: black">
                                        <h2><i class="fa fa-database"></i><img style="max-width:50px; margin-top: -7px;"
                                                                               src="${resource(dir: 'images', file: 'pk2gn.png')}">Link Genomic Regions to Target Genes</h2>
                                        <p>
                                            Just want to find the target genes for your genomic regions? Upload your set of genomic regions to assign them to target genes based on the selection of regulatory regions, including enhancers, promoters, whole genome, exons, introns, etc. For enhancer to target gene assignments, we use human genome version hg19, however, multiple species and multiple reference genome versions are available for all other regulatory regions. The human enhancer to target gene assignments can be generated by selecting data from a variety of sources and methods.

                                        </p>
                                        </g:link>
                                        <p><g:link controller="inputParam" class="btn btn-info"  action="peakToGene" target="_blank">Run Analysis </g:link></p>
                                    </div>
                                </div>


                                <div class="col-lg-4">



                                    <h2><i class="fa fa-calculator"></i><img style="max-width:30px; margin-top: -20px;"
                                                                             src="${resource(dir: 'images', file: 'GSELogo2.png')}"> Genomic Region Enrichment</h2>

                                    <span class="ptext">Upload a set of genomic regions to find out which GO terms, pathways, etc are being regulated. Go through each step to choose the most appropriate enrichment testing method, most appropriate type(s) of regulatory regions (e.g., promoters, enhancers, etc), and the desired gene set databases. If desired, the software will use properties of your data and diagnostic plots to help identify your optimal choices.
                                    Use "Narrow" for transcription factor data or other regions up to several hundred bps. Use "Broad" for regions multiple kb or larger in length (e.g. for histone ChIP-seq data).
                                    </span>



                                <br/>

                                <div style="display: inline">

                                <a  class="btn btn-info"  href="http://chip-enrich.med.umich.edu/" target="_blank">Narrow Genomic <br/>Regions</a>
                                    <a  class="btn btn-info"  href="https://broad-enrich.med.umich.edu/" target="_blank">Broad Genomic<br/> Regions</a>

                                </div>


                             %{--   <sec:ifNotLoggedIn>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                        Run Analysis
                                    </button>

                                    <div class="modal fade"data-backdrop="false" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Do you want to login or continue without login? Login will save your input files and
                                                </div>
                                                <div class="modal-footer">
                                                    <g:form  action="news" method="POST" target="_blank">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="button"  id="nologin"  class="btn btn-primary">Continue</button>
                                                        <button type="button"  id="login"  class="btn btn-primary">Login</button>
                                                    </g:form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                </sec:ifNotLoggedIn>
                                <sec:ifLoggedIn>
                                    <p><g:link controller="inputParam" class="btn btn-info"  action="gre">Run Analysis&raquo;</g:link></p>
                                </sec:ifLoggedIn>--}%
                                    <!-- Modal -->
                                    </div>

                            <div class="col-lg-4">
                                <g:link controller="inputParam" action="tutorials"  style="color: black">
                                    <h2><i class="fa fa-barcode"></i><img style="max-width:30px; margin-top: -7px;"
                                                                          src="${resource(dir: 'images', file: 'heatmap.png')}"> Gene Expression Enrichment</h2>

                                    <p>Identify enriched pathways, GO terms, etc, from gene expression data. Choose from a number of
                                    different methods and gene set databases, and save your results to compare with others.
                                    Visualize multiple experimental results together. Includes optional adjustment for read count level
                                    with RNA-seq data.
                                    </p>

                                    <p><a href="http://lrpath.ncibi.org/" target="_blank" class="btn btn-info" target="_blank">Visit site </a></p>
                                    </div>
                                </g:link>

                            </div>

                            </div>

                            <!-- row 2 -->

                            <!-- row 3 -->
                            <br/>
                            <br/>
                            <div class="row">
                                <div class="col-lg-4">



                                    <div>
                    <g:link controller="inputParam" action="tutorials"  style="color: black">

                                        <h2><i class="fa fa-magic"></i><span class="glyphicon glyphicon-refresh"></span> Reverse Enrichment Testing</h2>
                                        Query a pathway, <a href="http://www.geneontology.org/" target="_blank" class="one" >GO term</a> or
                                        <a href="https://meshb.nlm.nih.gov/treeView" class="one"  target="_blank">MeSH term</a>  to
                                    find the set of factors and cell types under which its regulated. We will use the most appropriate
                                    method for the queried gene set. Output includes a table and visualizations of the experiments,
                                    binding proteins, cell types, enrichment results, and list of genes and locations that are significantly
                                    associated with the queried term.
                                    </div>

                    </g:link>

                                    <p>%{--<g:link controller="inputParam" class="btn btn-info"  action="reverseQuery">Coming soon </g:link>--}%
                                        <a href="" class="btn btn-info">Coming Soon</a></p>
                                </div>
                            <div class="col-lg-4">
                                <g:link controller="inputParam" action="tutorials" style="color: black">
                                    <h2><i class="fa fa-database"></i><img style="max-width:30px; margin-top: -7px;"
                                                                           src="${resource(dir: 'images', file: 'combine.png')}"> Combined Enrichment Genomic Regions + Expression</h2>

                                    <p>If you have gene expression and ChIP-seq data for the same transcription factor or other binding protein, this allows you to do a combined enrichment analysis. The results will tell you which pathways are: bound by the protein and differentially expressed, bound but not differentially expressed (i.e. poised for regulation), differentially expressed only (secondary effects), or neither.


                                    </p>
                                </g:link>
                                    %{--<p><g:link controller="inputParam" class="btn btn-info"  action="tutorials">Visit site &raquo;</g:link></p>--}%

                                <a href="" class="btn btn-info">Coming Soon</a>
                                    </div>




                        </div>


                        </div>
                    </div>
                </div>
            </div>

<br/>
    <br/>
    <!-- Main jumbotron for a primary marketing message or call to action -->




        <!-- Example row of columns -->


    </body>
</html>

</html>