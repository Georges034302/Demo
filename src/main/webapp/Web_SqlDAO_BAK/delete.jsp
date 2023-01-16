<%-- 
    Document   : delete
    Created on : Dec 7, 2022, 10:57:56 AM
    Author     : George
--%>

<%@page import="com.model.dao.AdminSqlDAO"%>
<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
    </head>
    <body>
        <%!
            User user;
        %>
       
        <%
            UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");
                        
            String emailView = (String) session.getAttribute("emailView");
            if (emailView != null) {
                user = userSqlDAO.getUser(emailView);
            }else{
                user = (User) session.getAttribute("user");
            }

            if (user != null) {
                userSqlDAO.delete(user.getID());
        %>
                <h2><%= user.getName()%> record has been deleted!</h2>
            <%}%>
        <% session.invalidate();%>
        <p class="message">You have been logged out click <a href="index.jsp">here </a> to go back home</p>   
    </body>
</html>
