
<%@ page import="seivom.Studio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studio.label', default: 'Studio')}" />
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
                                <g:fieldValue bean="${studioInstance}" field="name"/>
                            </div>
                            <div class="profile-usertitle-job">
                                ${studioInstance.country}
                            </div>
                        </div>
                        <!-- END SIDEBAR USER TITLE -->
                        <!-- SIDEBAR BUTTONS -->
                        <sec:ifLoggedIn>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                        <g:form>
                            <g:hiddenField name="id" value="${studioInstance?.id}" />
                            <g:hiddenField name="version" value="${studioInstance?.version}" />

							<fieldset class="profile-userbuttons">
	                            <g:link class="btn btn-success btn-sm" action="edit" id="${studioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
	                            <g:actionSubmit class="btn btn-danger btn-sm" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
	                                	<g:message code="studio.released.label" default="Released movies" />
	                                </a>
                                </li>
                            </ul>
                        </div>


                        <div class="profile-usermenu">
							<ul class="nav" role="navigation">
								<li>
									<a href="${createLink(controller:'studio', action:'list')}"/><i class="glyphicon glyphicon-list"></i><g:message code="studio.list.label" default="List Studios" /></a>
								</li>
                        <sec:ifLoggedIn>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
								<li>
									<a href="${createLink(controller:'studio', action:'create')}"/><i class="glyphicon glyphicon-plus"></i><g:message code="studio.create.label" default="New Studio" /></a>
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
                	<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>

					Movies
            	</div>
            </div>
        </div>
    </body>
</html>
