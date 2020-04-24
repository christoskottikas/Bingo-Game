
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
    </head>
    <body>
           
        <a href="getAllUsers">All users list</a>

 

            <div><form action="/logoutAdmin" method="POST">
                    <input type="submit" class="btn btn-danger" value="Logout" />
                </form></div>
        
        <div><form action="/adminLogin" method="POST">
                    <input type="submit" class="btn btn-success" value="Start playing" />
                </form></div>
        
    </body>
</html>
