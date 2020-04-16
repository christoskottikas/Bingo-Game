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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .error{
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <div>
        <form:form method="POST" action="/login" modelAttribute="user" >
            <form:label path="username">Username</form:label> <br>
            <form:input  type="text" path="username"/> <span class="error">${message}</span> <br> 
            <form:errors path="username"/><br><br>
            <form:label path="password">Password</form:label><br>
            <form:input type="password" path="password" /> 
            <form:errors path="password"/><br><br>
            
            <input type="submit" value="Login" />
        </form:form>
        </div>
    </body>
</html>
