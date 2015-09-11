
<%@ page import="seivom.Movie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movie.label', default: 'Movie')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'profile.css')}" type="text/css">
	</head>

	<!--
	Profile Sidebar by @keenthemes
	A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
	Licensed under MIT
	-->

	<body>
		<div class="container">
    		<div class="row profile">
                <div class="col-md-3">
                    <div class="profile-sidebar">
                        <!-- SIDEBAR USERPIC -->
                        <div class="movie-poster">
                            <img src="${createLink(controller:'movie', action:'get_poster', id:movieInstance.ident())}" class="img-responsive" alt="">
                        </div>
                        <!-- END SIDEBAR USERPIC -->



                        <!-- SIDEBAR BUTTONS -->
                        <sec:ifLoggedIn>
                        <g:form>
                          <g:hiddenField name="id" value="${movieInstance?.id}" />
                          <g:hiddenField name="version" value="${movieInstance?.version}" />
                          <fieldset class="profile-userbuttons">
                               <g:if test="${params.person.watchedmovies.contains(movieInstance)}">
                                    <g:link class="btn btn-danger btn-sm" action="remove_watched_movie" id="${movieInstance?.id}">
                                      <i class="glyphicon glyphicon-eye-close"></i>
                                      <g:message code="Didn't Watch" default="Didn't Watch" />
                                    </g:link>
                               </g:if>
                               <g:else>
                                    <g:link class="btn btn-success btn-sm" action="watched_movie" id="${movieInstance?.id}">
                                      <i class="glyphicon glyphicon-eye-open"></i>
                                      <g:message code="Watched" default="Watched" />
                                    </g:link>
                               </g:else>
                            <g:link class="btn btn-warning btn-sm" action="watch_later_movie" id="${movieInstance?.id}">
                              <i class="glyphicon glyphicon-dashboard"></i>
                              <g:message code="Watch Later" default="Watch Later" />
                            </g:link>
                          </fieldset>
                        </g:form>
                        </sec:ifLoggedIn>

                        <sec:ifAllGranted roles="ROLE_ADMIN">
                        <g:form>
                        	<g:hiddenField name="id" value="${movieInstance?.id}" />
                            <g:hiddenField name="version" value="${movieInstance?.version}" />

							<fieldset class="profile-userbuttons">
	                            <g:link class="btn btn-success btn-sm" action="edit" id="${movieInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
	                            <g:actionSubmit class="btn btn-danger btn-sm" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
						</g:form>
                        </sec:ifAllGranted>
                        
                        <!-- END SIDEBAR BUTTONS -->
                        <!-- SIDEBAR MENU -->
                        <div class="profile-usermenu">
                            <ul class="nav">
                                <li class="active">
	                                <a href="#"><i class="glyphicon glyphicon-user"></i>
	                                	Reviews</a>
                                </li>
                            </ul>
                        </div>


                        <div class="profile-usermenu">
							<ul class="nav" role="navigation">
								<li>
									<a href="${createLink(controller:'movie', action:'list')}"/><i class="glyphicon glyphicon-list"></i><g:message code="movie.list.label" default="List Movies" /></a>
								</li>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
								<li>
									<a href="${createLink(controller:'movie', action:'create')}"/><i class="glyphicon glyphicon-plus"></i><g:message code="movie.create.label" default="New Movie" /></a>
								</li>
                        </sec:ifAllGranted>

							</ul>
						</div>

                        <!-- END MENU -->
                    </div>
                </div>

            <div class="col-md-9">
                <div class="profile-content">
                <h1>${movieInstance?.title}</h1>

                <p>
                  <a href="${createLink(controller:'director', action:'show', id:movieInstance?.director.id)}"/>
                      ${movieInstance?.director.name}</a>, ${movieInstance?.year.getAt(Calendar.YEAR)}

                  (<a href="${createLink(controller:'studio', action:'show', id:movieInstance?.studio.id)}"/>${movieInstance?.studio.name}</a>)
                </p>

                <p> <g:message code="default.duration_label"/>: ${movieInstance?.duration} <g:message code="default.time.minutes" default="minutes" /></p>
                <div class="well">
                  <strong> Synopsis </strong>
                  <p>${movieInstance?.description}</p>
                </div>

                <g:if test="${movieInstance?.actors}">
                  <div class="panel panel-default">
                    <div class="panel-heading"><strong>Actors</strong></div>
                    <div class="panel-body">
                      <g:each in="${movieInstance?.actors}">
                        <p>${it.name}</p>
                      </g:each>
                    </div>
                  </div>
                </g:if>

                <h1><g:message code="default.review.label"/></h1>
                <g:render template="review" collection="${movieInstance?.reviews}" var="review" />
                
                <sec:ifAllGranted roles="ROLE_ADMIN">
                  <g:render template="form_review" />
                </sec:ifAllGranted>
            </div>
            </div>
        </div>
	</body>
</html>
