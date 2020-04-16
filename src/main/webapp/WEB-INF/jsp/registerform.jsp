<%-- 
    Document   : registerform
    Created on : Apr 15, 2020, 7:46:33 PM
    Author     : Ro Mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
        <title>JSP Page</title>
        <style>
            .error{
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Register form : </h1>
        <div>
            <form:form method="POST" action="/register" modelAttribute="UserDto" name="registration" >
                <form:label path="firstName">First Name</form:label> <br> 
                <form:input type="text" path="firstName" name="firstName"/>
                <form:errors path="firstName"/><br><br>
                <form:label path="lastName">Last Name</form:label><br>
                <form:input  type="text" path="lastName" name="lastName" />
                <form:errors path="lastName"/><br><br>
                <form:label path="username">Username</form:label><br>
                <form:input  type="text" path="username" name="username"/>  <span class = "error"><b>${wrongUsername}</b></span>
                <form:errors path="username"/><br><br>
                <form:label path="password">Password</form:label><br>
                <form:input type="password" path="password" id="pass1" name="password" />  <span class = "error"><b>${wrongPassword}</b></span>
                <form:errors path="password"/><br><br>
                <form:label path="passwordConfirm">Retype Password</form:label><br>
                <form:input type="password" path="passwordConfirm" id="pass2"  name="passwordConfirm" /> 
                <form:errors path="passwordConfirm"/><br><br>
                <form:label path="dateOfBirth">Date of birth</form:label><br>
                <form:input  type="text" id="Date" path="dateOfBirth" name="dateOfBirth" />
                <form:errors path="dateOfBirth"/><br><br>
                <form:label path="email">Email</form:label><br>
                <form:input  type="email" path="email" name="email"/>
                <form:errors path="email"/><br><br>

            <input type="submit" value="Register"/>
            </form:form>
        </div>
        
         <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
        <script>
            

$(document).ready(function() {
$(function() {
$("#Date").datepicker();
});

$(function() {
  
  $("form[name='registration']").validate({
    
    rules: {
      firstName: "required",
      lastName: "required",
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
      dateOfBirth : "required"
    },
    messages: {
      firstName: "Please enter your firstname",
      lastName: "Please enter your lastname",
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
    submitHandler: function(form) {
      form.submit();
    }
  });
});
});
    </script>
    </body>
</html>

