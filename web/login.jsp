<%-- 
    Document   : login
    Created on : Nov 22, 2022, 2:46:16 PM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/layout.css"/>
        <title>Login</title>
    </head>
    <body>
        <h1>Sign In</h1>
        <div>
            <form method="POST" action="loginAction.jsp">
                <table class="table">
                    <tr><td>Email: </td><td><input type="text" name="email" placeholder="Enter your email" /></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" placeholder="Enter your password" /></td></tr>
                    <tr>
                        <td> </td>
                        <td>
                            <a class="button" href="index.jsp">Cancel</a>
                            <input class="button" type="submit" value="Sign In" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
