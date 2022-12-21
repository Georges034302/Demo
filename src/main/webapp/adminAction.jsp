<%-- 
    Document   : adminAction
    Created on : Dec 14, 2022, 1:50:21 PM
    Author     : George
--%>

<%@page import="com.model.Admin"%>
<%@page import="com.model.Admins"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>  
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <style>
            .target:not(#div1) {
                display: none;
            }
        </style>
        <script>
            var divs = ["div1", "div2", "div3", "div4"];
            var visibleDivId = null;
            function toggleVisibility(divId) {
                if (visibleDivId === divId) {
                    //visibleDivId = null;
                } else {
                    visibleDivId = divId;
                }
                hideNonVisibleDivs();
            }
            function hideNonVisibleDivs() {
                var i, divId, div;
                for (i = 0; i < divs.length; i++) {
                    divId = divs[i];
                    div = document.getElementById(divId);
                    if (visibleDivId === divId) {
                        div.style.display = "block";
                    } else {
                        div.style.display = "none";
                    }
                }
            }
        </script>
        <title>Admin Action Page</title>
    </head>
    <body onload="startTime()">
        <% String filename = application.getRealPath("/WEB-INF/admin.xml");%>
        <jsp:useBean id="adminDAO" class="com.model.dao.AdminDAO" scope="application">
            <jsp:setProperty name="adminDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            Admin admin = null;
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Admins admins = adminDAO.getAdmins();

            if(email != null)
                admin = admins.admin(email, password);
            else
                admin = (Admin) session.getAttribute("admin");

            if (admin == null) {
                session.setAttribute("error", "Admin does not exist");
                response.sendRedirect("admin.jsp");
            } else {
                session.setAttribute("admin", admin);
            }

        %>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">
                    <a class="navbar-brand" href="#">Admin: <%= admin.getName()%> </a>                    
                    <a onclick="toggleVisibility('div1')" style ="text-decoration: none; color: orange; font-size: 16px;" href="#1">View-1</a>&emsp;   
                    <a onclick="toggleVisibility('div2')" style="text-decoration: none; color: orange; font-size: 16px;" href="#2">View-2</a>&emsp;
                    <a onclick="toggleVisibility('div3')" style="text-decoration: none; color: orange; font-size: 16px;" href="#3">View-3</a>&emsp;
                    <a onclick="toggleVisibility('div4')" style="text-decoration: none; color: orange; font-size: 16px;" href="#4">View-4</a>&emsp;
                    <a onclick="toggleVisibility('div5')" style="text-decoration: none; color: orange; font-size: 16px;" href="#5">View-5</a>
                </div> 
                <div class="navbar-header navbar-left">                                        
                    <a style="text-decoration: none; color: orange; font-size: 16px;" href="logout.jsp">Logout</a>               
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div id="div1" class="col-xl-6">
                    <jsp:include page="admin1.jsp" flush="true"/>
                </div>    
                <div id="div2" style="display: none;" class="col-xl-6">
                    <jsp:include page="admin2.jsp" flush="true"/>
                </div> 
                <div id="div3" style="display: none;" class="col-xl-6">
                    <jsp:include page="admin3.jsp" flush="true"/>
                </div> 
                <div id="div4" style="display: none;" class="col-xl-6">
                    <jsp:include page="admin4.jsp" flush="true"/>
                </div>                 
            </div>
        </div>
        <div id="clock" class="footer"></div>  
    </body>
</html>
