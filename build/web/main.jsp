<%-- 
    Document   : main
    Created on : Nov 23, 2022, 11:45:27 AM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>  
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <title>Blogs</title>
    </head>
    <body onload="startTime()" >
        <% 
            String text = request.getParameter("blog");
        %>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">
                    <a class="navbar-brand" href="#">Math World</a>                    
                    <a style="text-decoration: none; color: orange; font-size: 16px;" href="#">Link</a>               
                </div> 
                <div class="navbar-header navbar-left">                                        
                    <a style="text-decoration: none; color: orange; font-size: 16px;" href="index.jsp">Logout</a>               
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-1">
                    <table class="table table-bordered table-striped w-auto">
                        <thead class="table-dark"><tr><th colspan="2">My Blogs</th></tr></thead>
                        <tr><td>Blog 1</td><td><%= text %></td></tr>                        
                    </table>
                </div>
            </div>            
        </div>
        <div id="clock" class="footer"></div>
    </body>
</html>
