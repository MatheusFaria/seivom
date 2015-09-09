
<%@ page import="seivom.Movie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movie.label', default: 'Movie')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'card.css')}" type="text/css">
	</head>
	<body>
		<div class="container">
			<div class="col-md-10 col-md-offset-1">
				<sec:ifAllGranted roles="ROLE_ADMIN">
				<div class="row"> 
					<div class="nav" role="navigation">
						<g:link class="btn btn-success pull-right" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
					</div>
				</div>
				</sec:ifAllGranted>

				<div class="row">
					<div id="list-movie" class="content scaffold-list" role="main">
						<h1><g:message code="default.list.label" args="[entityName]" /></h1>
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
						<table class="col-md-12">
							<thead>
								<tr>
									<g:sortableColumn property="title" title="${message(code: 'movie.title.label', default: 'Title')}" />
								</tr>
							</thead>
							<tbody>
							<g:each in="${movieInstanceList}" status="i" var="movieInstance">
								<tr onclick='document.location = "<g:createLink action='show' id='${movieInstance.id}'/>"'>
									<td>
										<div class="card">
											<div class="movie-poster">
												<img src="${resource(dir: 'images', file: 'poster-placeholder.jpg')}" class="img-responsive" alt="">
											</div>
											<div class="container-fluid">
												<div class="movie-title">
													${movieInstance.title}
												</div>
											</div>
										</div>
									</td>
								</tr>
							</g:each>
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
