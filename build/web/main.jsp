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
        <title>Blogs</title>
    </head>
    <body>
        <% 
            String text = request.getParameter("blog");
        %>
        <h1>Welcome USER-NAME TO-DO<span><a class="button" style="float: right" href="logout.jsp">Logout</a></span></h1>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <table class="table table-bordered table-striped w-auto">
                        <thead class="table-dark"><tr><th colspan="2">My Blogs</th></tr></thead>
                        <tr><td>Blog 1</td><td><%= text %></td></tr>                        
                    </table>
                </div>
            </div>            
        </div>
    </body>
</html>
