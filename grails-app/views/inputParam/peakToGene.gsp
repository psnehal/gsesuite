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

        function uncheckgenetal() {

             var ele = document.getElementsByName('maint');

             for(i = 0; i < ele.length; i++) {
                if(ele[i].checked)
                    {
                console.log(ele[i].value);

                if(ele[i].value =='cellspecific')
                    {
                        console.log('cellspecific');



                    }
                else if(ele[i].value == 'general')
                    {
                        console.log('general');

                        var textfortar =
                         +'<td align="right" valign="top"> <span class="formText">Encode Cell Specific</span></td>'




                    }




                }

            }

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

        function assignPeaksSubmit() {

             var cont = document.getElementById("content");
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
            else if (document.getElementById("enhan").checked == true) {

               //alert('yay enhancer is clicked');
               console.log('enhancer loop');
               var pmtld =

                   '<table>'
                   +'<tr>'
                    +' <td align="right" valign="top"><span class="formText"><b>Enhancer <br/>Choose one or more methods to define enhancer regions?</b> </span></td>'

                        +'<table>'
                            +'<tr>'
                            +'<th>Method</th><th>Description</th><th>No of cell types</th>'
                            +'</tr>'
                            +'<tr>'
                            +'<td><label><input name="regions" value="chromhmm"  type="checkbox"/> ChromHMM' +'</label></td>'
                            +'<td>ENCODE ChromHMM UCSC tracks</td>'
                            +'<td>9</td>'
                            +'</tr>'
                            +'<tr>'
                            +'<td><label><input name="regions" value="dnase"  type="checkbox"/> DNase-seq' +'</label></td>'
                            +'<td>DNase hypersensitive sites (DHSs) </td>'
                            +'<td>125</td>'
                            +'</tr>'
                            +'<tr>'
                            +'<tr>'
                            +'<td><label><input name="regions" value="thurman"  type="checkbox"/> Thurman</label></td>'
                            +'<td>Distal and non-promoter DHS</td>'
                            +'<td>32</td>'
                            +'</tr>'
                            +'<tr>'
                            +'<td><label><input name="regions" value="fantom"  type="checkbox"/> Fantom</label></td>'
                            +'<td>Cap Analysis Gene Expression (CAGE) experiment-derived enhancers </td>'
                            +'<td>~400</td>'
                            +'</tr>'
                        +'</table>'


                    +'<td align="right" valign="top"> <span class="formText"><b>Method used for enhancer gene targets</b>'

                    + '<br/><input name="maint" value="general"  type="radio" onclick="uncheckgenetal()"/>General </b> </span>.</td>'



                         +'<table>'
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
                            +'<td><label><input name="gtargets" value="fantom"  type="checkbox"/> Fantom</label></td>'

                            +'</tr>'
                            +'<tr>'
                            +'<td><label><input name="gtargets" value="chomehmm"  type="checkbox"/> ChomHMM</label></td>'

                            +'</tr>'
                            +'<tr>'
                            +'<td>'
                                +'<label>Loops from ChIA-PET</label>'
                                +'<ul style="margin-left: 5em">'
                                +'<li><label><input name="gtargets1" value="E1" id="E1" type="radio"/> 1 gene in loop</label></li>'
                                +'<li><label><input name="gtargets1" value="E2" id="E2" type="radio"/> ≤ 2  gene in loop</label></li>'
                                +'<li><label><input name="gtargets1" value="E3" id="E3" type="radio"/> ≤ 3 gene in loop</label></li>'
                            +'</ul>'

                            +'</td>'
                            +'</tr>'

                         +'</table>'
                           +'<td align="right" valign="top"> <span class="formText"><input name="maint" value="cellspecific"  type="radio" onclick="uncheckgenetal()"/>Encode Cell Specific</span></td>'
                                            +'<table>'
                                            +'<tr>'
                                            +'<th>Method</th>'
                                            +'</tr>'
                                            +'<tr>'
                                            +'<td><label><input name="ctargets2" value="P2P"  type="checkbox"/> ChIA-PET' +'</label></td>'


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

                                            +'</table>'





               +'</tr>'
               +'</table>';




               cont.innerHTML += pmtld;

               }
             else if (document.getElementById("distal").checked == true) {

               //alert('yay enhancer is clicked');
               console.log('distal loop');
               var pmtld =

                '</table>'
                   +'<tr>'
    +' <td align="right" valign="top"><span class="formText"><b>Enhancer <br/>Choose one or more methods to define enhancer regions?</b> </span></td>'

    +'<table>'
    +'<tr>'
    +'<th>Method</th><th>Description</th><th>No of cell types</th>'
    +'</tr>'
    +'<tr>'
    +'<td><label><input name="regions" value="chromhmm"  type="checkbox"/> ChromHMM' +'</label></td>'
    +'<td>ENCODE ChromHMM UCSC tracks</td>'
    +'<td>9</td>'
    +'</tr>'
    +'<tr>'
    +'<td><label><input name="regions" value="dnase"  type="checkbox"/> DNase-seq' +'</label></td>'
    +'<td>DNase hypersensitive sites (DHSs) </td>'
    +'<td>125</td>'
    +'</tr>'
    +'<tr>'
    +'<tr>'
    +'<td><label><input name="regions" value="thurman"  type="checkbox"/> Thurman</label></td>'
    +'<td>Distal and non-promoter DHS</td>'
    +'<td>32</td>'
    +'</tr>'
    +'<tr>'
    +'<td><label><input name="regions" value="fantom"  type="checkbox"/> Fantom</label></td>'
    +'<td>Cap Analysis Gene Expression (CAGE) experiment-derived enhancers </td>'
    +'<td>400</td>'
    +'</tr>'
    +'</table>'

    +'<td align="right" valign="top"> <span class="formText"><b>Method used for enhancer gene targets</b> <br/> General </b></span>.</td>'
    +'<table>'
    +'<tr>'
    +'<th>Method</th>'
    +'</tr>'
    +'<tr>'
    +'<td><label><input name="targets" value="P2P"  type="checkbox"/> ChIA-PET' +'</label></td>'

    +'</tr>'
    +'<tr>'
    +'<td><label><input name="targets" value="thurman"  type="checkbox"/> Thurman</label></td>'

    +'</tr>'
    +'<tr>'
    +'<td><label><input name="targets" value="fantom"  type="checkbox"/> Fantom</label></td>'

    +'</tr>'
    +'<tr>'
    +'<td><label><input name="targets" value="chomehmm"  type="checkbox"/> ChomHMM</label></td>'

    +'</tr>'
    +'<tr>'
    +'<td>'
    +'<label>Loops from ChIA-PET</label>'
    +'<ul style="margin-left: 5em">'
    +'<li><label><input name="targets1" value="E1" id="E1" type="radio"/> 1 gene in loop</label></li>'
    +'<li><label><input name="targets1" value="E2" id="E2" type="radio"/> ≤ 2  gene in loop</label></li>'
    +'<li><label><input name="targets1" value="E3" id="E3" type="radio"/> ≤ 3 gene in loop</label></li>'
    +'</ul>'

    +'</td>'
    +'</tr>'

    +'</table>'
    +'<td align="right" valign="top"> <span class="formText">Encode Cell Specific</span></td>'

    +'<table>'
    +'<tr>'
    +'<td>'


    +'<ul style="margin-left: 5em">'
    +'<li><label><input name="targets" value="GM12878" id="gm" type="radio"/> GM12878 </label></li>'
    +'<li><label><input name="targets" value="H1hSC" id="h1" type="radio"/> H1hSC </label></li>'
    +'<li><label><input name="targets" value="HepG2" id="he" type="radio"/> HepG2 </label></li>'
    +'<li><label><input name="targets" value="K562" id="k5" type="radio"/> K562 </label></li>'
    +'<li><label><input name="targets" value="HepG2" id="hep" type="radio"/> HepG2'+'</label></li>'
    +'</ul>'
    +'</td>'
    +'<td></td>'
    +'<td></td>'
    +'</tr>' +
    +'</table>'
    +'</tr>'
               +'</table>';



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
            else if (document.getElementById("any").checked == true) {

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


            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 bhoechie-tab">
                <!-- flight section -->



                <div class="bhoechie-tab-content active">
                    <h7>Peak to Gene Assignment </h7>
                    <p>Just want to find the target genes for your genomic regions?  Upload your set of genomic regions to assign them to genes based on any of our
                        <a href="#" data-toggle="tooltip" class="one" title="A Locus Definition where a gene locus is defined as the region spanning the midpoints between adjacent TSSs and TESs.!">Gene Locus definition</a></span>
                        nearest TSS, <1kb from a TSS, <5kb from a TSS, exons, introns, enhancers, etc</p>
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
                            <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2" >
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


                                        <table>
                                            <tr><td align="right" valign="top"><span class="formText"><b>Input file</b>
                                                <td><input type="file" name="myfile" id="myFile" multiple size="50" onchange="myFunction2()">
                                                    <p id="demo2"></p>
                                            </td>
                                            </tr>
                                        </table>


                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step2">
                            <h3>Step 2: Assign peaks in</h3>

                                <ul>
                                    <li><label><input name="slist" value="promoter" id="prom" type="radio" /> Promoters</label></li>
                                    <li><label><input name="slist" value="exons" id="exons" type="radio" /> Exons</label></li>
                                    <li><label><input name="slist" value="introns" id="introns" type="radio" /> Introns</label></li>
                                    <li><label><input name="slist" value="enhan" id="enhan" type="radio" /> Enhancer Only</label></li>
                                    <li><label><input name="slist" value="distal" id="distal" type="radio"/> All distal regions (using enhancer-target gene links where available)</label></li>
                                    <li><label><input name="slist" value="distno" id="distno" type="radio" /> All distal regions (not using enhancer-target gene links)</label></li>
                                    <li><label><input name="slist" value="nearest_tss" id="tss" type="radio" /> The entire genome (using nearest TSS)</label></li>
                                </ul>
                                <span class="footnote">
                                    Note: To annotate the entire genome with enhancer-gene target links, combine the Promoters 5kb option with one of the All distal regions (using enhancer-gene target links) options.

                                </span>


                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                                <li><button type="button" class="btn btn-primary next-step" onclick="assignPeaksSubmit()">Save and continue</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step3">


                            <div id="content">
                            </div>

                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                                <li><button type="button" class="btn btn-default next-step">Skip</button></li>
                                <g:submitButton name="submit"  value="Submit"
                                                class="buttonsubmit"/>
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



