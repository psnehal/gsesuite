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

 $(document).ready(
           function() {
                setInterval(function() {
                    var uuid ="${uuid}";
                    var runanalysis = "${runanalysis}";

                    if(runanalysis == "true")
                        {

                             $.ajax( {
                                    url: "${createLink(controller:'inputParam',action:'connectdatabase')}",
                                    type: "POST",
                                    async: false,
                                    data: { uuid: uuid},
                                    success: myCallback,
                                    error: function() {
                                        console.log("fail");
                                    }
                                } );



                        }
                    else
                        {

                            console.log("other loop");
                        }

                    console.log(uuid);

                     });


                            },50000000000000000000);








        function myCallback(response)
        {
            result = response;
            console.log(typeof response);
            console.log("Inside ajax: "+response);
            var trainindIdArray = response.replace("[","").replace("]","").split("\t");
            var keys ='' ;
            var uid;
            var jid;
            var status;
            $.each( trainindIdArray, function( key, value ) {
                if(key == 0)
                {
                    uid = value.replace(/("|')/g, "").trim();
                }
                else
                {
                    status=value.replace(/("|')/g, "").trim();
                }
            });
            // alert(keys);
            if(status== "Done")
            {
                console.log("yaya done", uid);
                var baseLink = '<g:createLink controller = "jobque" action="redirectResult" params="[jobid:uid ]"/>'
               window.location.href = '${createLink(controller: 'inputParam' , action:'peaksresults')}?uuid=' + uid+'&status='+status;
            }
            else if(status.includes("exception"))
                {

                    console.log("yaya done", jid);

               window.location.href = '${createLink(controller: 'inputParam' , action:'peaktogenerror')}?uuid=' + uid+'&status='+status;


                }
        }

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
    <div class="row">

        <g:if test="${runanalysis.equals("true")}">

            Your job is submitted with locus definition ${ld} and is available at the  <a href="http://localhost:8080/inputParam/peakgeneresult?uuid=${uuid}" >link</a> in few minutes or stay on this page and it will take you to results.



        </g:if>
        <g:else>

            ${ld} Locus definition file doesnt exists;

        </g:else>

         </div>
</div>

</body>
</html>



