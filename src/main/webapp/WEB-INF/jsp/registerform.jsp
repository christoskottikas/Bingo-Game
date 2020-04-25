
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bingo Register Page</title>
        <link rel="icon" href="img/icon.png" type="image/x-icon" />
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/3.0.0/css/ionicons.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body data-spy="scroll" data-target="#navbar1" data-offset="60">

        <div class="loginpage" id="registerpage">
            <div class="container h-100" >

                <div class="row h-100">

                    <div class="col-6">

                        <div class="text-center m-0 vh-100 d-flex flex-column justify-content-center ">

                            <h1>Register</h1>
                            <div class="row">
                                <div class="col-lg-10 col-sm-10 mx-auto">




                                    <div>
                                        <form:form method="POST" action="/register" modelAttribute="RegisterDto" name="registration" class="text-center" id="formreg"> 
                                            <div class="form-group row">
                                                <form:label path="firstName">First Name</form:label> <br> 
                                                <form:input type="text" path="firstName" name="firstName" pattern="^[a-zA-Z]+$" class="form-control" placeholder="Enter your first name" />
                                                <form:errors path="firstName"/><br>
                                            </div>
                                            <div class="form-group row">
                                                <form:label path="lastName">Last Name</form:label><br>
                                                <form:input type="text" path="lastName" name="lastName" pattern="^[a-zA-Z]+$" class="form-control" placeholder="Enter your last name"/>
                                                <form:errors path="lastName"/><br>
                                            </div>

                                            <div class="form-group row">
                                                <form:label path="username">Username</form:label><br>
                                                <form:input type="text" path="username" name="username" class="form-control" placeholder="Type your Username" />  
                                                <form:errors class="error" path="username"/><br>
                                            </div>

                                            <div class="form-group row">
                                                <form:label path="password">Password</form:label><br>
                                                <form:input type="password" path="password" id="pass1" name="password" class="form-control" placeholder="Password"/>  
                                                <form:errors class="error" path="password"/><br>
                                            </div>

                                            <div class="form-group row">
                                                <form:label path="passwordConfirm">Retype Password</form:label><br>
                                                <form:input type="password" path="passwordConfirm" id="pass2"  name="passwordConfirm" class="form-control" placeholder="Retype Password"/> 
                                                <form:errors path="passwordConfirm"/><br>
                                            </div>

                                            <div class="form-group row">
                                                <form:label path="dateOfBirth">Date of birth</form:label><br>
                                                <form:input type="text" id="Date" path="dateOfBirth" name="dateOfBirth" class="form-control" placeholder="Select your Date of Birth"/>
                                                <form:errors path="dateOfBirth"/><br>
                                            </div>

                                            <div class="form-group row">
                                                <form:label path="email">Email</form:label><br>
                                                <form:input type="email" path="email" name="email" class="form-control" placeholder="Enter your email"/> 
                                                <form:errors class="error" path="email"/><br>
                                            </div>

                                            <input type="submit" class="btn btn-outline-info2" value="Register"/>
                                        </form:form>
                                    </div>



                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-6">
                        <div class="col-lg-10 col-sm-10 mx-auto">
                            <div class="text-center m-0 vh-100 d-flex flex-column justify-content-center ">
                                <img class="img-fluid" src="img/registerpic.png" alt="Registration Picture" id="regpic">
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


















        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>















        <script>


            $(document).ready(function () {
                $(function () {
                    $("#Date").datepicker({
                        maxDate: "-18y",
                        minDate: new Date(1930, 6, 31)
                    });
                });

                $(function () {

                    jQuery.validator.addMethod("lettersonly", function (value, element) {
                        return this.optional(element) || /^[a-z]+$/i.test(value);
                    });

                    $("form[name='registration']").validate({

                        rules: {
                            firstName: {
                                required: true,
                                lettersonly: true
                            },
                            lastName: {
                                required: true,
                                lettersonly: true
                            },
                            username: "required",
                            email: {
                                required: true,
                                email: true
                            },
                            password: {
                                required: true,
                                minlength: 5
                            },
                            passwordConfirm: {
                                required: true,
                                minlength: 5
                            },
                            dateOfBirth: "required"
                        },
                        messages: {
                            firstName: {
                                required: "Please enter a firstname",
                                lettersonly: "Letters only please"
                            },
                            lastName: {
                                required: "Please enter a lastname",
                                lettersonly: "Letters only please"
                            },
                            username: "Please enter your username",
                            password: {
                                required: "Please provide a password",
                                minlength: "Your password must be at least 5 characters long"
                            },
                            passwordConfirm: {
                                required: "Please provide a password",
                                minlength: "Your password must be at least 5 characters long"
                            },
                            email: "Please enter a valid email address",
                            dateOfBirth: "Please enter a valid date of birth"
                        },
                        submitHandler: function (form) {
                            form.submit();
                        }
                    });
                });
            });
        </script>
    </body>
</html>

