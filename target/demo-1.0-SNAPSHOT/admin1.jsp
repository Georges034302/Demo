<%-- 
    Document   : admin1
    Created on : Dec 13, 2022, 9:48:12 AM
    Author     : George
--%>

<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="com.model.dao.AdminSqlDAO"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="com.model.dao.XmlTransformer"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin View</title>
    </head>
    <body>        
        <%            
            request.setAttribute("email", null);
            request.removeAttribute("email");
        %>
        
        <% String xslPath = application.getRealPath("/xsl/users.xsl");%>
        
        <% 
             UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO"); 
        %>

        <%
            Users users = new Users();
            users.addAll(userSqlDAO.getUsers());
            XmlTransformer transformer = new XmlTransformer();
            transformer.transform(xslPath, users, new StreamResult(out));
        %>
    </body>
</html>
