<%-- 
    Document   : loginAction
    Created on : Nov 22, 2022, 2:50:51 PM
    Author     : George
--%>

<%@page import="com.model.User"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <title>Login Action</title>
    </head>
    <body onload="startTime()">
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Users users = userDAO.getUsers();

            User user = users.user(email, password);

            if (user != null) {
                session.setAttribute("user", user);
            }else{
                session.setAttribute("error", "User does not exist");
                response.sendRedirect("login.jsp");
            }

        %>
        <h1>Welcome to Java Community Blog <span><a class="button" href="index.jsp">Home</a>&ensp;<a class="button" href="blog.jsp">Blog</a></span></h1>
        <% if (user != null) {%>
        <table class="table">
            <caption>User Information</caption>
            <tr><td>Email: </td><td> <%= email%></td></tr>
            <tr><td>Password: </td><td> <%= password%></td></tr>
        </table>
        <%} else {%>
        <p>User does not exist</p>
        <%}%>
    </body>
    <div id="clock" class="footer"></div>
</html>
