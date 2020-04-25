<%-- 
    Document   : allUsers
    Created on : Apr 21, 2020, 9:08:29 PM
    Author     : Ro Mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
    integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users Table</title>

        <style>
            th{
                cursor: pointer;
            }
        </style>
     <div>Its good to have you back ${u.username}  wallet : ${u.balance} </div>
    </head>
    <body onload="hideAdminDeleteUrl()">
        <h3>All users</h3>
        <table border="1" id="myTable">
         <tr>
             <th id="ID" onclick="sortByInteger(playerId,idsColumn)">ID</th>
             <th id="First name" onclick="sortByString(firstName,firstNameColumn)">First name</th>
             <th id="Last name" onclick="sortByString(lastName,lastNameColumn)">Last name</th>
             <th id="Username" onclick="sortByString(userName,userNameColumn)">Username</th>
             <th id="Date of birth" onclick="sortByString(dateOfBirth,dateOfBirthColumn)">Date of birth</th>
             <th id="Email" onclick="sortByString(playerEmail,playerEmailColumn)">Email</th>
             <th id="Balance" onclick="sortByInteger(balance,balanceColumn)">Balance</th>
             <th id="Games Played" onclick="sortByInteger(totalGames,gamesColumn)">Games Played</th>
             <th id="Games Won" onclick="sortByInteger(totalWins,winsColumn)">Games Won</th>
             <th id="Role" onclick="sortByString(role,roleColumn)">Role</th>
             <th style="cursor: default" colspan="2">Action</th>
         </tr>
                    <c:forEach items="${allusers}" var="player">
                        <c:if test="${player.username == u.username}">
                        <tr style="background-color: #ccccff"id="${player.username}">
                            <td>${player.id}</td>
                            <td>${player.firstname}</td>
                            <td>${player.lastname}</td>
                            <td>${player.username}</td>
                            <td>${player.dateofbirth}</td>
                            <td>${player.email}</td>
                            <td>${player.balance}</td>
                            <td>${player.stats.games}</td>
                            <td>${player.stats.wins}</td>
                            <td>${player.roleID.roleName}</td>
                            <td><a href="preupdate/${player.id}">Update</td>
                            <td><a href="delete/${player.id}">Delete</a></td>
                        </tr>
                        </c:if>
                        <c:if test="${player.username != u.username}">
                        <tr id="${player.username}">
                            <td>${player.id}</td>
                            <td>${player.firstname}</td>
                            <td>${player.lastname}</td>
                            <td>${player.username}</td>
                            <td>${player.dateofbirth}</td>
                            <td>${player.email}</td>
                            <td>${player.balance}</td>
                            <td>${player.stats.games}</td>
                            <td>${player.stats.wins}</td>
                            <td>${player.roleID.roleName}</td>
                            <td><a href="preupdate/${player.id}">Update</td>
                            <td><a href="delete/${player.id}">Delete</a></td>
                        </tr>
                        </c:if>
                    </c:forEach>

                    <div><form action="/logoutAdmin" method="POST">
                            <input type="submit" class="btn btn-danger" value="Logout" />
                        </form></div>


                   <form action="/adminLogin" method="POST">
                            <input type="submit" class="btn btn-success" value="Start playing" />
                        </form>
   
                        <div > <span id="playersSum" style="float: left"></span>
                        <span style="margin-left: 29%;"><b>Ascending : </b><h3 style="display: inline"><i class="far fa-caret-square-up" style="background-color: #99ccff"></i></h3></span>&nbsp;&nbsp;
                        <span><b>Descending : </b><h3 style="display: inline"><i class="far fa-caret-square-down" style="background-color: #ffccff"></i></h3></span>
                        </div>
                       
                        <script src="js/allUsers.js"></script>                     
                    </body>
                    </html>
