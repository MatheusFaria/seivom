
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
                            <img src="${resource(dir: 'images', file: 'poster-placeholder.jpg')}" class="img-responsive" alt="">
                        </div>
                        <!-- END SIDEBAR USERPIC -->
                        <!-- SIDEBAR USER TITLE -->
                        <div class="profile-usertitle">
                            <div class="profile-usertitle-name">
                                <g:fieldValue bean="${movieInstance}" field="title"/>
                            </div>
                            <div class="profile-usertitle-job">
                                <g:message code="default.movie.label" default="Movie"/>
                            </div>
                        </div>
                        <!-- END SIDEBAR USER TITLE -->
                        <!-- SIDEBAR BUTTONS -->
                        
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
                	<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>

					Reviews
            	</div>
            </div>
        </div>
	</body>
</html>
