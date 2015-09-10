<%@ page import="seivom.Movie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movie.label', default: 'Movie')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'forms.css')}" type="text/css">
	</head>
	<body>
		<div class="container">
                        <g:if test="${flash.message}">
                        <div class="alert alert-danger col-md-offset-1" style="max-width: 900px;">
                          <a class="close" data-dismiss="alert">×</a>
                          ${flash.message}
                        </div>
			<div class="col-md-6 col-md-offset-3">
				<div class="form-area">
					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
					<g:hasErrors bean="${movieInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${movieInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:form method="post" >
						<g:hiddenField name="id" value="${movieInstance?.id}" />
						<g:hiddenField name="version" value="${movieInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>

						<br>

						<fieldset class="buttons">
							<g:actionSubmit class="btn btn-success pull-right" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
							<g:actionSubmit class="btn btn-warning" action="list" value="${message(code: 'default.button.back.label', default: 'Go Back')}"/>
						</fieldset>
					</g:form>
				</div>
			</div<>
		</div>
	</body>
</html>
