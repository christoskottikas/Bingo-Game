<%-- 
    Document   : allUsers
    Created on : Apr 21, 2020, 9:08:29 PM
    Author     : Ro Mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users Table</title>
    </head>
    <body>
        <h3>All users</h3>
        <table border="1">
            <tr><td>ID</td><td>First name</td><td>Last name</td><td>Username</td><td>Date of birth</td><td>Email</td><td>Balance</td><td>Games Played</td><td>Games Won</td><td>Action</td></tr>
            <c:forEach items="${allusers}" var="u">
                <tr>
                    <td> ${u.id}</td>
                    <td> ${u.firstname}</td>
                    <td> ${u.lastname}</td>
                    <td> ${u.username}</td>
                    <td> ${u.dateofbirth}</td>
                    <td> ${u.email}</td>
                    <td> ${u.balance}</td>
                    <td> ${u.stats.games}</td>
                    <td> ${u.stats.wins}</td>
                    <td><div><a href="preupdate/${u.id}">Update</a></div><div><a href="delete/${u.id}">Delete</a></div></td>
                </tr>
            </c:forEach>
                
                            <div><form action="/logoutAdmin" method="POST">
                    <input type="submit" class="btn btn-danger" value="Logout" />
                </form></div>
    </body>
</html>
