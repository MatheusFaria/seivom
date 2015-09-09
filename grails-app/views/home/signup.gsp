<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
                <style type='text/css' media='screen'>
                        #signupform {
                                max-width: 500px;
                        }
                </style>
		<title>Seivom</title>
	</head>
	<body>
<div class="section">
      <div class="container" id="signupform">
<g:if test="${params.error_flag}">
        <div class="alert alert-danger" style="max-width: 900px;">
          <a class="close" data-dismiss="alert">×</a>
          <strong>Error: </strong>Invalid information on sign up!
        </div>
</g:if>
        <div class="row">
          <div class="col-md-12">
            <g:form role="form" url="[action: 'createUser']" name="signupForm">
              <div class="form-group">
                <label class="control-label" for="inputName">Name</label>
                <g:field class="form-control" id="inputName" name="realname"
                placeholder="Enter name" type="text" value="" />
              </div>
              <div class="form-group">
                <label class="control-label" for="inputEmail">Email address</label>
                <g:field class="form-control" id="inputEmail" name="email"
                placeholder="Enter email" type="email" value=""/>
              </div>
              <div class="form-group">
                <label class="control-label" for="inputUsername">Username</label>
                <g:field class="form-control" id="inputUsername" name="username"
                placeholder="Enter Username" type="text" value=""/>
              </div>
              <div class="form-group">
                <label class="control-label" for="exampleInputPassword">Password</label>
                <g:field class="form-control" id="exampleInputPassword" name="password"
                placeholder="Password" type="password" value=""/>
              </div>
              <g:submitButton type="submit" class="btn btn-default" name="Sign up" />
            </g:form>
          </div>
        </div>
      </div>
    </div>
	</body>
</html>
