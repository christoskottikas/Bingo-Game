<%-- 
    Document   : updateForm
    Created on : Feb 25, 2020, 12:42:24 AM
    Author     : Ro Mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Update form</title>
        <style>
            .error{
                color: red;
            }
        </style>
    </head>
    <body style = "background-color: #cccccc">
        <h3>Update User</h3>
        <form:form method="POST" action="/updateUser/${user.id}" modelAttribute="user" name="registration">

            <form:label path="firstname">First Name</form:label>  
            <form:input path="firstname"  placeholder = "${user.firstname}" />
            <form:errors class="error" path="firstname"/><br><br>
            <form:label path="lastname">Last Name</form:label>
            <form:input path="lastname"  placeholder = "${user.lastname}" />
            <form:errors class="error" path="lastname"/><br><br>
            <form:label path="username">Username</form:label>
            <form:input path="username"  id="userName"  placeholder = "${user.username}" />
            <form:errors class="error" path="username"/><br><br>
            <form:label path="email">Email</form:label>
            <form:input path="email"  placeholder = "${user.email}" />
            <form:errors class="error" path="email"/><br><br>
            <form:label path="balance">Balance</form:label>
            <form:input path="balance"  placeholder = "${user.balance}" />
            <form:errors class="error" path="balance"/><br><br>
            <form:label path="dateofbirth">Date of birth</form:label>
            <form:input type="text" id="Date" path="dateofbirth" />
            <form:errors class="error" path="dateofbirth"/>
            <form:input type="hidden" path="password" value = "${user.password}" /><br><br><br>



            <input type="submit" value="Submit" />
        </form:form>



        <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>

        <script>

            var userNameField = document.getElementById("userName");


            $(document).ready(function () {
                $(function () {
                    $("#Date").datepicker({
                        maxDate: "-18y",
                        minDate: new Date(1930, 6, 31)
                    });
                });

                $(function () {

                    $("form[name='registration']").validate({

                        rules: {
                            firstname: "required",
                            lastname: "required",
                            username: "required",
                            email: {
                                required: true,
                                email: true
                            },
                            dateofbirth: "required",
                            balance: "required"
                        },
                        messages: {
                            firstname: "Please enter firstname",
                            lastname: "Please enter lastname",
                            username: "Please enter username",
                            email: "Please enter a valid email address",
                            dateofbirth: "Please enter a valid date of birth",
                            balance: "Please enter a valid balance amount"
                        },
                        submitHandler: function (form) {
                            form.submit();
                        }
                    });
                });

                if (userNameField.value.toLowerCase() === "admin") {
                                       
                    userNameField.readOnly = true;
                    userNameField.style.cursor = "no-drop";
                }
            });
        </script>
    </body>
</html>
