
<%@ page import="seivom.Director" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'director.label', default: 'Director')}" />
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
                                <g:fieldValue bean="${directorInstance}" field="name"/>
                            </div>
                            <div class="profile-usertitle-job">
                                <g:message code="default.director.label" default="Director"/>
                            </div>
                        </div>
                        <!-- END SIDEBAR USER TITLE -->
                        <!-- SIDEBAR BUTTONS -->
                        <g:form>
                        	<g:hiddenField name="id" value="${directorInstance?.id}" />
                            <g:hiddenField name="version" value="${directorInstance?.version}" />

							<fieldset class="profile-userbuttons">
	                            <g:link class="btn btn-success btn-sm" action="edit" id="${directorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
	                            <g:actionSubmit class="btn btn-danger btn-sm" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
						</g:form>
                        
                        <!-- END SIDEBAR BUTTONS -->
                        <!-- SIDEBAR MENU -->
                        <div class="profile-usermenu">
                            <ul class="nav">
                                <li class="active">
	                                <a href="#"><i class="glyphicon glyphicon-film"></i>
	                                	Directed Movies</a>
                                </li>
                            </ul>
                        </div>


                        <div class="profile-usermenu">
							<ul class="nav" role="navigation">
								<li>
									<a href="${createLink(controller:'director', action:'list')}"/><i class="glyphicon glyphicon-list"></i><g:message code="director.list.label" default="List Directors" /></a>
								</li>
								<li>
									<a href="${createLink(controller:'director', action:'create')}"/><i class="glyphicon glyphicon-plus"></i><g:message code="director.create.label" default="New Director" /></a>
								</li>

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



		


		<div id="show-director" class="content scaffold-show" role="main">
			<ol class="property-list director">
			
				<g:if test="${directorInstance?.movie}">
				<li class="fieldcontain">
					<span id="movie-label" class="property-label"><g:message code="director.movie.label" default="Movie" /></span>
					
						<g:each in="${directorInstance.movie}" var="m">
						<span class="property-value" aria-labelledby="movie-label"><g:link controller="movie" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
						
			</ol>
		</div>
	</body>
</html>
