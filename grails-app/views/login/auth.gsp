<html>
<head>
	<meta name='layout' content='main_not_logged_in'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type='text/css' media='screen'>
                #login {
                        max-width: 330px;
                }
	</style>
</head>

<body>
<div class="container" id='login'>
<g:if test="${params.login_error == '1'}">
        <div class="alert alert-danger" style="max-width: 900px;">
          <a class="close" data-dismiss="alert">×</a>
          <strong>Error: </strong>Invalid username or password!
        </div>
</g:if>
<g:if test="${params.successful_sign_up}">
        <div class="alert alert-success" style="max-width: 900px;">
          <a class="close" data-dismiss="alert">×</a>
          <strong>Welcome</strong> ${params.realname} Try to login now!
        </div>
</g:if>
    <form action='${postUrl}' method='POST' id='loginForm' class="form-signin" autocomplete='off'>
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type='text' class='form-control' name='j_username' id='username' placeholder="Username" autofocus=""/>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type='password' class='form-control' name='j_password' id='password' placeholder="Password"/>
        <div class="checkbox" id="remember_me_holder">
                <label for='remember_me'>
                        <input type='checkbox' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                        <g:message code="springSecurity.login.remember.me.label"/>
                </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
</div>
</body>
</html>
