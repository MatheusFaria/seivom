

<%@ page import="seivom.Studio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studio.label', default: 'Studio')}" />
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'card.css')}" type="text/css">
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div class="container">
			<div class="col-md-10 col-md-offset-1">
				<div class="row"> 
					<div role="navigation">
                                <sec:ifAllGranted roles="ROLE_ADMIN">
						<g:link class="btn btn-success pull-right" action="create"><i class="glyphicon glyphicon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
                                </sec:ifAllGranted>
					</div>
				</div>

				<div class="row">
					<div id="list-studio" class="scaffold-list" role="main">
						<h1><g:message code="default.list.label" args="[entityName]" /></h1>
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
						<table class="col-md-12">
							<thead>
								<tr>
								
									<g:sortableColumn property="name" title="${message(code: 'studio.name.label', default: 'Name')}" />
								
								</tr>
							</thead>
							<tbody>
							<g:each in="${studioInstanceList}" status="i" var="studioInstance">
									<tr onclick='document.location = "<g:createLink action='show' id='${studioInstance.id}'/>"'><td>
										<div class="card">
											${studioInstance.name}
										</div>
									</td></tr>
							</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
