<%@ page import="gsesuite.PeakInfo" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'conceptInfo.label', default: 'ConceptInfo')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

<g:javascript library='jquery'>

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
        $('.cat'+$(this).attr('data-prod-cat')).toggle();
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
                <table>
                    <tr><td>Concept Name :</td><td> ${concept.coname.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td></tr>
                    <tr><td>Concept id </td><td> ${concept.conid.toString().replaceAll("\\[", "").replaceAll("\\]","")    }</td></tr>
                    <tr><td>Concept Number of genes </td><td> ${concept.ngenes.toString().replaceAll("\\[", "").replaceAll("\\]","")    }</td></tr>
                    <tr><td>Concept genes </td><td> ${concept.gids.toString().replaceAll("\\[", "").replaceAll("\\]","")   }</td></tr>

                </table>
            </div>
            </div>
            </div>

            <div class="modal-body row">
                <div class="col-md-2">
                    <h3>Select your filters</h3>
                    TRanscrption Factor
                    <g:select name="user.transF" from="${ gsesuite.PeakInfo.list().transF}" value="${transF}"
                              noSelection="['':'-Choose your transcription factor-']"/>
                </div>
                <div class="col-md-10">
                    <div>
                        <table  id="table_id" class="display">
                            <thead>
                            <th>Index</th>
                            <th>Peak File</th>
                            <th>Locus Definition</th>
                            <th>Pval</th>
                            <th>FDR Ratio
                            <th>Status</th>
                            <th># of genes</th>
                            <th># of peakgenes</th>
                            </thead>
                            <g:each in="${peakinfos}" var="count" status="i" >
                                <tr>
                                    <td><a href="#" class="toggler" data-prod-cat="${i}"><span class='glyphicon glyphicon-collapse-down'/></a></td>
                                    <g:set var="tom" value="${ 'cat'+ i}" />
                                    <td>${count.fname.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>
                                    <td>${count.locusdef.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>
                                    <td>${count.pval.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>
                                    <td>${count.fdr.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>
                                    <td>${count.status.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>
                                    <td>${count.ngenes.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>
                                    <td>${count.npeakgenes.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>

                                <tr bgcolor="#E0E0E0" class="cat${i}" style="display:none">
                                    <td>Cellline</td>
                                    <td>TFclean</td>
                                    <td>TF ID</td>
                                    <td>Antibody</td>
                                    <td>Institute</td>

                                </tr>
                                <tr bgcolor="#E0E0E0" class="${tom}" style="display:none">
                                    <td>${count.cellline.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>
                                    <td>${count.tfclean.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>
                                    <td>${count.tfegid.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>
                                    <td>${count.antibody.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>
                                    <td>${count.institute.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td>

                                </tr>
                                <tr bgcolor="#E0E0E0" class="${tom}" style="display:none">

                                </tr>
                            </g:each>
                        </table>



                    </div>
                </div>
            </div>







        </div>

    <g:paginate next="Forward" prev="Back"
                maxsteps="0" controller="conceptInfo"
                action="showConcept" total="${total}" params="${[q: concept.coname]}" />
    </body>
</html>
