<%@ page import="seivom.Director" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'director.label', default: 'Director')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'forms.css')}" type="text/css">
	</head>

	<body>
		<div class="container">
			<div class="col-md-6 col-md-offset-3">
				<div class="form-area">

					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
					<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${directorInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${directorInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>

					<g:form method="post" >
						<g:hiddenField name="id" value="${directorInstance?.id}" />
						<g:hiddenField name="version" value="${directorInstance?.version}" />
						<fieldset>
							<g:render template="form"/>
						</fieldset>

						<br>

						<fieldset>
							<g:actionSubmit class="btn btn-success pull-right" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
							<g:actionSubmit class="btn btn-warning" action="show" value="${message(code: 'default.button.back.label', default: 'Go Back')}"/>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
