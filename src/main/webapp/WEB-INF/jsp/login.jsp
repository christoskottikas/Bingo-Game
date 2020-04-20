<%-- 
    Document   : login
    Created on : Apr 16, 2020, 1:08:40 PM
    Author     : Ro Mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bingo Login Page</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/3.0.0/css/ionicons.css" rel="stylesheet"/>
    
         <link rel="icon" href="img/icon.png" type="image/x-icon" />
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>


    <body data-spy="scroll" data-target="#navbar1" data-offset="60">

        <div class="loginpage" id="loginpage">
            <div class="container h-100" >

                <div class="row h-100">

                    <div class="col-6">

                        <div class="text-center m-0 vh-100 d-flex flex-column justify-content-center ">

                            <h1>Login</h1><br>
                            <div class="row">
                                <div class="col-lg-10 col-sm-10 mx-auto">
                                    <div>

                                        <div>

                                <form:form method="POST" action="/login" modelAttribute="user" id="formlogin">
                                                <div class="form-group" >
                                                    <form:label path="username">Username</form:label><br>
                                                    <form:input  type="text" class="form-control" path="username" placeholder="Enter Username" id="username"/> 
                                                    <form:errors class="error" path="username"/>
                                                </div>
                                                <div class="form-group">
                                                    <form:label path="password">Password</form:label><br>
                                                    <form:input id="password-field" type="password" class="form-control" path="password" placeholder="Password" /> 
                                                    <span style="color: #333" toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password">
                                                        <form:errors path="password"/>
                                                </div>
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="rememberMe" value="lsRememberMe">
                                                    <label class="form-check-label" for="rememberMe">Remember Me</label>
                                                </div>
                                                <br>
                                                <button type="submit" class="btn btn-outline-info1" onclick="lsRememberMe()">Login!</button>
                                            </form:form>


                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-6">
                        <div class="col-lg-10 col-sm-10 mx-auto">
                            <div class="text-center m-0 vh-100 d-flex flex-column justify-content-center ">
                                <img class="img-fluid" src="img/loginpic.png" alt="Login Picture" id="loginpic">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <footer id="footer" class="bg-dark text-light py-5">
            <div class="container py-5">
                <div class="row">
                    <div class="col-6 col-md-6 col-lg-3 mb-2">
                        <h6 class="text-uppercase">Tools</h6>
                        <ul class="nav flex-column">
                            <li><a class="text-white" target="ext" rel="nofollow" href="https://themestr.app" title="Bootstrap theme builder">Themestr.app</a></li>
                            <li><a class="text-white" target="ext" rel="nofollow" href="http://themes.guide" title="Bootstrap free and pro themes">Themes.guide</a></li>
                            <li><a class="text-white" target="ext" rel="nofollow" href="http://codeply.com" title="Prototype and edit code for Bootstrap and other responsive frameworks">Codeply</a></li>
                            <li><a class="text-white" target="ext" rel="nofollow" href="http://bootply.com">Bootply</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-6 col-lg-3 mb-2">
                        <h6 class="text-uppercase">More</h6>
                        <ul class="nav flex-column">
                            <li><a class="text-white" target="_new" href="http://wdstack.com" title="The top projects, tools and apps for Web developers">WDStack</a></li>
                            <li><a class="text-white" target="_new" href="http://theme.cards">Theme.cards</a></li>
                            <li><a class="text-white" target="_new" href="http://www.bootbundle.com">BootBundle</a></li>
                            <li><a class="text-white" target="_new" title="Learn about Bootstrap 4 using this free theme" href="http://bootstrap4.guide">Bootstrap4.guide</a></li>
                        </ul>
                    </div>
                    <div class="col-12 col-md-12 col-lg-6 mb-2 text-right">
                        <h6 class="text-uppercase">Follow</h6>
                        <ul class="nav float-right">
                            <li><a class="text-white mr-2" rel="nofollow" href="http://twitter.com/ThemesGuide" title="Follow on Twitter"><i class="h1 fa fa-fw fa-twitter fa-2x ion-logo-twitter"></i></a></li>
                            <li><a class="text-white mr-2" rel="nofollow" href="https://www.facebook.com/codeply" title="Follow on Facebook"><i class="h1 fa fa-fw fa-facebook fa-2x ion-logo-facebook"></i></a></li>
                            <li><a class="text-white mr" rel="nofollow" href="https://github.com/ThemesGuide/bootstrap-themes" title="Follow on GitHub"><i class="h1 fa fa-fw fa-facebook fa-2x ion-logo-github"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!--/row-->
            </div>
        </footer>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
       
        
         <script src="/js/login.js"></script>
    </body>
</html> 




