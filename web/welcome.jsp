<%-- 
    Document   : welcome
    Created on : Nov 23, 2022, 11:35:43 AM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/layout.css"/>
        <title>Welcome</title>
    </head>
    <body>
        <% 
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
        %>
        <h1>Welcome to Java Community Blog <span><a class="button" href="index.jsp">Home</a>&ensp;<a class="button" href="blog.jsp">Blog</a></span></h1>
        <table class="table">
            <caption>User Information</caption>
            <tr><td>Name: </td><td> <%= name %></td></tr>
            <tr><td>Email: </td><td> <%= email %></td></tr>
            <tr><td>Password: </td><td> <%= password %></td></tr>
            <tr><td>D.O.B.: </td><td> <%= dob %></td></tr>
        </table>
    </body>
</html>
