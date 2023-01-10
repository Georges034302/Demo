<%@page import="com.model.User"%>
<%@page import="com.model.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<% String filename = application.getRealPath("/WEB-INF/users.xml");%>       
<jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
    <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
</jsp:useBean>
<%    
    request.setAttribute("email", null);
    request.removeAttribute("email");
%>
<% Users users = userDAO.getUsers(); %>

<c:import url="/xsl/users.xsl" var="xslt"/>
<c:set var="xml">
    <users>
        <% for (User user : users.getUsers()) {%>
        <user>
            <ID><%= user.getID()%></ID>
            <name><%= user.getName()%></name>
            <email><%=user.getEmail()%></email>
            <DOB><%= user.getDOB()%></DOB>
        </user>
        <% }%>
    </users>
</c:set> 

<x:transform xml="${xml}" xslt="${xslt}"></x:transform>
