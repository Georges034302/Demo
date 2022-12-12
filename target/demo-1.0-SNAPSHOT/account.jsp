<%-- 
    Document   : account
    Created on : Nov 29, 2022, 11:15:21 AM
    Author     : George
--%>

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
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            String submitted = request.getParameter("submitted");

            if (submitted != null && submitted.equals("submitted")) {
                int ID = Integer.parseInt(request.getParameter("ID"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");                
                user = (User) session.getAttribute("user");
                user.update(ID, name, email, password, dob);
                
                Users users = userDAO.getUsers();
                
                userDAO.update(users, user);
                
                session.setAttribute("user", user);
            } else {
                String userViewEmail = request.getParameter("email");
                Users users = userDAO.getUsers();
                User userView = users.user(userViewEmail);
                if(userView != null){
                    user = userView;
                }else{
                    user = (User) session.getAttribute("user");
                }
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
                        <td><a class="button" href="main.jsp">Dashboard</a> </td>
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

