
<%@ page import="seivom.Director" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'director.label', default: 'Director')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'card.css')}" type="text/css">
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
					<div id="list-director" class="scaffold-list" role="main">
						<g:if test="${flash.message}">
                                                <div class="alert alert-danger" style="max-width: 900px;">
                                                  <a class="close" data-dismiss="alert">×</a>
                                                  ${flash.message}
                                                </div>
						</g:if>
						<h1><g:message code="default.list.label" args="[entityName]" /></h1>
						<table class="col-md-12">
							<thead>
								<tr>
								
									<g:sortableColumn property="name" title="${message(code: 'director.name.label', default: 'Name')}" />
								
								</tr>
							</thead>
							<tbody>
							<g:each in="${directorInstanceList}" status="i" var="directorInstance">
									<tr onclick='document.location = "<g:createLink action='show' id='${directorInstance.id}'/>"'><td>
										<div class="card">
											${directorInstance.name}
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
