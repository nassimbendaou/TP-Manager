<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="connection.css">

</head>
<body>
<div class="login-container">
	<form action="Login" method="get" class="form-login">
		<ul class="login-nav">
			<li class="login-nav__item active">
				<a href="#">Sign In</a>
			</li>
		</ul>
		<label for="login-input-user" class="login__label">
			email
		</label>
		<input id="login-input-user" class="login__input" type="email" name="email" />
		<label for="login-input-password" class="login__label">
			Password
		</label>
		<input id="login-input-password" class="login__input" type="password" name="password" />
		<input id="login-input-password" class="login__input" type="hidden" name="represent" value="prof" />
		<label for="login-sign-up" class="login__label--checkbox">
			<input id="login-sign-up" type="checkbox" class="login__input--checkbox" />
			Keep me Signed in
		</label>
		<button class="login__submit" type="submit">Sign in</button>
	</form>
	<a href="#" class="login__forgot">Forgot Password?</a>
</div>

</body>
</html>