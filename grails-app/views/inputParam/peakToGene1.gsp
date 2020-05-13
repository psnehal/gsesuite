<!DOCTYPE html>
<html>



<head>


    <meta name="layout" content="main3" />

    <title>Genomic Region Enrichment</title>
    <asset:javascript src="validation.js"/>
    <asset:javascript src="menu.js"/>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
            $('.nav-tabs > li a[title]').tooltip();

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
<div class="container-fluid">
    <div class="row">
        <section>
            <div class="wizard">
                <div class="wizard-inner">
                    <div class="connecting-line"></div>
                    <ul class="nav nav-tabs" role="tablist">

                        <li role="presentation" class="active">
                            <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                                <span class="round-tab">
                                    <i class="glyphicon glyphicon-folder-open"></i>
                                </span>
                            </a>
                        </li>

                        <li role="presentation" class="disabled">
                            <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                                <span class="round-tab">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </span>
                            </a>
                        </li>
                        <li role="presentation" class="disabled">
                            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                                <span class="round-tab">
                                    <i class="glyphicon glyphicon-picture"></i>
                                </span>
                            </a>
                        </li>

                        <li role="presentation" class="disabled">
                            <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                                <span class="round-tab">
                                    <i class="glyphicon glyphicon-ok"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>

                <form role="form">
                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="step1">
                            <h3>Step 1: Choose one or more methods to define enhancer regions?</h3>
                            <table>
                                <tr>
                                    <th>
                                        Method
                                    </th>
                                    <th>All type list</th>
                                    <th>No of enhancer</th>
                                </tr>

                                <tr>
                                    <td><label><input name="slist" value="fantom5"  type="checkbox"/>Fantom5
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label><input name="slist" value=""  type="checkbox"/>Encode cell specific
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label><input name="slist" value="thurman"  type="checkbox"/>Therman
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label><input name="slist" value="thurman"  type="checkbox"/>Chromhmm
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>


                            </table>
                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step2">
                            <h3>Step 2: Method used for enhancer gene targets.</h3>

                                            <ul>
                                                <li><label><input name="slist" value="GOBP" id="p1" type="checkbox"/> P2P
                                                </label>
                                                </li>
                                                <li><label><input name="slist" value="GOBP" id="t1" type="checkbox"/> Thurman
                                                </label>
                                                </li>
                                                <li><label><input name="slist" value="GOBP" id="gobio3" type="checkbox"/> Fantom
                                                </label>
                                                </li>
                                                <li><label><input name="slist" value="GOBP" id="gobio4" type="checkbox"/> chromhmm
                                                </label>
                                                </li>
                                                <li><label><input name="slist" value="GO" type="checkbox" id="go" onclick="selectAllGO()"/><a href="http://www.geneontology.org/">Loops from ChIA-PET</a>
                                                </label>
                                                    <ul style="margin-left: 5em">
                                                        <li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/> 1 gene in loop
                                                        </label>
                                                        </li>
                                                        <li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/>2 gene in loop
                                                        </label>
                                                        </li>
                                                        <li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/> 3 gene in loop
                                                        </label>
                                                        </li>
                                                    </ul>
                                                </li>


                                            </ul>



                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                                <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step3">
                            <h3>Step 3:Nearest</h3>

                            <ul>
                                <li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/> None
                                </label>
                                </li>
                                <li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/>Yes
                                </label>
                                </li>
                                <li><label><input name="slist" value="GOBP" id="gobio" type="checkbox"/> All
                                </label>
                                </li>

                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                                <li><button type="button" class="btn btn-default next-step">Skip</button></li>
                                <li><button type="button" class="btn btn-primary btn-info-full next-step">Save and continue</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="complete">
                            <h3>Complete</h3>
                            <p>You have successfully completed all steps.</p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</div>

</body>
</html>



