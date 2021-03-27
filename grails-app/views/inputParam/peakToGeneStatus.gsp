<!DOCTYPE html>
<html>



<head>


    <meta name="layout" content="main3" />

    <title>Genomic Region Enrichment</title>
    <asset:javascript src="validation.js"/>
    <asset:stylesheet src="loader.css"/>
    <asset:javascript src="menu.js"/>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>



    <style>
    .spinner {
        margin: 100px auto;
        width: 50px;
        height: 40px;
        text-align: center;
        font-size: 10px;
    }

    .spinner > div {
        background-color: #333;
        height: 100%;
        width: 6px;
        display: inline-block;

        -webkit-animation: sk-stretchdelay 1.2s infinite ease-in-out;
        animation: sk-stretchdelay 1.2s infinite ease-in-out;
    }

    .spinner .rect2 {
        -webkit-animation-delay: -1.1s;
        animation-delay: -1.1s;
    }

    .spinner .rect3 {
        -webkit-animation-delay: -1.0s;
        animation-delay: -1.0s;
    }

    .spinner .rect4 {
        -webkit-animation-delay: -0.9s;
        animation-delay: -0.9s;
    }

    .spinner .rect5 {
        -webkit-animation-delay: -0.8s;
        animation-delay: -0.8s;
    }

    @-webkit-keyframes sk-stretchdelay {
        0%, 40%, 100% { -webkit-transform: scaleY(0.4) }
        20% { -webkit-transform: scaleY(1.0) }
    }

    @keyframes sk-stretchdelay {
        0%, 40%, 100% {
            transform: scaleY(0.4);
            -webkit-transform: scaleY(0.4);
        }  20% {
               transform: scaleY(1.0);
               -webkit-transform: scaleY(1.0);
           }
    }

    .loader {
        border: 16px solid #f3f3f3; /* Light grey */
        border-top: 16px solid #3498db; /* Blue */
        border-radius: 50%;
        width: 20px;
        height: 20px;
        animation: spin 2s linear infinite;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
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


                            },5000);








        function myCallback(response)
        {
            result = response;

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


            // console.log(status);



            if(status.includes("Done"))
            {
                console.log("Done", uid);

               window.location.href = '${createLink(controller: 'inputParam' , action:'peaksresults')}?uuid=' + uid+'&status='+status;
            }
            else if(status.includes("exception"))
                {

                    console.log(" Exception", uid);

               window.location.href = '${createLink(controller: 'inputParam' , action:'peaktogeneerror')}?uuid=' + uid+'&status='+status;


                }
            else if(status.includes("Error"))
                {

                    console.log(" Error", uid);

               window.location.href = '${createLink(controller: 'inputParam' , action:'peaktogeneerror')}?uuid=' + uid+'&status='+status;


                }
        }


        function createLink(response){
                     var prswtsel = $("#select_desc").val();
                    var phenocatsel = $("#select_PRS_code").val();
                    var phenomesel = $('#select_phenomes').val();
                     var oddssel = $('#select_odds').val();

                      var filepathlink = '${createLink(action:'peakToGene')}';
                      window.location.href =filepathlink;



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
                <h7>Link Genomic Regions to Target Genes </h7>
                <p>
                    Just want to find the target genes for your genomic regions? Upload your set of genomic regions to assign them to target genes based on the selection of regulatory regions, including enhancers, promoters, whole genome, exons, introns, etc. For enhancer to target gene assignments, we use human genome version hg19, however, multiple species and multiple reference genome versions are available for all other regulatory regions. The human enhancer to target gene assignments can be generated by selecting data from a variety of sources and methods.

                </p>
                </div>




                <br/>
                <hr/>


                <h2 style="text-align: center   "> Analysis </h2>
    <div class="row">

        <div class="row">
            <section>
                <div class="wizard">
                    <div class="wizard-inner">
                        <div class="connecting-line"></div>
                        <ul class="nav nav-tabs" role="tablist">

                            <li role="presentation" class="disabled">
                                <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1" onclick="createLink()">
                                    <span class="round-tab">
                                        <i class="glyphicon glyphicon-folder-open"></i>
                                    </span>
                                </a>
                            </li>

                            <li role="presentation" class="disabled">
                                <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2" onclick="createLink()" >
                                    <span class="round-tab">
                                        <i class="glyphicon glyphicon-pencil"></i>
                                    </span>
                                </a>
                            </li>
                            <li role="presentation" class="disabled">
                                <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3" onclick="createLink()">
                                    <span class="round-tab">
                                        <i class="glyphicon glyphicon-picture"></i>
                                    </span>
                                </a>
                            </li>

                            <li role="presentation" class="active">
                                <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                                    <span class="round-tab">
                                        <i class="glyphicon glyphicon-ok"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>



                        <div class="tab-content">
                            <g:if test="${runanalysis.equals("true")}">

%{--                                <div class="loader"></div>--}%




                                <div class="tab-pane active" role="tabpanel" id="complete">


                                    <div class="loader5"></div></div>

                                        <h3>Complete</h3>
                                        <p>You have successfully completed all steps.</p>

                                        Your job is submitted with locus definition ${ld} and is available at the  <a href="http://localhost:8080/inputParam/peakgeneresult?uuid=${uuid}" >link</a> in few minutes or stay on this page and it will take you to results.

                                    <br/>
                                    </br>

                                    <g:if test="${method == 'enhan'}">


                                        The file used to link your genomic regions to target gene assignments is available to download <a href="${createLink(action: 'downloadFile')}?filename=${ld}&type=weight">here</a>
                                        <br/>
                                    </g:if>
                                    <g:elseif test="${method == 'dist'}">
                                        The file used to link your genomic regions to target gene assignments is available to download <a href="${createLink(action: 'downloadFile')}?filename=${ld}&type=weight">here</a>

                                        <br/>
                                    </g:elseif>


                                </g:if>
                                <g:else>
                                    <h3>Error!</h3>
                                    ${custld} Locus definition file doesnt exists;
                                </g:else>




                            </div>
                            <div class="clearfix"></div>
                        </div>

                </div>
            </section>
        </div>


         </div>
</div>

</body>
</html>



