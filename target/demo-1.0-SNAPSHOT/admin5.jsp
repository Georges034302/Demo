<%@page import="com.rest.client.UserServiceClient"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="com.model.dao.XmlTransformer"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin View - User Service Client</title>
    </head>
    <body>
        <%            
            request.setAttribute("email", null);
            request.removeAttribute("email");
        %>    
        <br/>
        <div class="label">Admin View 5</div>
        <% 
            String xslPath = application.getRealPath("/xsl/users.xsl");
            XmlTransformer transformer = new XmlTransformer();
            transformer.transform(xslPath, UserServiceClient.fetchUsers(), new StreamResult(out));
        %>

    </body>
</html>
