<%-- 
    Document   : index
    Created on : Nov 22, 2022, 2:44:04 PM
    Author     : George
--%>

<%@page import="com.model.dao.AdminSqlDAO"%>
<%@page import="com.model.dao.BlogSqlDAO"%>
<%@page import="com.model.dao.SqlDBConnector"%>
<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
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
        <%
            if (session.isNew()) {                             
                String userID = "" + (new Random().nextInt(999));
                session.setAttribute("userid", userID);
                Integer count = new Integer(0);
                session.setAttribute("counter", count);
            }

        %>
        <h1 style="text-align: center">Java Community Blog</h1>
        <div class="center" >
            <a class="button" href="admin.jsp">Admin</a>  &emsp; 
            <a class="button" href="login.jsp">Login</a>  &emsp;             
            <a class="button" href="register.jsp">Register</a> &emsp;
            <a class="button" href="math.jsp">Math</a> &emsp;
            <a class="button" href="sessioninfo.jsp">Session Info</a>
        </div>
        <div id="clock" class="footer"></div>
        <% 
            UserSqlDAO userSqlDAO = new UserSqlDAO(new SqlDBConnector().connection());
            AdminSqlDAO adminSqlDAO = new AdminSqlDAO(new SqlDBConnector().connection());
            BlogSqlDAO blogSqlDAO = new BlogSqlDAO(new SqlDBConnector().connection());
            session.setAttribute("adminSqlDAO", adminSqlDAO);
            session.setAttribute("userSqlDAO", userSqlDAO);
            session.setAttribute("blogSqlDAO", blogSqlDAO);
        %>
    </body>
</html>
