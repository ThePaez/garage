<%-- 
    Document   : signin
    Created on : Jan 20, 2013, 10:47:21 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%@include file="includes.jsp" %>
        <script src="js/signin.js"></script>
        <link rel="stylesheet" type="text/css" href="css/signin.css">
    </head>
    <body>
        <%@include file="header.jsp" %>  
        <form accept-charset="UTF-8" id="dialog" action="/session" method="post">
            <div class="auth-form-header">
                <h1>Sign in</h1>
            </div>
            <div class="auth-form-body">
                <label for="login_field">
                    Username or Email
                </label>
                <input autocapitalize="off" autofocus="autofocus" class="input-block" id="login_field" name="login" tabindex="1" type="text" />

                <label for="password">
                    Password <a href="/sessions/forgot_password">(forgot password)</a>
                </label>
                <input autocomplete="disabled" class="input-block" id="password" name="password" tabindex="2" type="password" />

                <input class="button" name="commit" tabindex="3" type="submit" value="Sign in" />
            </div>
        </form>
    </body>
</html>
