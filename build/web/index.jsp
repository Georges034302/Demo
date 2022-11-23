<%-- 
    Document   : index
    Created on : Nov 22, 2022, 2:44:04 PM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
    </head>
    <body onload="startTime()" >
        <h1 style="text-align: center">Java Community Blog</h1>
        <div class="center" >
            <a class="button" href="login.jsp">Login</a>  &emsp;             
            <a class="button" href="register.jsp">Register</a> &emsp;
            <a class="button" href="math.jsp">Math</a>
        </div>
        <div id="clock" class="footer"></div>
    </body>
</html>
