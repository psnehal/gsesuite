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


  function prevTab(elem) {
            $(elem).prev().find('a[data-toggle="tab"]').click();
        }


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

     function uncheckgenetal() {

             var ele = document.getElementsByName('method');


             var cont = document.getElementById("targetoptions");
             cont.innerHTML = '';





             for(i = 0; i < ele.length; i++) {
                if(ele[i].checked)
                    {
                console.log(ele[i].value);

                if(ele[i].value =='cellspe')
                    {
                        console.log('cellspecific');

                        var textfortar=  '<table>'
                                            +'<tr>'
                                            +'<th>Method</th>'
                                            +'</tr>'
                                            +'<tr>'
                                            +'<td><label><input name="ctargets2" value="P2P"  type="checkbox" checked  /> ChIA-PET' +'</label></td>'
                                            +'</tr>'
                                            +'<tr>'
                                            +'<td>'
                                            +'<label>Cell Lines</label>'
                                                +'<ul style="margin-left: 5em">'
                                                +'<li><label><input name="ctargets" value="GM12878" id="gm" type="radio"/> GM12878 </label></li>'
                                                +'<li><label><input name="ctargets" value="H1hESC" id="h1" type="radio"/> H1hESC </label></li>'
                                                +'<li><label><input name="ctargets" value="HepG2" id="he" type="radio"/> HepG2 </label></li>'
                                                +'<li><label><input name="ctargets" value="K562" id="k5" type="radio"/> K562 </label></li>'
                                                +'<li><label><input name="ctargets" value="MCF7" id="hep" type="radio"/> MCF7'+'</label></li>'
                                                +'</ul>'

                                            +'</td>'
                                            +'</tr>'

                                            +'<tr>'
                                            +'<td>'
                                            +'<label>Loops from ChIA-PET</label>'
                                            +'<ul style="margin-left: 5em">'
                                            +'<li><label><input name="ctargets1" value="E1" id="E1" type="radio"/> 1 gene in loop</label></li>'
                                            +'<li><label><input name="ctargets1" value="E2" id="E2" type="radio"/> ≤ 2  gene in loop</label></li>'
                                            +'<li><label><input name="ctargets1" value="E3" id="E3" type="radio"/> ≤ 3 gene in loop</label></li>'
                                            +'</ul>'

                                            +'</td>'
                                            +'</tr>'

                                            +'</table>';
                        cont.innerHTML = textfortar;





                    }
                else if(ele[i].value == 'general')
                    {
                        console.log('general');

                        var textfortar =
                            '<table>'
                            +'<tr>'
                            +'<th>Method</th>'
                            +'</tr>'
                            +'<tr>'
                            +'<td><label><input name="gtargets" value="P2P"  type="checkbox"/> ChIA-PET' +'</label></td>'
                            +'</tr>'
                            +'<tr>'
                            +'<td><label><input name="gtargets" value="thurman"  type="checkbox"/> Thurman</label></td>'
                            +'</tr>'
                            +'<tr>'
                            +'<td><label><input name="gtargets" value="fantom"  type="checkbox"/> FANTOMS</label></td>'
                            +'</tr>'

                            +'<td>'
                                +'<label>Loops from ChIA-PET</label>'
                                +'<ul style="margin-left: 5em">'
                                +'<li><label><input name="gtargets1" value="E1" id="E1" type="radio"/> 1 gene in loop</label></li>'
                                +'<li><label><input name="gtargets1" value="E2" id="E2" type="radio"/> ≤ 2  gene in loop</label></li>'
                                +'<li><label><input name="gtargets1" value="E3" id="E3" type="radio"/> ≤ 3 gene in loop</label></li>'
                            +'</ul>'

                            +'</td>'
                            +'</tr>'
                            +'</table>';


                        cont.innerHTML = textfortar




                    }




                }

            }

    }


        %{--function openModal() {
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

        }--}%



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

        function returnToPreviousPage() {
                     window.history.back();

                }

        function checkinput()
        {

            var combo = document.getElementById("sglist");

            var emfile = 'false';


            var x = document.getElementById("myFile");
                     var txt = "";
                     if ('files' in x) {
                    if (x.files.length == 0) {
                            emfile = 'true';
                        }
                    }



               if(combo.selectedIndex <=0)
                {

                    alert("Please Select Species");
                  $(this).find(':input[type=submit]').prop('disabled', true);




                }

               else if(emfile == 'true')
                   {


                        alert("Please select file");
                  $(this).find(':input[type=submit]').prop('disabled', true);


                   }
               else{







                   var cont = document.getElementById("locus");
                    cont.innerHTML = '';

                    var e = document.getElementById("sglist");
                    var strUser = e.options[e.selectedIndex].value;

             console.log(strUser);

             if(strUser == "hg19")
                 {
                     var line =
                    '<ul>'
                    +'<li><label><input name="slist" value="promoter" id="prom" type="radio" checked/> Promoters</label></li>'
                    +'<li><label><input name="slist" value="exons" id="exons" type="radio" /> Exons</label></li>'
                    +'<li><label><input name="slist" value="introns" id="introns" type="radio" /> Introns</label></li>'
                    +'<li><label><input name="slist" value="enhan" id="enhan" type="radio" /> Enhancer Only</label></li>'
                    +'<li><label><input name="slist" value="distal" id="distal" type="radio"/> All distal regions (using enhancer-target gene links where available)</label></li>'
                    +'<li><label><input name="slist" value="distno" id="distno" type="radio" /> All distal regions (not using enhancer-target gene links)</label></li>'
                    +'<li><label><input name="slist" value="nearest_tss" id="tss" type="radio" /> The entire genome (using nearest TSS)</label></li>'
                    +'</ul>';

                 }
             else
                 {
              var line =
                    '<ul>'
                    +'<li><label><input name="slist" value="promoter" id="prom" type="radio" checked/> Promoters</label></li>'
                    +'<li><label><input name="slist" value="exons" id="exons" type="radio" /> Exons</label></li>'
                    +'<li><label><input name="slist" value="introns" id="introns" type="radio" /> Introns</label></li>'
                    +'<li><label><input name="slist" value="distno" id="distno" type="radio" /> All distal regions (not using enhancer-target gene links)</label></li>'
                    +'<li><label><input name="slist" value="nearest_tss" id="tss" type="radio" /> The entire genome (using nearest TSS)</label></li>'
                    +'</ul>';

                 }




              cont.innerHTML += line;


               }

               // alert("validations passed");
               return true;



        }



        function assignPeaksSubmit() {

             var cont = document.getElementById("content");

             var e = document.getElementById("sglist");
                    var strUser = e.options[e.selectedIndex].value;


             console.log(strUser);
             cont.innerHTML = '';
            if (document.getElementById("prom").checked == true) {


                console.log('promoter loop');


                var pmtld =
                '<table>'
                +'<tr>'
                +'<td align="right" valign="center"><span class="formText"><b>Promoter</b></span></td>'
                +'<td>'
                +'<ul class="b">'
                +'<li><input type="radio" name="ld" value="1kb"/><span class="formText2">Proximal promoter regions (1kb)<br/><img style="max-width:150px; margin-top: -7px;" src="${resource(dir: "images", file: "1kb.png")}"></span><br/><span class="footnote">(only use peaks within 1kb of a transcription start site)</span></li>'
                +'<li><input type="radio" name="ld" value="5kb"/><span class="formText2">Mid-range promoter regions (5kb) <br/><img style="max-width:180px; margin-top: -7px;" src="${resource(dir: "images", file: "5kb.png")}"></span><br/> <span class="footnote">(only use peaks within 5kb of a transcription start site)</span> </li>'
                +'<li><input type="radio" name="ld" value="10kb"/><span class="formText2">Broad promoter regions (10kb) <br/><img style="max-width:210px; margin-top: -7px;" src="${resource(dir: "images", file: "10kb.png")}"></span><br/> <span class="footnote">(only use peaks that are 10kb or more upstream of a transcription start site)</span> </li>'
                +'</ul>'
                +'</td></table>';

               cont.innerHTML += pmtld;

               }
            else if (document.getElementById("exons").checked == true) {

                console.log('exons loop');

                     var pmtld =
                '<table>'
                +'<tr>'
                +'<td align="right" valign="top"><span class="formText"><b>Exons</b></span></td>'
                +'<td>'
                +'<ul class="b">'
                +'<li><input type="radio" name="ld" value="exon"/><span class="formText2"> Exons <br/><img style="max-width:200px; margin-top: -7px;"src="${resource(dir: "images", file: "exon.png")}"></span><br/><span class="footnote">(only use peaks that fall within an annotated exon)</span> </li>'
                +'</ul>'
                +'</td></table>';

               cont.innerHTML += pmtld;

               }
            else if (document.getElementById("introns").checked == true) {

                              var pmtld = '<table>'
                    +'<tr>'
                    +'<td align="right" valign="top"><span class="formText"><b>Introns</b></span></td>'
                    +'<td>'
                    +'<ul class="b">'
                    +'<li><input type="radio" name="ld" value="introns"/><span class="formText2"> Introns <br/><img style="max-width:200px; margin-top: -7px;"src="${resource(dir: "images", file: "intron.png")}"></span><br/><span class="footnote">(only use peaks that fall within an annotated itron)</span> </li>'
                    +'</ul>'
                    +'</td></table>';

               cont.innerHTML += pmtld;

               }

            else if (document.getElementById("distno").checked == true) {

           var pmtld =
                '<table>'
                +'<tr>'
                +'<td align="right" valign="center"><span class="formText"><b>Promoter</b></span></td>'
                +'<td>'
                +'<ul class="b">'
                +'<li><input type="radio" name="ld" value="1kb_outside"/><span class="formText2">Proximal promoter regions (1kb)<br/><img style="max-width:150px; margin-top: -7px;" src="${resource(dir: "images", file: "1kboutside.png")}"></span><br/><span class="footnote">(only use peaks within 1kb of a transcription start site)</span></li>'
                +'<li><input type="radio" name="ld" value="5kb_outside"/><span class="formText2">Mid-range promoter regions (5kb) <br/><img style="max-width:180px; margin-top: -7px;" src="${resource(dir: "images", file: "5kboutside.png")}"></span><br/> <span class="footnote">(only use peaks within 5kb of a transcription start site)</span> </li>'
                +'<li><input type="radio" name="ld" value="10kb_outside"/><span class="formText2">Broad promoter regions (10kb) <br/><img style="max-width:210px; margin-top: -7px;" src="${resource(dir: "images", file: "10kboutside.png")}"></span><br/> <span class="footnote">(only use peaks that are 10kb or more upstream of a transcription start site)</span> </li>'
                +'</ul>'
                +'</td></table>';

               cont.innerHTML += pmtld;

               }
            else if (document.getElementById("tss").checked == true) {

                 var pmtld =

              '<table>'
    +'<tr>'
    +'<td align="right" valign="top"><span class="formText"><b>Anywhere in genome</b></span></td>'
    +'<td>'
    +'<ul class="b">'
    +'<li><input type="radio" name="ld" value="nearest_tss" checked="checked" /><span class="formText2">Nearest TSS<br/><img style="max-width:300px; margin-top: -7px;"src="${resource(dir: "images", file:"neartss.png")}"></span><br/> <span class="footnote">(use all peaks; assign peaks to the gene with the closest TSS)</span> </li>'
    +'</ul>'
    +'</td></table>';

               cont.innerHTML += pmtld;

               }
            else{

                if( strUser =='hg19')
                    {
                        if (document.getElementById("enhan").checked == true) {

                        //alert('yay enhancer is clicked');
                       console.log('enhancer loop');
                       var pmtld =

                       '<table>'
        +'<tr>'
        +'<td align="right" valign="top"><span class="formText"><b>Choose one or more methods to define enhancer regions</b> </span></td>'
        +'</tr>'
        +'<tr>'
        +'<table>'
        +'<tr>'
        +'<th>Method</th><th>Description</th><th style="margin-left: 4em"># of Enhancers </th><th># of cell types</th>'
        +'</tr>'
        +'<tr>'
        +'<td nowrap><label><input name="regions" value="chromhmm"  type="checkbox"/> <a href="https://www.nature.com/articles/nmeth.1906" target="_blank">ChromHMM</a>' +'</label></td>'
        +'<td>ENCODE ChromHMM UCSC tracks</td>'
        +'<td>341715</td>'
        +'<td> <a href="${resource(dir: 'images', file: 'chromehmm.txt')}" target="_blank" >9</a></td>'
        +'</tr>'
        +'<tr>'
        +'<td><label><input name="regions" value="dnase"  type="checkbox"/> <a href="https://www.ncbi.nlm.nih.gov/pubmed/22955617" target="_blank"> DNase-seq </a>' +'</label></td>'
        +'<td> DNase hypersensitive sites (DHSs) processed by ENCODE {Thurman, 2012 #41}</td>'
        +'<td>1507916</td>'
        +'<td> <a href="${resource(dir: 'images', file: 'DNAase_125.csv')}" target="_blank" >125</a> </td>'
        +'</tr>'
        +'<tr>'
        +'<tr>'
        +'<td><label><input name="regions" value="thurman"  type="checkbox"/> <a href="https://www.ncbi.nlm.nih.gov/pubmed/22955617" target="_blank">Thurman</a></label></td>'
        +'<td>Distal and non-promoter DHS within 500 kb of the correlated promoter DHSs referred to as the first author of the publication </td>'
        +'<td>469261</td>'
        +'<td><a href="${resource(dir: 'images', file: 'thurman.csv')}" target="_blank" >79 cell types into grouped into 32 cell type category</a> </td></td>'
        +'</tr>'
        +'<tr>'
        +'<td><label><input name="regions" value="fantom"  type="checkbox"/> <a href="https://www.ncbi.nlm.nih.gov/pubmed/25723102" target="_blank">FANTOM5</a></label></td>'
        +'<td>Cap Analysis Gene Expression (CAGE) experiment-derived enhancers across <br/> distinct cell lines/tissue/primary cells from FANTOM5 project</td>'
        +'<td>35540</td>'
        +'<td><a href="${resource(dir: 'images', file: 'FANTOM5.csv')}" target="_blank" >~400</a> </td>'
        +'</tr>'
        +'</table>'
        +'</tr>'
        +'<tr>'
        +' <br/><td align="right" valign="top"> <span class="formText"><b>Choose the method used for determining enhancer to targets genes</b></span></td>'
        +'</tr>'
        +'<tr>'
        +'<table>'
        +'<tr>'
        +'<td><input type="radio" name="method" class="formObject" value="general" onclick="uncheckgenetal(this)"> General </td>'
        +'<td><input type="radio" name="method" class="formObject" value="cellspe" onclick="uncheckgenetal(this)"> ENCODE Cell specific </td>'
        +'</tr>'

        +'</table>'
        +'</tr>'
        +'<tr>'
        +'<div id="targetoptions"></div>'
        +'</tr>'
        +'</table>';




               cont.innerHTML += pmtld;

               }
                        else if (document.getElementById("distal").checked == true) {

               //alert('yay enhancer is clicked');
               console.log('distal loop');
               var pmtld =

                 '<table>'
    +'<tr>'
    +'<td align="right" valign="top"><span class="formText"><b>Choose one or more methods to define enhancer regions?</b> </span></td>'
    +'</tr>'
    +'<tr>'
    +'<table>'
    +'<tr>'
    +'<th>Method</th><th>Description</th><th>No of Enhancer </th><th>No of cell types</th>'
    +'</tr>'
    +'<tr>'
    +'<td nowrap><label><input name="regions" value="chromhmm"  type="checkbox"/> <a href="https://www.nature.com/articles/nmeth.1906" target="_blank"> ChromHMM</a>' +'</label></td>'
    +'<td>ENCODE ChromHMM UCSC tracks</td>'
    +'<td>341715</td>'
    +'<td> <a href="${resource(dir: 'images', file: 'chromehmm.txt')}" target="_blank" >9</a></td>'
    +'</tr>'
    +'<tr>'
    +'<td><label><input name="regions" value="dnase"  type="checkbox"/> <a href="https://www.ncbi.nlm.nih.gov/pubmed/22955617" target="_blank"> DNase-seq </a>' +'</label></td>'
    +'<td> DNase hypersensitive sites (DHSs) processed by ENCODE {Thurman, 2012 #41}</td>'
    +'<td>1507916</td>'
    +'<td> <a href="${resource(dir: 'images', file: 'DNAase_125.csv')}" target="_blank" >125</a> </td>'
    +'</tr>'
    +'<tr>'
    +'<tr>'
    +'<td><label><input name="regions" value="thurman"  type="checkbox"/> <a href="https://www.ncbi.nlm.nih.gov/pubmed/22955617" target="_blank"> Thurman</a></label></td>'
    +'<td>Distal and non-promoter DHS within 500 kb of the correlated promoter DHSs referred to as the first author of the publication </td>'
    +'<td>469261</td>'
    +'<td><a href="${resource(dir: 'images', file: 'thurman.csv')}" target="_blank" >79 cell types into 32 cell type category</a> </td></td>'
    +'</tr>'
    +'<tr>'
    +'<td><label><input name="regions" value="fantom"  type="checkbox"/> <a href="https://www.ncbi.nlm.nih.gov/pubmed/25723102" target="_blank"> FANTOM5</a></label></td>'
    +'<td>Cap Analysis Gene Expression (CAGE) experiment-derived enhancers across distinct cell lines/tissue/primary cells from FANTOM5 project</td>'
    +'<td>35540</td>'
    +'<td><a href="${resource(dir: 'images', file: 'FANTOM5.csv')}" target="_blank" >~400</a> </td>'
    +'</tr>'
    +'</table>'
    +'</tr>'
    +'<tr>'
    +' <br/><td align="right" valign="top"> <span class="formText"><b>Choose the method used for determining enhancer to targets genes</b></span></td>'
    +'</tr>'
    +'<tr>'
    +'<table>'
    +'<tr>'
    +'<td><input type="radio" name="method" class="formObject" value="general" onclick="uncheckgenetal(this)"> General </td>'
    +'<td><input type="radio" name="method" class="formObject" value="cellspe" onclick="uncheckgenetal(this)"> ENCODE Cell specific </td>'
    +'</tr>'

    +'</table>'
    +'</tr>'
    +'<tr>'
    +'<div id="targetoptions"></div>'
    +'</tr>'
    +'</table>';


               cont.innerHTML += pmtld;

               }

                    }

            }


        }

        // function assignPeaks()
        // {
        //
        //    if (document.getElementById("prom").checked == true ||document.getElementById("enhan").checked == true ||document.getElementById("any").checked == true) {
        //
        //        console.log('yay prmoter is clicked');
        //         document.getElementById("exons").disabled= true;
        //         document.getElementById("introns").disabled= true;
        //         document.getElementById("dist").disabled= true;
        //
        //
        //        }
        //
        //
        //        else{
        //        console.log('yay prmoter is clicked');
        //
        //        document.getElementById("exons").disabled= false;
        //         document.getElementById("introns").disabled= false;
        //         document.getElementById("dist").disabled=false;
        //
        //
        //        }
        //
        //
        //
        //
        //
        // }
        //
        //
        // function assignPeaks2()
        // {
        //
        //
        //        if (document.getElementById("introns").checked == true|| document.getElementById("exons").checked == true) {
        //
        //        //console.log('yay introns is clicked');
        //         document.getElementById("prom").disabled= true;
        //         document.getElementById("enhan").disabled= true;
        //         document.getElementById("any").disabled= true;
        //         document.getElementById("dist").disabled= true;
        //         if (document.getElementById("introns").checked == true)
        //             {
        //                  document.getElementById("exons").disabled= true;
        //
        //             }
        //             else
        //                 {
        //                     document.getElementById("introns").disabled= true;
        //                 }
        //
        //
        //        }
        //        else{
        //
        //        document.getElementById("prom").disabled= false;
        //         document.getElementById("enhan").disabled= false;
        //         document.getElementById("any").disabled= false;
        //         document.getElementById("dist").disabled= false;
        //         if (document.getElementById("introns").checked == true)
        //             {
        //                  document.getElementById("exons").disabled= false;
        //
        //             }
        //             else
        //                 {
        //                     document.getElementById("introns").disabled= false;
        //                 }
        //
        //
        //        }
        //
        //
        //
        // }
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
                console.log("show option");

                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });

            $(".next-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                console.log(document.getElementById("myFile"));



                var combo = document.getElementById("sglist");


                var emfile = 'false';


                var x = document.getElementById("myFile");
                var txt = "";
                if ('files' in x) {
                    if (x.files.length == 0) {
                        emfile = 'true';
                    }
                }


                if(combo.selectedIndex <=0 || emfile =='true' )
                {
                    console.log("Please Select Species from inside or select file");

                }

                else
                {

                    $active.next().removeClass('disabled');
                    console.log("next option");

                    //console.log ( $(active.target).attr('id') );

                    nextTab($active);

                }


            });
            $(".prev-step").click(function (e) {
                console.log("previ option");

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


            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <!-- flight section -->



                <div class="bhoechie-tab-content active">
                    <h7>Link Genomic Regions to Target Genes </h7>
                    <p>
                        Just want to find the target genes for your genomic regions? Upload your set of genomic regions to assign them to target genes based on the selection of regulatory regions, including enhancers, promoters, whole genome, exons, introns, etc. For enhancer to target gene assignments, we use human genome version hg19, however, multiple species and multiple reference genome versions are available for all other regulatory regions. The human enhancer to target gene assignments can be generated by selecting data from a variety of sources and methods.

                    </p>

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
                            <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2" onclick="checkinput()" >
                                <span class="round-tab">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </span>
                            </a>
                        </li>
                        <li role="presentation" class="disabled">
                            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3" onclick="assignPeaksSubmit()">
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

                <g:form action="peakToGeneStatus" method="post" id="upform" name="upform"  enctype="multipart/form-data">

                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="step1">
                            <h3>Step 1: Upload the file</h3>
                            <hr>


                                        <table>
                                            <tr>
                                                <td align="right" valign="top" width="140"><span
                                                        class="formText"><b>Select Species and genome version</b></span></td>
                                                <td style="padding-left:10px"><select name="sglist" id="sglist" size="1" class="formObject">
                                                    <option value="">Select Genome</option>
                                                    <option value="hg19">Human (hg19)</option>
                                                    <option value="hg38">Human (hg38)</option>
                                                    <option value="mm9">Mouse (mm9)</option>
                                                    <option value="mm10">Mouse (mm10)</option>
                                                    <option value="rn4">Rat (rn4)</option>
                                                    <option value="rn5">Rat (rn5)</option>
                                                    <option value="rn6">Rat (rn6)</option>
                                                    <option value="dm3">D. melanogaster (dm3)</option>
                                                    <option value="dm6">D. melanogaster (dm6)</option>
                                                    <option value="dre">D. Zebrafish (danRer10)</option>
                                                </select>
                                                    <br/> <br/><br/> <br/>
                                                </td>
                                            </tr>
                                            <tr><td nowrap="" align="right" valign="top"><span class="formText"><b>Input file : </b>
                                                <td style="padding-left:10px"><div class="mx-4"> <input type="file" name="myfile" id="myFile" multiple size="50" onchange="myFunction2()"></div>
                                                <p id="demo2"></p>
                                                    <span class="footnote">The following formats are fully supported via their file extensions: .bed, .broadPeak, .narrowPeak, .gff3, .gff2, .gff, and .bedGraph or .bdg. BED3 through BED6 files are supported under the .bed extension. Files without these extensions are supported under the conditions that the first 3 columns correspond to 'chr', 'start', and 'end' and that there is either no header column, or it is commented out.
                                                    Example file can be found <a href="${resource(dir: 'images', file: 'E2A.txt')}" target="_blank" >here</a> </span>
                                            </td>
                                            </tr>
                                        </table>


                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-primary next-step" onclick="return checkinput();">Save and continue</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step2">
                            <h3>Step 2: Assign peaks in</h3>
                            <hr>

                            <div id="locus">
                            </div>
                        <br/>
                                <span class="footnote">
                                    Note: To annotate the entire genome with enhancer-gene target links, combine the Promoters 5kb option with one of the All distal regions (using enhancer-gene target links) options.
                                    Some choices may have one option.

                                </span>

                            <br/>
                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                                <li><button type="button" class="btn btn-primary next-step" onclick="assignPeaksSubmit()">Save and continue</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step3">

                            <h3>Step 3: Choose how to assign to:</h3>


                            <hr>

                            <div id="content">
                            </div>



                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-default prev-step">Previous</button></li>

                                <g:submitButton name="submit"  value="Submit"
                                                class=" btn btn-primary buttonsubmit"/>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="complete">
                            <h3>Complete</h3>
                            <p>You have successfully completed all steps.</p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                            </g:form>
            </div>
        </section>
    </div>
</div>

</body>
</html>



