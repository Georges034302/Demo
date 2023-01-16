<%-- 
    Document   : welcome
    Created on : Nov 23, 2022, 11:35:43 AM
    Author     : George
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
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
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");

            User user = new User(name, email, password, dob);
            Users users = userDAO.getUsers();
            
            User userXML = users.user(user.getEmail());
            
            if(userXML != null){
                session.setAttribute("error", "User already exists");
                response.sendRedirect("register.jsp");
            }else{
                users.add(user);
                userDAO.save(users, filename);
                session.setAttribute("user", user);
            }              

        %>
        <h1>Welcome to Java Community Blog <span><a class="button" href="blog.jsp">Blog</a></span></h1>
        <table class="table">
            <caption>User Information</caption>
            <tr><td>Name </td><td> <%= name%></td></tr>
            <tr><td>Email </td><td> <%= email%></td></tr>
            <tr><td>Password </td><td> <%= password%></td></tr>
            <tr><td>D.O.B. </td><td> <%= dob%></td></tr>
        </table>
        <div id="clock" class="footer"></div>
    </body>
</html>
