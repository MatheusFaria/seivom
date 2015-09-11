
<%@ page import="seivom.Actor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'actor.label', default: 'Actor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'profile.css')}" type="text/css">
	</head>

	<!--
	User Profile Sidebar by @keenthemes
	A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
	Licensed under MIT
	-->

	<body>		
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
                                <g:fieldValue bean="${actorInstance}" field="name"/>
                            </div>
                            <div class="profile-usertitle-job">
                                <g:message code="default.actor.label" default="Actor"/>
                            </div>
                        </div>
                        <!-- END SIDEBAR USER TITLE -->
                        <!-- SIDEBAR BUTTONS -->
                        
                        <sec:ifLoggedIn>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                        <g:form>
                        	<g:hiddenField name="id" value="${actorInstance?.id}" />
                            <g:hiddenField name="version" value="${actorInstance?.version}" />

							<fieldset class="profile-userbuttons">
	                            <g:link class="btn btn-success btn-sm" action="edit" id="${actorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
	                            <g:actionSubmit class="btn btn-danger btn-sm" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
						</g:form>
                        </sec:ifAllGranted>
                        </sec:ifLoggedIn>
                        
                        <!-- END SIDEBAR BUTTONS -->
                        <!-- SIDEBAR MENU -->
                        <div class="profile-usermenu">
                            <ul class="nav">
                                <li class="active">
	                                <a href="#"><i class="glyphicon glyphicon-film"></i>
	                                	Movies Acted</a>
                                </li>
                            </ul>
                        </div>


                        <div class="profile-usermenu">
							<ul class="nav" role="navigation">
								<li>
									<a href="${createLink(controller:'actor', action:'list')}"/><i class="glyphicon glyphicon-list"></i><g:message code="actor.list.label" default="List Actors" /></a>
								</li>
                        <sec:ifLoggedIn>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
								<li>
									<a href="${createLink(controller:'actor', action:'create')}"/><i class="glyphicon glyphicon-plus"></i><g:message code="actor.create.label" default="New Actor" /></a>
								</li>
                        </sec:ifAllGranted>
                        </sec:ifLoggedIn>

							</ul>
						</div>

                        <!-- END MENU -->
                    </div>
                </div>

            <div class="col-md-9">
				<div class="profile-content">

                        <g:render template="/home/movies" collection="${actorInstance.movies}" var="movie" />
            	</div>
            </div>
        </div>


		

	</body>
</html>
