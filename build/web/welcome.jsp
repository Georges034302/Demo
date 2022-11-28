<%-- 
    Document   : welcome
    Created on : Nov 23, 2022, 11:35:43 AM
    Author     : George
--%>

<%@page import="com.demo.model.Users"%>
<%@page import="com.demo.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/layout.css"/>
         <script type="text/javascript" src="js/index.js"></script>
        <title>Welcome</title>
    </head>
    <body onload="startTime()">
        <% 
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            
            String emailRegEx = "([a-zA-Z]+)[._-]([a-zA-Z]+)@example.com";
            String passRegEx = "[A-Z][a-z]{5,15}\\d{1,3}";
            if(!email.matches(emailRegEx)){               
                session.setAttribute("emailError", "Incorrect email format");
                response.sendRedirect("register.jsp");                
            }else if(!password.matches(passRegEx)){
                session.setAttribute("passError", "Incorrect password format");
                response.sendRedirect("register.jsp");                       
            }else{
                User user = new User(name, email, password, dob);
                Users users = new Users();
                users.add(user);

                session.setAttribute("user", user);
                session.setAttribute("users", users);
            }
        %>
        <h1>Welcome to Java Community Blog <span><a class="button" href="index.jsp">Home</a>&ensp;<a class="button" href="blog.jsp">Blog</a></span></h1>
        <table class="table">
            <caption>User Information</caption>
            <tr><td>Name: </td><td> <%= name %></td></tr>
            <tr><td>Email: </td><td> <%= email %></td></tr>
            <tr><td>Password: </td><td> <%= password %></td></tr>
            <tr><td>D.O.B.: </td><td> <%= dob %></td></tr>
        </table>
        <div id="clock" class="footer"></div>
    </body>
</html>
