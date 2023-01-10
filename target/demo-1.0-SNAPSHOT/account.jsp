<%-- 
    Document   : account
    Created on : Nov 29, 2022, 11:15:21 AM
    Author     : George
--%>

<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
    </head>
    <body onload="startTime()">   
        <%!
            User user;
        %>
        
        <%
            UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");
            String submitted = request.getParameter("submitted");
            String emailView = request.getParameter("emailView");

            if (emailView != null) {
                user = userSqlDAO.getUser(emailView);
                session.setAttribute("emailView", emailView);
            } else {
                user = (User) session.getAttribute("user");
            }

            if (submitted != null && submitted.equals("submitted")) {
                int ID = Integer.parseInt(request.getParameter("ID"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                emailView = (String)session.getAttribute("emailView");
                if(emailView != null)
                    user = userSqlDAO.getUser(emailView);
                user.update(ID, name, email, password, dob);
                userSqlDAO.update(name, password, dob, ID);
                session.setAttribute("user", user);
            }
        %>
        <div style="margin: auto;">
            <form method="POST" action="account.jsp">
                <table class="table">
                    <caption>Edit User <span class="message"><%= (submitted != null) ? "Update is Successful" : ""%></span></caption>
                    <tr><td>ID: </td><td><input type="text" name="ID" value="<%= user.getID()%>" readonly="true" /></td></tr>
                    <tr><td>Name: </td><td><input type="text" name="name" value="<%= user.getName()%>" /></td></tr>
                    <tr><td>Email: </td><td><input type="text" name="email" value="<%= user.getEmail()%>" readonly="true"/></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" value="<%= user.getPassword()%>" /></td></tr>
                    <tr><td>DOB: </td><td><input type="date" name="dob" value="<%= user.getDOB()%>"/></td></tr>
                    <tr><input type="hidden" name="submitted" value="submitted"></tr>
                    <tr>
                        <td>
                            <% if (emailView != null) { %>
                            <a class="button" href="adminAction.jsp">Accounts</a> 
                            <%} else { %>
                            <a class="button" href="main.jsp">Dashboard</a>
                            <%}%>
                        </td>
                        <td>
                            <input class="button" type="submit" value="Update" /> 
                            <a class="button" href="delete.jsp">Delete</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>        
        <div id="clock" class="footer"></div>
    </body>
</html>

