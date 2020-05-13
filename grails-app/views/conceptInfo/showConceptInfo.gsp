<%@ page import="gsesuite.PeakInfo" %>

%{--http://jsfiddle.net/QLfMU/116/--}%

<!DOCTYPE html>
<html>
    <head>
        <head>
            <meta name="layout" content="main" />
            <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
            <asset:javascript src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min.js"/>

            <asset:stylesheet src="theme.default.css"/>
            <asset:stylesheet src="jquery-jui.css"/>
            <asset:javascript src="jquery.tablesorter.js"/>
            <asset:javascript src="jquery.tablesorter.widgets.js"/>
            <g:set var="entityName" value="${message(code: 'conceptInfo.label', default: 'ConceptInfo')}" />
            <title><g:message code="default.show.label" args="[entityName]" /></title>
            <style type="text/css">
                .table{
                    align:center;
                    horiz-align:center;

                }

            .table tr {
                cursor: pointer;
                text-align:left;
            }
            .hiddenRow {
                padding: 0 4px !important;
                background-color: #eeeeee;
                font-size: 13px;
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

            #filters{

                word-wrap: break-word;
                overflow:hidden;
                text-overflow:ellipsis;

            }

            .panel-body {
                padding: 5px;
                background:gr;
                padding-bottom: 10px;
                padding-top:10px;
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

            .button {
                background-color: white; /* Green */
                border: 1px solid #cccccc;
                color: black;
                padding: 15px 12px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }
                sub {
                    vertical-align: sub;
                    font-size: smaller;
                }

            .container-fluid {
                padding-right:0;
                padding-left:0;
                margin-right:auto;
                margin-left:auto
            }

            .row-fluid {
                position: relative;
                max-width: 100%;

                /* margin: 0 auto; */

            }

            .panel {
                border-radius: 12px;
                border: 2px solid  #ebebeb;
                padding: 0px;
            }

            table#panel {
                width: 100%;
                table-layout:fixed;
            }

            table#panel td {
                word-wrap: break-word;
                line-height: 1em;
                padding: 0.4em 0.4em;
                text-align: left;
            }
                .example_b {
                    color: #fff !important;
                    text-transform: uppercase;
                    background: steelblue;
                    padding: 20px;
                    border-radius: 50px;
                    display: inline-block;
                    border: none;
                }

                .example_b:hover {
                    text-shadow: 0px 0px 6px rgba(255, 255, 255, 1);
                    -webkit-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
                    -moz-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
                    transition: all 0.4s ease 0s;
                }


            </style>
            <g:javascript library='jquery'>



                $(document).ready(function () {

                      $.extend($.tablesorter.themes.jui, {
                            // change default jQuery uitheme icons - find the full list of icons at
                            // http://jqueryui.com/themeroller/ (hover over them for their name)
                            table        : 'ui-widget ui-widget-content ui-corner-all', // table classes
                            caption      : 'ui-widget-content',
                            // header class names
                            header       : 'ui-widget-header ui-corner-all ui-state-default', // header classes
                            sortNone     : '',
                            sortAsc      : '',
                            sortDesc     : '',
                            active       : 'ui-state-active', // applied when column is sorted
                            hover        : 'ui-state-hover',  // hover class
                            // icon class names
                            icons        : 'ui-icon', // icon class added to the <i> in the header
                            iconSortNone : 'ui-icon-carat-2-n-s ui-icon-caret-2-n-s', // class name added to icon when column is not sorted
                            iconSortAsc  : 'ui-icon-carat-1-n ui-icon-caret-1-n', // class name added to icon when column has ascending sort
                            iconSortDesc : 'ui-icon-carat-1-s ui-icon-caret-1-s', // class name added to icon when column has descending sort
                            filterRow    : '',
                            footerRow    : '',
                            footerCells  : '',
                            even         : 'ui-widget-content', // even row zebra striping
                            odd          : 'ui-state-default'   // odd row zebra striping
                          });






  var $table1 = $( '#demo' )
                .tablesorter({
                  theme : 'default',
                  // this is the default setting
                  cssChildRow : "tablesorter-childRow",
                  sortList: [[4,1]],

                  // initialize zebra and filter widgets
                  widgets : ["uitheme","zebra", "filter", "pager" ],

                  widgetOptions: {
                    // output default: '{page}/{totalPages}'
                    // possible variables: {page}, {totalPages}, {filteredPages}, {startRow}, {endRow}, {filteredRows} and {totalRows}
                    pager_output: '{startRow} - {endRow} / {filteredRows} ({totalRows})',

                    pager_removeRows: false,

                    // include child row content while filtering, if true
                    filter_childRows  : true,
                    // class name applied to filter row and each input
                    filter_cssFilter  : 'tablesorter-filter',
                    // search from beginning
                    filter_startsWith : false,
                    // Set this option to false to make the searches case sensitive
                    filter_ignoreCase : true
                  }

                });

              // hide child rows - get in the habit of not using .hide()
              // See http://jsfiddle.net/Mottie/u507846y/ & https://github.com/jquery/jquery/issues/1767
              // and https://github.com/jquery/jquery/issues/2308
              // This won't be a problem in jQuery v3.0+
              $table1.find( '.tablesorter-childRow td' ).addClass( 'hidden' );

              // Toggle child row content (td), not hiding the row since we are using rowspan
              // Using delegate because the pager plugin rebuilds the table after each page change
              // "delegate" works in jQuery 1.4.2+; use "live" back to v1.3; for older jQuery - SOL
              $table1.delegate( '.toggle', 'click' ,function() {
                // use "nextUntil" to toggle multiple child rows
                // toggle table cells instead of the row
                $( this )
                  .closest( 'tr' )
                  .nextUntil( 'tr.tablesorter-hasChildRow' )
                  .find( 'td' )
                  .toggleClass( 'hidden' );
                return false;
              });

              // Toggle filter_childRows option
              $( 'button.toggle-combined' ).click( function() {
                var wo = $table1[0].config.widgetOptions,
                o = !wo.filter_childRows;
                wo.filter_childRows = o;
                $( '.state1' ).html( o.toString() );
                // update filter; include false parameter to force a new search
                $table1.trigger( 'search', false );
                return false;
              });




                 $('.accordian-body').on('show.bs.collapse', function () {
                        $(this).closest("table")
                            .find(".collapse.in")
                            .not(this)
                            .collapse('toggle')
                    })










                    $("#dasButton").click(function(){
                        event.stopPropagation();
                        var inputValue=$("#dasButton").attr('value');

                        console.log(inputValue);

                        if(inputValue=="+")
                        {
                            console.log("inside plus");
                        $("#div1").animate({height:"150px"});
                        $("#dasButton").attr('value','-');
                        }
                        else if(inputValue=="-")
                        {
                            console.log("inside minus");
                        $("#div1").animate({height:"0px"});
                        $("#dasButton").attr('value','+');
                        }
                        });




                });



                function selectPub(){
               // alert("selected dropdown file");

                var pubid  = $('[id*="publications"]:checked').map(function() { return $(this).val().toString(); } ).get().join(",");

                //alert(pubid)

                 var treatid  = $('[id*="treats"]:checked').map(function() { return $(this).val().toString(); } ).get().join(",")

                  var locus   = $('[id*="locus"]:checked').map(function() { return $(this).val().toString(); } ).get().join(",")

                var q= "${q}";
                //alert(q);

                var fdr =$('#city').val();

                // alert(fdr);
                window.location.href  ='${createLink(action:'showConceptInfo')}?pubid='+ pubid+'&q='+q+'&fdr='+fdr+'&treatid='+treatid+'&locus='+locus;
             //w.onload = function() { this.document.title = "Concept Information"; }



                }


                function SortPval(){



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




            </g:javascript>


    </head>
    <body>
        <a href="#show-conceptInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">

        </div>
        <div id="show-conceptInfo" class="content scaffold-show" role="main">
            <h1 style="font-size: x-large">Gene Set Information</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="container">


           <div class="panel panel-primary">
            <div class="panel-heading">Concept Info</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-8">
                        <table id="panel" >
                            <tr><td width="20%">Concept Name : </td><td> ${concept.coname.toString().replaceAll("\\[", "").replaceAll("\\]","")}</td></tr>
                        <tr><td width="20%">Concept id :</td><td> ${concept.conid.toString().replaceAll("\\[", "").replaceAll("\\]","")    }</td></tr>
                        <tr><td width="20%">Concept Number of genes: </td><td>${concept.ngenes.toString().replaceAll("\\[", "").replaceAll("\\]","")    }</td></tr>
                        <tr><td width="20%">Concept genes : </td><td>${concept.gids.toString().replaceAll("\\[", "").replaceAll("\\]","")   }</td></tr>
                        </table>

                   </div>

                    </div>
                </div>

            </div>
            </div>


            <div class="modal-body row">

                <div class="col-md-2">
                <br/>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Filters</div>
                        <div class="panel-body">
                        <div id="filters">

                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                      <p style="word-wrap:break-word;overflow:hidden;text-overflow:ellipsis;"> <span class="glyphicon glyphicon-collapse-down"></span>Transcrption Factor </p>
                    </button>
                </p>
                     <div class="collapse" id="collapseExample">
                        <div class="card card-body">
                            <g:each status="i" in="${treatmentslis}" var="pub">
                                <g:if test="${pubid?.contains(pub.toString())}">
                                    <input id="publications" type="checkbox" checked="checked" value="${pub}" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>${pub} <br/>
                                </g:if>
                                <g:else>
                                    <input id="publications" type="checkbox"  value="${pub}" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>${pub}<br/>
                                </g:else>

                            </g:each>
                        </div>
                    </div>



                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
                        <span class="glyphicon glyphicon-collapse-down"></span> Treatment
                    </button>
                </p>
                    <div class="collapse" id="collapseExample1">
                        <div class="card card-body">
                            <g:each status="i" in="${treatments}" var="pub">
                            <g:if test="${pubid.contains(pub.toString())}">
                                <input id="treats" type="checkbox" checked="checked" value="${pub.id}" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>${pub} <br/>
                            </g:if>
                            <g:else>
                                <input id="treats" type="checkbox"  value="${pub}" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>${pub}<br/>
                            </g:else>
                            </g:each>
                        </div>
                        </div>


                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                        <p style="word-wrap:break-word;overflow:hidden;text-overflow:ellipsis;"> <span class="glyphicon glyphicon-collapse-down"></span>Locus Definition </p>
                    </button>
                </p>
                    <div class="collapse" id="collapseExample2">
                        <div class="card card-body">

                                    <input id="locus" type="checkbox" value="5kb" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>Prmoter<br/>
                                    <input id="locus" type="checkbox"  value="outside_5kb" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>Distal<br/>
                                <input id="locus" type="checkbox"  value="nearest_tss" data-idx="${status}" class="extCbxYear" onclick='selectPub(this);'>Nearest TSS<br/>


                        </div>
                    </div>

                    </div>





</div>
                </div>
                </div>
                <div class="col-md-9" style=" line-height: 0px">

                    <g:form action="showConceptInfo">
                           FDR:<g:textField name="fdr" style="line-height: 2em;" id="city" value="${fdr}" />

                        %{--<li><g:checkBox name="promoter" value="Promoter" />Promoter  </li>
                        <li><g:checkBox name="distal" value="Distal Regions" /> Distal Regions</li>
                        <li><g:checkBox name="all" value="All Regions" /> All Regions</li>--}%
                        <g:hiddenField name="q" value="${concept.coname.toString().replaceAll("\\[", "").replaceAll("\\]","")}" />
                        <g:hiddenField name="treatid" value="${treatid}" />
                        <g:hiddenField name="pubid" value="${pubid}" />
                        <g:submitButton name="Update" class="example_b" />

                        </g:form>


                    <g:form action="testD3">


                    %{--<li><g:checkBox name="promoter" value="Promoter" />Promoter  </li>
                    <li><g:checkBox name="distal" value="Distal Regions" /> Distal Regions</li>
                    <li><g:checkBox name="all" value="All Regions" /> All Regions</li>--}%
                        <g:hiddenField name="q" value="${concept.coname.toString().replaceAll("\\[", "").replaceAll("\\]","")}" />
                        <g:hiddenField name="treatid" value="${treatid}" />
                        <g:hiddenField name="pubid" value="${pubid}" />
                        <g:submitButton name="showHeatmap" class="example_b" />

                    </g:form>
                    <br/>
                    <br/>
                    <br/>
                        <table id="demo" class="table">
                            <thead style="background-color: #3f87a6;">
                            <th>Name</th>
                            <th>Entrez ID</th>
                            <th>Full Name</th>
                            <th colspan="2"># of significant Chip-Seq </th>
                            <th colspan="2"># of total Chip-Seq datasets</th>
                            <th>Negative avg log<sub>10</sub>P </th>
                            </thead>
                            <tbody>

                                <g:each in="${resultrq}" var="count" status="i" >
                                    <g:set var="tom" value="${ 'cat'+ i}" />
                                    <tr data-toggle="collapse" data-target=".demo${i}">
                                        <td><a href="#" class="toggle"><span class="glyphicon glyphicon-collapse-down"></span></a> ${count.transf}</td>
                                        <td>${count.tfegid}</td>
                                        <td>${count.fullname}</td>
                                        <td colspan="2">${count.sigcount}</td>
                                        <td colspan="2">${count.totalcount}</td>
                                        <td>${count.pvalavg}</td>
                                    </tr>

                                    <tr class="tablesorter-childRow">
                                        <td colspan="8">
                                         <div>
                                         <table>
                                           <tr>
                                               <td>Treatment</td>
                                               <td>Status</td>
                                               <td>Cell-lin</td>
                                               <td>Pval</td>
                                               <td>FDR</td>
                                               <td>Peakgenes</td>
                                               <td>Locus-def</td>
                                               <td>File name</td>
                                           </tr>
                                    <g:each in="${count.fnames}" var="statuscheck" status="j">  
                                        <g:if test="${fdr.toDouble() <= statuscheck.fdr.toDouble()}">
                                            <tr bgcolor="#4682b4">
                                        </g:if>
                                        <g:else>
                                        <tr>
                                        </g:else>
                                            <td>${statuscheck.treatment}</td>
                                            <td>${statuscheck.status}</td>
                                            <td>${statuscheck.cellline}</td>
                                            <td>${statuscheck.pval}</td>
                                        <g:if test="${statuscheck.fdr.toDouble()<=fdr.toDouble()  }">
                                            <td style="background-color: steelblue">${statuscheck.fdr}</td>
                                        </g:if>
                                        <g:else>
                                            <td>${statuscheck.fdr}</td>
                                        </g:else>
                                            <td>${statuscheck.peakgenes}</td>
                                            <td>${statuscheck.locusdef}</td>
                                            <td>link</td>
                                        </tr>
                                    </g:each>
                                        </table>
                                        </div>
                            </g:each> 
                            </tbody>






</table>
                </div>
            </div>
        </div>
        </div>

</body>
</html>
