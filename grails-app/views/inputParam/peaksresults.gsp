<%--
  Created by IntelliJ IDEA.
  User: snehalpatil
  Date: 2020-03-10
  Time: 15:39
--%>

<%--
  Created by IntelliJ IDEA.
  User: snehal
  Date: 10/4/19
  Time: 1:42 PM
--%>

<html>
<head>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-51251387-5"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-51251387-5');
    </script>
    <asset:javascript src="jquery-3.3.1.min.js" />
    <meta name="layout" content="main"/>
    <asset:javascript src="menu.js"/>
    <asset:javascript src="validation.js" />

    <asset:javascript src="popper.min.js" />
    %{--   <asset:stylesheet src="datatables.css"/>
       <asset:javascript src="datatables.js"/>--}%

    <asset:stylesheet src="theme.blue.css"/>
    <asset:javascript src="jquery.tablesorter.js"/>
    <asset:javascript src="jquery.tablesorter.widgets.js"/>
    <asset:javascript src="widget-filter-formatter-select2.js"/>

    <g:set var="entityName" value="${message(code: 'inputparams.label', default: 'Inputparams')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <style>
    .table {
        border-radius: 5px;

        margin: 0px auto;
        float: none;
    }
    th {
        white-space: nowrap;
    }


    </style>
    <g:javascript library='jquery'>

        $(document).ready( function () {

            $('[data-toggle="popover"]').popover(  { html:true  });

            $('[data-toggle="tooltip"]').tooltip();





        } );



    </g:javascript>
</head>

<body>
<div class="container-fluid p-2" >
    <div class="row">
                <div>

                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="nav navbar-primary " role="navigation">
                            <ul class="nav nav-tabs" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link active" href="#"><g:link action="peaksresults" params="[uuid: "${uuid}"]">Peak-to-gene assignments</g:link></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="#"><g:link action="peakpergeneresult" params="[uuid: "${uuid}"]">Peaks per Gene</g:link></a>
                                </li>

                            </ul>
                        </div>




                        <div class="table-bordered table-responsive fixed-table-body text-center">
                            <h2>Peak-to-gene assignments</h2>
                            <div id="c2">

                                <div> <export:formats formats="['csv', 'excel']" params="[uuid:"${uuid}"]" /></div>
                            </div>
                            <div class="pagination">

                                <g:paginate next="Forward" prev="Back"

                                            action="peaksresults" total="${listsize}" max="100"
                                            params= "${[uuid:uuid]}" />
                            </div>
                            <br/>
                            <table class="table table-striped table-light results" cellspacing="0">

                                <thead>
                                <tr>
                                    <th>Chrom</th>
                                    <th nowrap="nowrap"> <a href="#" data-toggle="tooltip" data-placement="top" title="Start point of Input Genomic region;">Peak Start </span> <span class="glyphicon glyphicon-question-sign"></span></a>
                                         </th>
                                    <th nowrap="nowrap"><a href="#" data-toggle="tooltip" data-placement="top" title="End point of Input Genomic region;">Peak End </span> <span class="glyphicon glyphicon-question-sign"></span></a></th>
                                    <th>Entrez Gene ID</th>
                                    <th nowrap="nowrap">Gene Symbol</th>
                                    <th nowrap="nowrap"  data-toggle="popover" data-trigger="hover" title="">
                                        <a href="#" data-toggle="tooltip" data-placement="top" title="the start point of the annotation region (eg. promoter, enhancer, distal region, etc.) that are assigned to the gene;">Annotation Start <span class="glyphicon glyphicon-question-sign"></span></a>
                                    </th>
                                    <th nowrap="nowrap" data-toggle="popover" data-trigger="hover" title=" ">
                                        <a href="#" data-toggle="tooltip" data-placement="top" title="the end point of the annotation region (eg. promoter, enhancer, distal region, etc.) that are assigned to the gene;">Annotation End </span> <span class="glyphicon glyphicon-question-sign"></span></a>
                                        </th>


                                </tr>
                                </thead>
                                <tbody id="insertfirsttable">
                                <g:each var="prop" in="${peaklist}" index="i">
                                    <tr>
                                        <td>${prop.getChrom()}</td>
                                        <td>${prop.getPeakS()}</td>
                                        <td>${prop.getPeakE()}</td>
                                        <td>${prop.getGeneid()}</td>
                                        <td>${prop.getGeneSym()}</td>
                                        <td>${prop.getLstart()}</td>
                                        <td>${prop.getLend()}</td>


                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                </div>

            </div>

</div>
</body>
</html>