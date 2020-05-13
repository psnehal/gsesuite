<%@ page import="gsesuite.PeakInfo" %>
<!DOCTYPE html>
<html>
<head>
    <head>
        <meta name="layout" content="main" />



        <g:set var="entityName" value="${message(code: 'conceptInfo.label', default: 'ConceptInfo')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

        <style type="text/css">

        html,body{width:100%}
        .container-fluid {
            padding-right:0;
            padding-left:0;
            margin-right:auto;
            margin-left:auto
        }

        .row-fluid {
            position: relative;
            max-width: 100%;
            padding:10px;
            /* margin: 0 auto; */

        }

        .panel {
            border-radius: 12px;
            border: 2px solid  #ebebeb;
            padding: 20px;


        }

        #div1{
            position:relative;
            display:block;
            height:0px;
            overflow-y:scroll;
            overflow:auto;
            padding: 0px 10px;

        }

        #div2{
            position:relative;
            display:block;
            height:0px;
            overflow-y:auto;
            padding: 0px 10px;

        }

        label{
            font-size: 14px;
            padding: 5px;
            padding-bottom: 0px;
            color:midnightblue;
        }





        .myButton {
            background-color:transparent;
            display:inline-block;
            cursor:pointer;
            color:black;
            font-family:Arial;
            font-size:17px;
            padding: 0;
            border: none;
            background: none;
            text-decoration:none;
            text-shadow:0px 1px 0px #2f6627;
        }
        .myButton:hover {
            background-color:transparent;
        }
        .myButton:active {
            position:relative;
            top:1px;
        }

        .table thead tr th {
            padding: 5px;
            font-weight: bold;
            font-size: 12px;
        }

        .contd { border:2px solid #ccc;  height: 200px; overflow-y: scroll; }






        tbody { height: auto; }

        .cat-plus {

            background-repeat:no-repeat; background-position:-15px center;
            border-left: 20px solid green;
        }

        .cat-minus {

            background-repeat:no-repeat;
            background-position:-15px center;
            border-left: 20px solid red;
        }






        </style>

        <g:javascript library='jquery'>

                function selectPub(){
               // alert("selected dropdown file");

                var pubid  = $('[id*="publications"]:checked').map(function() { return $(this).val().toString(); } ).get().join(",");

                alert(pubid)

                 var treatid  = $('[id*="treats"]:checked').map(function() { return $(this).val().toString(); } ).get().join(",")

                var q= "${q}";
                alert(q);

                var fdr =$('#city').val();

                 alert(fdr);
                window.location.href  ='${createLink(action:'showConceptInfo')}?pubid='+ pubid+'&q='+q+'&fdr='+fdr+'&treatid='+treatid;
             //w.onload = function() { this.document.title = "Concept Information"; }



                }

        function getPeakInfo(){


        // alert("selected dropdown file");

        alert( document.getElementById('flist').value);

        var filename = document.getElementById('flist').value;

        var filen = filename;

        var tmp ;

        $.ajax( {
        url: "${createLink(controller:'inputParam',action:'saveReview')}",
        type: "POST",
        async: false,
        data: { val1: filen},


        success: myCallback,
        error: function() {
        alert("fail");
        }
        } );

        console.log(tmp);

        }

      $(document).ready(function(){


    $(".toggler").click(function(e){

        e.preventDefault();

        //the data stored in the data-prod-cat
        var prodCat = ($(this).attr("data-prod-cat"));

        //toggle the link clicked on
        $(".cat" + prodCat).toggle();


        //select the parent and find the span so you can
        //toggle the "cat-plus" class
       $(this).parent().find("span").toggleClass("cat-plus");

        //toggle the cat-minus class
        $(this).toggleClass("cat-minus");








    });
});



        </g:javascript>


    </head>
<body>
<a href="#show-conceptInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-conceptInfo" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="container">


        <div class="panel panel-primary">
            <div class="panel-heading">Concept Info</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-8 text-right"><table>
                        <tr><td>Concept Name :</td><td> ${concept.coname.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td></tr>
                        <tr><td>Concept id </td><td> ${concept.conid.toString().replaceAll("\\[", "").replaceAll("\\]","")    }</td></tr>
                        <tr><td>Concept Number of genes </td><td> ${concept.ngenes.toString().replaceAll("\\[", "").replaceAll("\\]","")    }</td></tr>
                        <tr><td>Concept genes </td><td> ${concept.gids.toString().replaceAll("\\[", "").replaceAll("\\]","")   }</td></tr>

                    </table></div>
                    <div class="col-md-4 text-left">
                        <table>
                            <g:form action="showConceptInfo">
                                <tr><td>FDR:<g:textField name="myField" id="city" value="${myValue}" /></td></tr>
                                <tr><td><g:checkBox name="promoter" value="Promoter" />Promter  </td></tr>
                                <tr><td><g:checkBox name="distal" value="Distal Regions" /> Distal Regions</td></tr>
                                <tr><td><g:checkBox name="all" value="All Regions" /> All Regions</td></tr>
                                <g:hiddenField name="q" value="${concept.coname.toString().replaceAll("\\[", "").replaceAll("\\]","")}" />
                                <tr><td colspan="2"><g:submitButton name="Search" class="submit"/></td> </tr>
                            </g:form>

                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="modal-body row">
        <div class="col-md-2">
            <span id="extYear">
                    <button type="submit" class="myButton" name="submitButton" id="dasButton" value="+">[+]</button>
                    <div id="div1">
                    <h3 style="color: #337ab7; font-size: medium">Select your Transcrption Factor</h3>
                    <g:each status="i" in="${tf}" var="pub">
                        <g:if test="${pubid2?.contains(pub.toString())}">
                            <input id="publications" type="checkbox" checked="checked" value="${pub.id}" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>${pub} <br/>
                        </g:if>
                        <g:else>
                            <input id="publications" type="checkbox"  value="${pub}" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>${pub}<br/>
                        </g:else>
                    </g:each>
                    </div>
            </span>

            <span id="extYear2">
                <button type="submit" class="myButton" name="submitButton" id="dasButton" value="+">[+]</button>
                <div id="div2">
                <h3 style="color: #337ab7; font-size: medium">Select your Treatment </h3>
                <g:each status="i" in="${treatments}" var="pub">
                        <g:if test="${pubid.contains(pub.toString())}">
                            <input id="treats" type="checkbox" checked="checked" value="${pub.id}" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>${pub} <br/>
                        </g:if>
                        <g:else>
                            <input id="treats" type="checkbox"  value="${pub}" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>${pub}<br/>
                        </g:else>
                 </g:each>
                </div>
            </span>
        </div>




        <div class="col-md-10">
            <div>
                <table  id="table_id" class="table table-striped">
                    <thead>

                    <th>Name</th>
                    <th>Entrez ID</th>
                    <th># of significant Chip-Seq datasets</th>
                    <th># of total Chip-Seq datasets</th>
                    </thead>
                    <g:each in="${resultrq}" var="count" status="i" >
                        <tr>

                            <td><a href="#" class="toggler" data-prod-cat="${i}"><span class="cat-plus">+</span></a></td>
                            <td><a href="#" class="toggler" id="show_1" data-prod-cat="${i}"><span class='glyphicon glyphicon-collapse-down'/></a>
                                <g:set var="tom" value="${ 'cat'+ i}" />
                                ${count.transf}</td>
                            <td>${count.tfegid}</td>
                            <td>${count.count}</td>
                            <td>${count.fnames.size()}</td>

                        <tr bgcolor="#E0E0E0" class="cat${i}" style="display:none">
                            <td>File Name</td>
                            <td>Treatment</td>
                            <td>Status</td>
                            <td>Cellline</td>
                            <td>pval</td>
                            <td>fdr</td>
                            <td># of genes</td>
                        </tr>

                        <g:each in="${count.fnames}" var="statuscheck" status="j" >

                            <tr bgcolor="#E0E0E0" class="cat${i}"  style="display:none">
                                <td>${statuscheck.fname}</td>
                                <td>${statuscheck.treatment}</td>
                                <td>${statuscheck.status}</td>
                                <td>${statuscheck.cellline}</td>
                                <td>${statuscheck.pval}</td>
                                <td>${statuscheck.fdr}</td>
                                <td>${statuscheck.peakgenes}</td>
                            </tr>
                        </g:each>
                        <tr bgcolor="#E0E0E0" class="cat${i}"  style="display:none">

                        </tr>



                    </g:each>









                </table>





            </div>
        </div>
    </div>







</div>


</html>
