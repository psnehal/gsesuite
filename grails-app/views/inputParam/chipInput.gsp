<!DOCTYPE html>
<html>



<head>


    <meta name="layout" content="main3" />

    <title>Genomic Region Enrichment</title>
    <asset:javascript src="validation.js"/>
    <asset:javascript src="menu.js"/>


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


        });

        function myFunction() {
            document.getElementById("demo").innerHTML = " your test is hybrid";
            alert("your test is hybrid");
        }


        function openModal() {
            //alert(document.getElementById("uploadfile").files.length);
            if(document.getElementById("uploadfile").files.length > 0) {
                var mymodal = $('#myModal');

                alert(mymodal.title);

                var bodytext=    '<span class="formText">Number of distinct genomic regions (after merging overlapping regions):</span>'
                                + '<input type="text" name="maxG" size="7"  class="formObject" value="" />'
                                +'<br/>'
                                +'<span class="formText">Median width of genomic region:        </span>'
                                +'<input type="text" name="maxG" size="7"  class="formObject" value="" />'
                                +'<br/>'
                                +'<span class="formText">Widths of genomic regions have a 5th percentile of <input type="text" name="maxG" size="7"  class="formObject" value="" />      bp, and a 95th percentile of <input type="text" name="maxG" size="7"  class="formObject" value="" /> </span>'
                                +'<div class="form-group">'
                                +'<label class="control-label">Based on these values we recommend:</label></div>'
                                +'<div class="modal-footer"><button type="button"  class="btn btn-default" onclick="myFunction()" data-dismiss="modal">Get Results</button></div>'
                                +'<p id="demo"></p>';



                        mymodal.find('.modal-body').html(bodytext);

                //mymodal.find('.modal-title').text('Recommendation for enrichment method:');

                //mymodal.modal({show:true});

                //window.location.href ='http://localhost:8080/iputParam/displayRecommendation';

               var w= window.open('${createLink(action:'displayRecommendation')}?q=0'+"_blank",'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no, width=400,height=150');
             w.onload = function() { this.document.title = "Recommendation for enrichment method:"; }

            }
            else
            {

                var mymodal = $('#myModal');
                //mymodal.find('.modal-body').text('Please upload the file first');
                //mymodal.modal('show');
                alert("please upload the file first")

            }

        }



        function selectAllGO() {

            if (document.getElementById("go").checked == false) {
                document.getElementById("gobio").checked = false;
                document.getElementById("gocell").checked = false;
                document.getElementById("gomol").checked = false;
            } else {
                document.getElementById("gobio").checked = true;
                document.getElementById("gocell").checked = true;
                document.getElementById("gomol").checked = true;
            }
        }
        function myFunction2(){
                var x = document.getElementById("myFile");
                var txt = "";
                if ('files' in x) {
                    if (x.files.length == 0) {
                        txt = "Select one or more files.";
                    } else {
                        for (var i = 0; i < x.files.length; i++) {
                            txt += "<br><strong>" + (i+1) + ". file</strong><br>";
                            var file = x.files[i];
                            if ('name' in file) {
                                txt += "name: " + file.name + "<br>";
                            }
                            if ('size' in file) {
                                txt += "size: " + file.size + " bytes <br>";
                            }
                        }
                    }
                }
                else {
                    if (x.value == "") {
                        txt += "Select one or more files.";
                    } else {
                        txt += "The files property is not supported by your browser!";
                        txt  += "<br>The path of the selected file: " + x.value; // If the browser does not support the files property, it will return the path of the selected file instead.
                    }
                }
               // alert(document.getElementById("demo2").innerHTML);
                document.getElementById("demo2").innerHTML = txt;
            }

              $("#myFile").change(function () {
            var formData = new FormData();
            formData.append('file', this.files[0]);

            alert("got in");

            $("#files").append($("#fileUploadProgressTemplate").tmpl());
            $("#fileUploadError").addClass("hide");

            $.ajax({
                url: '/echo/json/',
                type: 'POST',
                xhr: function () {
                    var xhr = $.ajaxSettings.xhr();
                    if (xhr.upload) {
                        xhr.upload.addEventListener('progress', function (evt) {
                            var percent = (evt.loaded / evt.total) * 100;
                            $("#files").find(".progress-bar").width(percent + "%");
                        }, false);
                    }
                    return xhr;
                },
                success: function (data) {
                    $("#files").children().last().remove();
                    $("#files").append($("#fileUploadItemTemplate").tmpl(data));
                    $("#uploadFile").closest("form").trigger("reset");
                },
                error: function () {
                    $("#fileUploadError").removeClass("hide").text("An error occured!");
                    $("#files").children().last().remove();
                    $("#uploadFile").closest("form").trigger("reset");
                },
                data: formData,
                cache: false,
                contentType: false,
                processData: false
            }, 'json');
        });
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

                    <a href="#" class="list-group-item active text-left"  style="font-size: 18px;">
                        Genomic Region Enrichment
                    </a>
                    <a href="#" class="list-group-item text-left" style="font-size: 18px;">
                        Reverse Enrichment Testing
                    </a>
                    <a href="#" class="list-group-item text-left" style="font-size: 18px;">
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

                <div class="bhoechie-tab-content active" style="font-size: 16px">
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
                <div class="bhoechie-tab-content">
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

                <div class="bhoechie-tab-content">
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
                <!-- Main jumbotron for a primary marketing message or call to action -->

                <div class="panel-group" id="accordion">

                <div class="panel-heading">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">

                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                               href="#collapse1"><span class="contentTitle">Step 1: Upload a File(s)</span></a>
                        </h4>
                    </div>


                    <g:form action="subJob" method="post" id="upform" name="upform"
                            enctype="multipart/form-data">
                        <div id="collapse1" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table>
                                    <tr><td align="right" valign="top"><span class="formText"><b>Input file</b>
                                        <td><input type="file" name="myfile" id="myFile" multiple size="50" onchange="myFunction2()">
                                            <p id="demo2"></p>
                                            <br/>
                                            OR
                                            <div class="dropdown">
                                                <g:select  size="5" name="flist" from="${list}" value="list.name"
                                                           noSelection="['':'Please Select...']"/>



                                            </div>
                                            <span class="footnote">
                                                ChIP-Enrich supports .bed.gz, .bed, .broadPeak, .narrowPeak, .bed.gff, and .bed.gff3 files. Files with any other extension
                                                should have a header row including "chrom", "start", and "end" to indicate chromosomal locations.
                                            </span>
                                            <br/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right" valign="top"><span class="formText"><b>Analysis Name</b>
                                        </span>
                                        </td>
                                        <td><input id="outname" type="text" name="outname" size="30" class="formObject"
                                                   onChange="validate(this);"> <br/>
                                            <span class="footnote">
                                                Please provide a meaningful name for this analysis (used to name output files).
                                            </span>
                                            <br/> <br/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right" valign="top"><span class="formText"><b>Email</b></span>
                                        </td>
                                        <td><input id="email" type="text" name="email" size="30"
                                                   class="formObject"> <br/>
                                            <span class="footnote">Please provide your email address if you wish to be notified when the analysis has been completed.</span>

                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </div>
                        </div>




                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapse3"><span
                                            class="contentTitle">Step 2: Choose a Locus Definition (the set of regulatory regions and their target genes)</span>
                                    </a>
                                </h4>
                            </div>

                            <div id="collapse3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <table>
                                        <tr>
                                            <td align="right" valign="top"><span class="formText"><b>Locus Definition</b>
                                            </span></td>
                                            <td>
                                                <div id="locusdefinations">
                                                    <ul class="b">

                                                        <li><input type="radio" name="ld" value="nearest_tss" checked="checked"
                                                                   onClick="warnForFet(this)"/><span
                                                                class="formText2">Nearest TSS<br/><img style="max-width:300px; margin-top: -7px;"
                                                                                                        src="${resource(dir: 'images', file: 'neartss.png')}"></span><br/>
                                                            <span class="footnote">(use all peaks; assign peaks to the gene with the closest TSS)</span>
                                                        </li>
                                                    </ul>

                                                    <div class="input">
                                                        <a href="javascript:void(0)" id="assoc_btn" class="btn" style="margin-top: 10px">Show more options &raquo;</a>
                                                    </div>
                                                    <div id="assocRules" style="display:none">
                                                        <ul class="b">
                                                            <li><input type="radio" name="ld" value="1kb"/><span class="formText2">Proximal promoter regions (< 1kb)<br/><img style="max-width:150px; margin-top: -7px;" src="${resource(dir: "images", file: "1kb.png")}"></span><br/>
                                                                <span class="footnote">(only use peaks within 1kb of a transcription start site)</span>
                                                            </li>
                                                            <li><input type="radio" name="ld" value="5kb"/><span class="formText2">Mid-range promoter regions (< 5kb) <br/><img style="max-width:180px; margin-top: -7px;" src="${resource(dir: "images", file: "5kb.png")}"></span><br/>
                                                                <span class="footnote">(only use peaks within 5kb of a transcription start site)</span>
                                                            </li>
                                                            <li><input type="radio" name="ld" value="10kb"/><span class="formText2">Broad promoter regions (< 10kb) <br/><img style="max-width:210px; margin-top: -7px;" src="${resource(dir: "images", file: "10kb.png")}"></span><br/>
                                                                <span class="footnote">(only use peaks that are 10kb or more upstream of a transcription start site)</span>
                                                            </li>
                                                            <li><input type="radio" name="ld" value="10kboutside"/><span class="formText2"> Distal regions only <br/><img style="max-width:200px; margin-top: -7px;"src="${resource(dir: "images", file: "10kboutside.png")}"></span><br/>
                                                                <span class="footnote">(only use peaks within 10kb and more upstream of a transcription start site)</span>
                                                            </li>
                                                            <li><input type="radio" name="ld" value="exon" onClick="warnForFet(this)"/><span class="formText2">Exons <br/> <img style="max-width:200px; margin-top: -7px;"src="${resource(dir: "images", file: "exon.png")}"></span><br/>
                                                                <span class="footnote">(only use peaks that fall within an annotated exon)</span>
                                                            </li>
                                                            <li><input type="radio" name="ld" value="intron" onClick="warnForFet(this)"/><span class="formText2">Introns <br/><img style="max-width:200px; margin-top: -7px;" src="${resource(dir: "images", file: "intron.png")}"></span><br/>
                                                                <span class="footnote">(only use peaks that fall within an annotated itron)</span>
                                                            </li>
                                                            <li><input type="radio" name="ld" value="nearest_gene" onClick="warnForFet(this)"/><span class="formText2">Nearest Gene<br/><img style="max-width:300px; margin-top: -7px;"src="${resource(dir: "images", file:"neargene.png")}"></span><br/>
                                                                <span class="footnote">(use all peaks; assign peaks to the nearest gene defined by transcription start and end sites)</span>
                                                            </li>
                                                            <li><input type="radio" name="ld" value="nearest_tss" checked="checked" onClick="warnForFet(this)"/><span class="formText2">Nearest TSS<br/><img style="max-width:300px; margin-top: -7px;"src="${resource(dir: "images", file:"neartss.png")}"></span><br/>
                                                                <span class="footnote">(use all peaks; assign peaks to the gene with the closest TSS)</span>'
                                                            </li>
                                                            <li><input type="radio" name="ld" value="user" onClick="UploadLdFile(this)"/><span class="formText2">User Defined</span><br/>
                                                                <span class="footnote">(user can input their own locus definition)</span>
                                                                <div id ="upldfile"></div>
                                                            </li>
                                                        </ul>;
                                                    </div>




                                                </div>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapse2"><span class="contentTitle">Step 3: Find the Optimal Test</span></a>
                                </h4>
                            </div>

                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <table>
                                        <tr>

                                            <td align="right" valign="top"><span class="formText"><b>Enrichment Method</b>
                                            </span></td>
                                            <td>
                                                <div id="methods">
                                                    <ul>
                                                        <li>
                                                            <div class="bs-example">
                                                                <!-- Button HTML (to Trigger Modal) -->
                                                                Get <a onclick="openModal();"
                                                                       data-toggle="modal">our recommendation</a> or choose from below</a>
                                                                <!-- Modal HTML -->
                                                                <div id="myModal" class="modal fade">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close"
                                                                                        data-dismiss="modal"
                                                                                        aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title">Recommendation for enrichment method:</h4>
                                                                            </div>


                                                                            <div class="modal-body">

                                                                                <span class="formText">Number of distinct genomic regions (after merging overlapping regions):</span>
                                                                                <input type="text" name="maxG" size="7"  class="formObject" value="45000" />

                                                                                <br/>

                                                                                <span class="formText">Median width of genomic region:        </span>
                                                                                <input type="text" name="maxG" size="7"  class="formObject" value="452" />

                                                                                <br/>


                                                                                <span class="formText">Widths of genomic regions have a 5th percentile of <input type="text" name="maxG" size="7"  class="formObject" value="218" />      bp, and a 95th percentile of <input type="text" name="maxG" size="7"  class="formObject" value="551" /> </span>


                                                                                <br/>



                                                                                <div class="form-group">
                                                                                    <label class="control-label">Based on these values we recommend:</label>

                                                                                </div>

                                                                                <div class="modal-footer"><button type="button"  class="btn btn-default" onclick="myFunction()" data-dismiss="modal">Get Results</button></div>


                                                                            </form>




                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                            </div>

                                                        </li>

                                                        <li><input type="radio" name="method" class="formObject"
                                                                   value="chipenrich" checked="checked"/>
                                                            <span class="formText2"><b>Chip-Enrich</b>
                                                                -Models the probability that a gene has ≥1 genomic region. Assumes a single binding site is sufficient for regulation. Works best for datasets with ~<10,000 narrow genomic regions (i.e. most genomic regions are <1kb in width)</span>
                                                        </li>



                                                        <li><input type="radio" name="method" class="formObject"
                                                                   value="fet"/><span
                                                                class="formText2"><b>Poly-Enrich</b> – Models the number of genomic regions per gene. Assumes regulation is incremental. Works best for datasets with ~>60,000 narrow genomic regions</span>
                                                        </li>
                                                        <li><input type="radio" name="method" class="formObject"
                                                                   value="fet"/><span
                                                                class="formText2"><b>Hybrid test</b> – Uses both ChIP-Enrich and Poly-Enrich, choosing the best for each gene set and appropriately correcting for multiple testing. Recommended for datasets with ~10,000 – 60,000 genomic regions.</span>
                                                        </li>
                                                        <li><input type="radio" name="method" class="formObject"
                                                                   value="chipenrich"/><span
                                                                class="formText2"><b>Broad-Enrich</b> – Models the proportion of a gene’s locus covered by the genomic regions. Works best for broad genomic regions that may span multiple gene loci (e.g. histone modification peak datasets)</span>
                                                        </li>
                                                        <li><input type="radio" name="method" class="formObject"
                                                                   value="chipenrich"/><span
                                                                class="formText2"><b>Fisher’s Exact test</b> – Similar to ChIP-Enrich, this models the probability that a gene has ≥1 genomic region. However, it does not correct for different gene locus lengths.</span>
                                                        </li>

                                                    </ul>
                                                </div>
                                                <span class="footnote">
                                                    We recommend using Fisher's Exact test only with the 1kb or 5kb locus definition.
                                                    Using it with any of the other locus definitions may result in biased enrichment results.
                                                </span>
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </div>
                        </div>


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapse4"><span
                                            class="contentTitle">Step 4:Choose your Annotation Database(s)</span></a>
                                </h4>
                            </div>

                            <div id="collapse4" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class=" col-md-5  text-center">
                                        <table>
                                            <tr>
                                                <td align="right" valign="top"><span
                                                        class="formText"><b>Supported Genomes</b></span></td>
                                                <td><select name="sglist" id="sglist" size="1" class="formObject"
                                                            onChange="selectMappaOption();">
                                                    <option value="">Select Genome</option>
                                                    <option value="hg19">Human (hg19)</option>
                                                    <option value="mm9">Mouse (mm9)</option>
                                                    <option value="mm10">Mouse (mm10)</option>
                                                    <option value="rn4">Rat (rn4)</option>
                                                    <option value="dm3">D. melanogaster (dm3)</option>
                                                </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top"><span
                                                        class="formText"><b>Annotation Databases</b></span>
                                                </td>
                                                <td>
                                                    <div id="databaseList">

                                                        <ul class="checklist">
                                                            <li><label>Functional Annotations</label>
                                                                <ul>
                                                                    <li><label><input name="slist" value="biocarta_pathway" type="checkbox"/><a href="http://www.biocarta.com/">Biocarta Pathway</a>
                                                                    </label>
                                                                    </li>
                                                                    <li><label><input name="slist" value="ehmn_pathway_gene" type="checkbox"/><a href="http://www.ehmn.bioinformatics.ed.ac.uk">EHMN
                                                                    metabolic pathways</a>
                                                                    </label>
                                                                    </li>

                                                                    <li><label><input name="slist" value="GO" type="checkbox" id="go" onclick="selectAllGO()"/><a href="http://www.geneontology.org/">Gene Ontology (GO)</a>
                                                                    </label>
                                                                        <ul style="margin-left: 5em">
                                                                            <li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/><a href="http://www.geneontology.org/">GO Biological
                                                                            Process</a>
                                                                            </label>
                                                                            </li>
                                                                            <li><label><input name="slist" value="GOCC" id="gocell" type="checkbox"/><a href="http://www.geneontology.org/">GO Cellular
                                                                            Component</a>
                                                                            </label>
                                                                            </li>
                                                                            <li><label><input name="slist" value="GOMF" id="gomol" type="checkbox"/><a href="http://www.geneontology.org/">GO Molecular
                                                                            Function</a>
                                                                            </label>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><label><input name="slist" value="kegg_pathway" type="checkbox"/><a href="http://www.genome.jp/kegg/">KEGG Pathway</a>
                                                                    </label>
                                                                    </li>
                                                                    <li><label><input name="slist" value="panther_pathway" type="checkbox"/><a href="http://www.pantherdb.org/pathway/">Panther
                                                                    Pathway</a>
                                                                    </label>
                                                                    </li>
                                                                    <li><label><input name="slist" value="pfam" type="checkbox"/><a href="http://pfam.sanger.ac.uk/">pFAM</a>
                                                                    </label>
                                                                    </li>
                                                                    <li><label><input name="slist" value="reactome" type="checkbox"/><a href="http://www.reactome.org/">Reactome</a>
                                                                    </label>
                                                                    </li>
                                                                </ul></li>
                                                            <li><label>Literature Derived</label>
                                                                <ul>
                                                                    <li><label><input name="slist" value="mesh" type="checkbox"/><a href="http://gene2mesh.ncibi.org/">MeSH</a>
                                                                    </label>
                                                                    </li>


                                                                </ul></li>

                                                            <li><label>MSigDB Derived</label>
                                                                <ul>
                                                                    <li><label><input name="slist" value="hallmark" type="checkbox"/><a href="http://software.broadinstitute.org/gsea/msigdb/collections.jsp">Hallmark</a></label></li>
                                                                    <li><label><input name="slist" value="immunologic" type="checkbox"/><a href=http://software.broadinstitute.org/gsea/msigdb/collections.jsp">Immunologic</a></label></li>
                                                                    <li><label><input name="slist" value="oncogenic" type="checkbox"/><a href="http://software.broadinstitute.org/gsea/msigdb/collections.jsp">Oncogenic</a></label></li>


                                                                </ul></li>


                                                            <li><label>Targets</label>
                                                                <ul>
                                                                    <li><label><input name="slist" value="ctd" type="checkbox"/><a href="http://ctdbase.org/">Comparative Toxicogenomics Database (CTD) </a>
                                                                    </label>
                                                                    </li>
                                                                    <li><label><input name="slist" value="drug_bank" type="checkbox"/><a href="http://www.drugbank.ca/">Drug Bank</a>
                                                                    </label>
                                                                    </li>
                                                                    <li><label><input name="slist" value="microrna" type="checkbox"/><a href=http://software.broadinstitute.org/gsea/msigdb/collections.jsp">MicroRNA</a>
                                                                    </label>
                                                                    </li>
                                                                    <li><label><input name="slist" value="transcription_factors" type="checkbox"/><a href="http://biobase-international.com/index.php?id=transfac">Transcription
                                                                    Factors</a>
                                                                    </label>
                                                                    </li>
                                                                </ul></li>
                                                            <li><label>Interaction</label>
                                                                <ul>
                                                                    <li><label><input name="slist" value="protein_interaction_biogrid" type="checkbox"/><a href="https://thebiogrid.org">Protein
                                                                    Interaction BioGRID</a>
                                                                    </label>
                                                                    </li>
                                                                </ul></li>
                                                            <li><label>Other</label>
                                                                <ul>
                                                                    <li><label><input name="slist" value="metabolite" type="checkbox"/><a href="http://www.ncibi.org">Metabolite</a>
                                                                    </label>
                                                                    </li>
                                                                    <li><label><input name="slist" value="cytoband" type="checkbox"/><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=gene">Cytoband</a>
                                                                    </label>
                                                                    </li>

                                                                </ul>
                                                                <br/>

                                                            <li><label>Custom</label>
                                                                <ul>
                                                                    <li><label><input name="slist" value="custom" type="checkbox"  onchange="selectCustomFile()" /><a href="">Custom</a></label>
                                                                        <input id="uploadCustomfile" type="file" name="uploadcustomfile" size="30" class="formObject" onchange="uploadFile()"></li>

                                                                    <p><span class="footnote">To test custom gene sets,file should be defined in tab-delimited text file with the first column geneset ID or name, and the Entrez IDs belonging to the geneset.
                                                                    An example is provided <a href="images/custeg.txt" target="_blank">here</a></span></p></span>



                                                                </ul>
                                                                <br/>



                                                            <li><label>Select All Datatbases</label>
                                                                <ul>
                                                                    <li><label><input name="slist2"   value="selectall" type="checkbox"  onchange="selectAllDb(this)"/><a href="http://www.ncbi.nlm.nih.gov/sites/entrez?db=gene">SelectAll</a>
                                                                    </label>
                                                                    </li>
                                                                </ul>


                                                        </ul>

                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapse5"><span
                                            class="contentTitle">Step 5:  Weighting and Filtering (optional)</span></a>
                                </h4>
                            </div>

                            <div id="collapse5" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <table>
                                        <tr>
                                            <td align="right" valign="top"><span class="formText"><b>coming soon</b>
                                            </span></td>
                                            <td>

                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </div>
                        </div>

                        </div>

                        <div class=" spacer"></div>

                        <a href="#" class="btn btn-default openall">open all</a> <a href="#"
                                                                                    class="btn btn-default closeall">close all</a>
                        <hr>

                        <div align="center">
                            <g:submitButton name="submit" onclick="validateForm()" class="upload" value="upload"
                                            style="color: #0F226E;padding: 10px 32px; font-family: Georgia, serif;border-radius: 8px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19); font-size: 15px;;font-style:bold;"/>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>




</div>
</div>
</div>
</div>


</body>
</html>
