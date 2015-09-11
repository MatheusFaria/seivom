<%@ page import="seivom.Director" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'director.label', default: 'Director')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'forms.css')}" type="text/css">
	</head>

	<body>
		
		<div class="container">
                        <g:if test="${flash.message}">
                        <div class="alert alert-danger col-md-offset-1" style="max-width: 900px;">
                          <a class="close" data-dismiss="alert">×</a>
                          ${flash.message}
                        </div>
                        </g:if>
                        <g:hasErrors bean="${directorInstance}">
                          <g:eachError bean="${directorInstance}" var="error">
                                <div class="alert alert-danger col-md-offset-1" style="max-width: 900px;">
                                  <a class="close" data-dismiss="alert">×</a>
                                  <g:message error="${error}"/>
                                </div>
                          </g:eachError>
                        </g:hasErrors>
			<div class="col-md-6 col-md-offset-3">
				<div class="form-area">

					<h1><g:message code="default.create.label" args="[entityName]" /></h1>

					<g:form action="save" >
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>

						<br>

						<fieldset>
							<g:submitButton name="create" class="btn btn-success pull-right" value="${message(code: 'default.button.create.label', default: 'Create')}" />
							<g:actionSubmit class="btn btn-warning" action="list" value="${message(code: 'default.button.back.label', default: 'Go Back')}"/>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
