
<!doctype html>
<html lang="en" class="no-js">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>





    <asset:stylesheet src="application2.css"/>
    <asset:stylesheet src="main2.css"/>
    <asset:javascript src="validation.js"/>



    <link rel="stylesheet" href="/resources/demos/style.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">


    <g:layoutHead/>
</head>
<body>

<div class="navbar navbar-custom navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a  class="navbar-left" href="${createLink(uri: '/')}"><img src="${resource(dir: 'images', file: 'GSELogoFinal.png')}" alt="GSE" style="max-height: 250px; max-width: 150px;" /></a>
        </div>


        <ul class="nav navbar-nav ">
            <li>
                <g:link controller="inputParam" action="main"> <span class="glyphicon glyphicon-home"></span> Home </g:link>
            </li>

            <li class="dropdown">
                <g:link controller="inputParam" action="tutorials"><span class="glyphicon glyphicon glyphicon-book"></span> Tutorials</g:link>
            </li>
            <li class="dropdown">
                <g:link controller="inputParam" action="news"><span class="glyphicon glyphicon-list-alt"></span> News</g:link>

            </li>

            <li class="dropdown">
                <g:link controller="inputParam" action="contact"><span class="glyphicon glyphicon-envelope"></span> Contact Us</g:link>

            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" >Software <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="http://lrpath-db.med.umich.edu/" target="_blank">LR Path</a></li>
                    <li><a href="http://chip-enrich.med.umich.edu/" target="_blank"> Chip-Enrich</a></li>
                    <li><a href="http://broad-enrich.med.umich.edu/" target="_blank">Broad-Enrich</a></li>

                </ul>
            </li>

        </ul>

        <ul class="nav navbar-nav navbar-right">
            <sec:ifLoggedIn>
                <g:set var="userid" value="${sec.loggedInUserInfo(field:'id')}" />
                <li><g:link controller="user" action="show" id="${userid}"><span class="glyphicon glyphicon-user"></span> <sec:username/> </g:link></li>
                <li><g:link controller="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</g:link></li>


            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <li>  <g:link controller="login"><span class="glyphicon glyphicon-user"></span>  Login</g:link></li>
                <li><g:link controller="user" action="create"><span class="glyphicon glyphicon-pencil"></span> Register</g:link></li>
            </sec:ifNotLoggedIn>

        </ul>
    <br/>
    <br/>





    </div>

</div>





<div class="nav" role="navigation">

</div>

<g:layoutBody/>


<div id="spinner" class="spinner" style="display:none;">

</div>


</body>
</html>
