<!DOCTYPE html>
<html>
	<head>
      <meta name="layout" content="main"/>
    	<link rel="stylesheet" href="${resource(dir: 'css', file: 'profile.css')}" type="text/css">
    <title>Seivom</title>
	</head>
	<body>
<sec:ifLoggedIn>

<!--
User Profile Sidebar by @keenthemes
A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
Licensed under MIT
-->

<div class="container">
    <div class="row profile">
                <div class="col-md-3">
                        <div class="profile-sidebar">
                                <!-- SIDEBAR USERPIC -->
                                <div class="profile-userpic">
                                        <img src="${resource(dir: 'images', file: 'user-img.png')}" class="img-responsive" alt="">
                                </div>
                                <!-- END SIDEBAR USERPIC -->
                                <!-- SIDEBAR USER TITLE -->
                                <div class="profile-usertitle">
                                        <div class="profile-usertitle-name">
                                                ${params.person.realname}
                                        </div>
                                        <div class="profile-usertitle-job">
                                                Viewer
                                        </div>
                                </div>
                                <!-- END SIDEBAR USER TITLE -->
                                        <!-- SIDEBAR BUTTONS 
                                        <div class="profile-userbuttons">
                                                <button type="button" class="btn btn-success btn-sm">Follow</button>
                                                <button type="button" class="btn btn-danger btn-sm">Message</button>
                                        </div>
                                        -->
                                <!-- END SIDEBAR BUTTONS -->
                                <!-- SIDEBAR MENU -->
                                <div class="profile-usermenu">
                                        <ul class="nav">
                                                <li class="active">
                                                        <a href="#">
                                                        <i class="glyphicon glyphicon-check"></i>
                                                        Reviewed Movies </a>
                                                </li>
                                                <li>
                                                        <a href="#">
                                                        <i class="glyphicon glyphicon-eye-open"></i>
                                                        Movies Watched</a>
                                                </li>
                                                <li>
                                                        <a href="#">
                                                        <i class="glyphicon glyphicon-dashboard"></i>
                                                        Watch Later </a>
                                                </li>
                                        </ul>
                                </div>

                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                <div class="profile-usertitle">
                                        <div class="profile-usertitle-name">
                                                Manage
                                        </div>
                                </div>
                                <div class="profile-usermenu">
                                        <ul class="nav">
                                         <li>
                                                <a href="${createLink(controller:'director', action:'list')}"/>
                                                        <i class="glyphicon glyphicon-cog"></i>
                                                <g:message code="director.list.label" default="Manage Movies" /></a>
                                        </li>
                                         <li>
                                                <a href="${createLink(controller:'director', action:'list')}"/>
                                                        <i class="glyphicon glyphicon-cog"></i>
                                                <g:message code="director.list.label" default="Manage Directors" /></a>
                                        </li>
                                         <li>
                                                <a href="${createLink(controller:'studio', action:'list')}"/>
                                                        <i class="glyphicon glyphicon-cog"></i>
                                                <g:message code="director.list.label" default="Manage Studios" /></a>
                                        </li>
                                         <li>
                                                <a href="${createLink(controller:'director', action:'list')}"/>
                                                        <i class="glyphicon glyphicon-cog"></i>
                                                <g:message code="director.list.label" default="Manage Actors" /></a>
                                        </li>
                                        </ul>
                                </div>
                                </sec:ifAllGranted>
                                <!-- END MENU -->
                        </div>
                </div>
                <div class="col-md-9">
            <div class="profile-content">
                <g:render template="movies" collection="${params.movies}" var="movie" />
            </div>
                </div>
        </div>
<!-- </div>
<center>
<strong>Powered by <a href="http://j.mp/metronictheme" target="_blank">KeenThemes</a></strong>
</center>
<br>
<br> -->
</sec:ifLoggedIn>
	</body>
</html>
