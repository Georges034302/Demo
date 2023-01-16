<%-- 
    Document   : blog
    Created on : Nov 23, 2022, 11:13:05 AM
    Author     : George
--%>

<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <title>Blog Page</title>
    </head>
    <body onload="startTime()" >
        <% 
            User user = (User) session.getAttribute("user");
        %>
        <form action="main.jsp" method="POST">
            <table class="table">
                <caption>New Blog </caption>
                <tr><td>User:</td><td> <%= user.getID() %> </td></tr>
                <tr><td>Blog:</td><td><textarea name="blog" rows="6" cols="60"></textarea></td></tr>
                <tr><td></td>
                    <td>
                        <input class="button" type="submit" value="Blog" />
                        <a class="button" style="float: right" href="main.jsp">Dashboard</a>
                    </td>
                </tr>
            </table>
        </form>
        <div id="clock" class="footer"></div>
    </body>
</html>
