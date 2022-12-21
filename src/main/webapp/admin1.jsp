<%-- 
    Document   : admin1
    Created on : Dec 13, 2022, 9:48:12 AM
    Author     : George
--%>

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
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <% String xslPath = application.getRealPath("/xsl/users.xsl");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>

        <%
            Users users = userDAO.getUsers();
            XmlTransformer transformer = new XmlTransformer();
            transformer.transform(xslPath, users, new StreamResult(out));
        %>

    </body>
</html>
