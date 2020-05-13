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





        } );



    </g:javascript>
</head>

<body>
<div class="container-fluid p-2" >
    <div class="row">
                <div>

                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="nav navbar-primary " role="navigation">
                            <ul class="nav nav-tabs-mod" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link active" href="#"><g:link action="peaksresults" params="[uuid: "${uuid}"]">Peak-to-gene assignments</g:link></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="#"><g:link action="peakpergeneresult" params="[uuid: "${uuid}"]">Peaks per Gene</g:link></a>
                                </li>

                            </ul>
                        </div>







                        <div class="table-bordered table-responsive fixed-table-body text-center">
                            <h2>Peak-per-gene assignments</h2>
                            <div id="c2">

                                <div> <export:formats formats="['csv', 'excel']" params="[uuid:"${uuid}"]" /></div>
                            </div>

                    %{--    /public PeaksperGene(String geneid, Double length, Double log10len, Integer numpeaks, int peak) {--}%
                            <div class="pagination">

                                <g:paginate next="Forward" prev="Back"

                                            action="peakspergeneresult" total="${listsize}" max="100"
                                            params= "${[uuid:uuid]}" />
                            </div>
                            <br/>
                            <table class="table table-striped table-light results" cellspacing="0">


                                <thead>
                        <tr>

                            <th nowrap="nowrap">Gene ID</th>
                            <th nowrap="nowrap">Length</th>
                            <th nowrap="nowrap">Log 10 length</th>
                            <th nowrap="nowrap">Number of peaks</th>

                        </tr>
                        </thead>
                        <tbody id="insertfirsttable">
                        <g:each var="prop" in="${peaklist}" index="i">
                            <tr>
                                <td>${prop.getGeneid()}</td>
                                <td>${prop.getLength()}</td>
                                <td>${prop.getLog10len()}</td>
                                <td>${prop.getNumpeaks()}</td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>

            </div>

</div>
</body>
</html>