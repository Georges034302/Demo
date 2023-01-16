<%@page import="com.model.Blog"%>
<%@page import="com.model.dao.BlogSqlDAO"%>
<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="com.model.User"%>
<%@page import="com.model.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%
    request.setAttribute("email", null);
    request.removeAttribute("email");
%>
<%
    UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");
    BlogSqlDAO blogSqlDAO = (BlogSqlDAO) session.getAttribute("blogSqlDAO");
    Users users = new Users();
    users.addAll(userSqlDAO.getUsers());
%>

<c:import url="/xsl/users.xsl" var="xslt"/>
<c:set var="xml">
    <users>
        <% for (User user : users.getUsers()) {%>
        <user>
            <ID><%= user.getID()%></ID>
            <name><%= user.getName()%></name>
            <email><%=user.getEmail()%></email>
            <DOB><%= user.getDOB()%></DOB>
            <blogs>
                <% for (Blog blog : blogSqlDAO.getBlogs(user.getID())) {%>
                <blog>
                    <number><%= blog.getNumber() %></number>
                    <text><%= blog.getText() %></text>
                </blog> 
                <%}%>
            </blogs>
        </user>
        <% }%>
    </users>
</c:set> 

<x:transform xml="${xml}" xslt="${xslt}"></x:transform>
