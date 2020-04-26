
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
        integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bingo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="bg-secondary">
           
        
        
          <div class="container py-5 my-5">

            <div class="row">

                
                <div class ="col-3 "></div>
                     
                <div class="col-6 bg-dark jumbotron my-5">
                    
        
                    <a href="getAllUsers"><h1 class="text-center text-light">Manage Users</h1></a>

 

            <div class="form-group mt-5">
                <form action="/logoutAdmin" method="POST">
                    <input type="submit" class="btn btn-danger form-control" value="Logout" />
                </form>
            </div>
        
       
        <div class="form-group mt-5"> 
            <form action="/adminLogin" method="POST">
                    <input type="submit" class="btn btn-success form-control" value="Start playing" />
                </form>
        </div>
                </div>
                        <div class ="col-3"></div>

            </div>
          </div>
        
        
        
             <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    </body>
    
    
</html>

