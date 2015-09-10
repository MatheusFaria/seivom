<%@ page import="seivom.Movie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movie.label', default: 'Movie')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'forms.css')}" type="text/css">
	</head>
	<body>

		<div class="container">
			<div class="col-md-6 col-md-offset-3">
				<div class="form-area">

					<h1><g:message code="default.create.label" args="[entityName]" /></h1>
					<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${movieInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${movieInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					<g:uploadForm action="save" >
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>

						<br>

						<fieldsets>
							<g:submitButton name="create" class="btn btn-success pull-right" value="${message(code: 'default.button.create.label', default: 'Create')}" />
							<g:actionSubmit class="btn btn-warning" action="list" value="${message(code: 'default.button.back.label', default: 'Go Back')}"/>
						</fieldset>
					</g:uploadForm>
				</div>
			</div>
		</div>
	</body>
</html>
