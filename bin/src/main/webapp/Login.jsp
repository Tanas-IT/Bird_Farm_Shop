<%-- 
    Document   : Login
    Created on : Sep 14, 2023, 10:44:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title> 

        <link rel="stylesheet" href="css/Google.css">
        <link rel="stylesheet" href="css/Login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    </head>
    <body>
        <div class="container">
            <div class="wrapper">
                <div class="title"><span>Login</span></div>
                <form action="DispatchServlet" method="post">
                    <div class="row">
                        <i class="fas fa-user"></i>
                        <input name="txtUsername" type="text" placeholder="Username" required>
                    </div>
                    <div class="row">
                        <i class="fas fa-lock"></i>
                        <input name="txtPassword" type="password" placeholder="Password" required>
                    </div>
                    <div class="pass"><a href="#">Forgot password?</a></div>
                    <div class="row button">
                        <input type="submit" value="Login" name="btAction">
                    </div>
                    <div class="signup-link">Not a member? <a href="Register.html">Register</a></div>
                    <div class="conainer">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/HomePage/LoginGoogleHandler&response_type=code
                           &client_id=91807241555-9kgfge8t87k8lheot7cg5gs4u9avused.apps.googleusercontent.com&approval_prompt=force">
                            <div class="g-sign-in-button">
                                <div class="content-wrapper">
                                    <div class="logo-wrapper">
                                        <img src="https://developers.google.com/identity/images/g-logo.png">
                                    </div>
                                    <span class="text-container">
                                        <span>Sign in with Google</span>
                                    </span>
                                </div>
                            </div>
                        </a>
                    </div>

                </form>
            </div>
        </div>
    </body>
</html>
