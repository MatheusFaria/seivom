<%@ page import="seivom.Review" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
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
                        </g:if>
                        <g:hasErrors bean="${reviewInstance}">
                          <g:eachError bean="${reviewInstance}" var="error">
                                <div class="alert alert-danger col-md-offset-1" style="max-width: 900px;">
                                  <a class="close" data-dismiss="alert">×</a>
                                  <g:message error="${error}"/>
                                </div>
                          </g:eachError>
                        </g:hasErrors>
			<div class="col-md-6 col-md-offset-3">
				<div class="form-area">

					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>

					<g:form method="post" >
						<g:hiddenField name="id" value="${reviewInstance?.id}" />
						<g:hiddenField name="version" value="${reviewInstance?.version}" />
						<fieldset>
							<g:render template="form"/>
						</fieldset>

						<br>

						<fieldset>
							<g:actionSubmit class="btn btn-success pull-right" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
