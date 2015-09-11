<!DOCTYPE html>
<html>
	<head>
      <meta name="layout" content="main"/>
    	<link rel="stylesheet" href="${resource(dir: 'css', file: 'profile.css')}" type="text/css">
    <title>seivom</title>
        <g:javascript library="jquery" plugin="jquery" />
	</head>
	<body>
<sec:ifLoggedIn>

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
                                                <li>
                                                        <g:remoteLink action="show_list" id="reviewed" update="moviesLists">
                                                                <i class="glyphicon glyphicon-check"></i>
                                                                <g:message code="default.reviewedmovies.label" />
                                                        </g:remoteLink>
                                                </li>
                                                <li>
                                                        <g:remoteLink action="show_list" id="watched" update="moviesLists">
                                                                <i class="glyphicon glyphicon-eye-open"></i>
                                                                <g:message code="default.watchedmovies.label" />
                                                        </g:remoteLink>
                                                </li>
                                                <li>
                                                        <g:remoteLink action="show_list" id="watchlater" update="moviesLists">
                                                                <i class="glyphicon glyphicon-dashboard"></i>
                                                                <g:message code="default.watchlater.label" />
                                                        </g:remoteLink>
                                                </li>
                                        </ul>
                                </div>

                                <sec:ifLoggedIn>
                                <div class="profile-usertitle">
                                        <div class="profile-usertitle-name">
                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                                Manage
                                </sec:ifAllGranted>
                                <sec:ifAllGranted roles="ROLE_USER">
                                                Lists
                                </sec:ifAllGranted>
                                        </div>
                                </div>
                                <div class="profile-usermenu">
                                        <ul class="nav">
                                         <li>
                                                <a href="${createLink(controller:'movie', action:'list')}"/>
                                                        <sec:ifAllGranted roles="ROLE_ADMIN">
                                                                <i class="glyphicon glyphicon-cog"></i>
                                                                <g:message code="movie.list.label" default="Manage Movies" /></a>
                                                        </sec:ifAllGranted>
                                                        <sec:ifAllGranted roles="ROLE_USER">
                                                                <i class="glyphicon glyphicon-list"></i>
                                                                Movies
                                                        </sec:ifAllGranted>
                                                </a>
                                        </li>
                                         <li>
                                                <a href="${createLink(controller:'director', action:'list')}"/>
                                                        <sec:ifAllGranted roles="ROLE_ADMIN">
                                                                <i class="glyphicon glyphicon-cog"></i>
                                                                <g:message code="director.list.label" default="Manage Directors" /></a>
                                                        </sec:ifAllGranted>
                                                        <sec:ifAllGranted roles="ROLE_USER">
                                                                <i class="glyphicon glyphicon-list"></i>
                                                                Directors
                                                        </sec:ifAllGranted>
                                                </a>
                                        </li>
                                         <li>
                                                <a href="${createLink(controller:'studio', action:'list')}"/>
                                                        <sec:ifAllGranted roles="ROLE_ADMIN">
                                                                <i class="glyphicon glyphicon-cog"></i>
                                                                <g:message code="studio.list.label" default="Manage Studios" /></a>
                                                        </sec:ifAllGranted>
                                                        <sec:ifAllGranted roles="ROLE_USER">
                                                                <i class="glyphicon glyphicon-list"></i>
                                                                Studios
                                                        </sec:ifAllGranted>
                                                </a>
                                        </li>
                                         <li>
                                                <a href="${createLink(controller:'actor', action:'list')}"/>
                                                        <sec:ifAllGranted roles="ROLE_ADMIN">
                                                                <i class="glyphicon glyphicon-cog"></i>
                                                                <g:message code="actor.list.label" default="Manage Actors" /></a>
                                                        </sec:ifAllGranted>
                                                        <sec:ifAllGranted roles="ROLE_USER">
                                                                <i class="glyphicon glyphicon-list"></i>
                                                                Actors
                                                        </sec:ifAllGranted>
                                                </a>
                                        </li>
                                        </ul>
                                </div>
                                </sec:ifLoggedIn>
                                <!-- END MENU -->
                        </div>
                </div>
                <div class="col-md-9">
            <div class="profile-content" id="moviesLists">
                <g:render template="displaymovielist" collection="${movielist}" var="movielist" />
            </div>
                </div>
        </div>
</sec:ifLoggedIn>
	</body>
</html>
