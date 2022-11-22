<%-- 
    Document   : math.jsp
    Created on : Nov 22, 2022, 3:24:02 PM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mathematics</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%! 
            int cube(int i){
                return (int)Math.pow(i, 3);
            }        
        %>
        <h1>My Math Page</h1>
        <div class="container-fluid">
            <div class="row"> 
                <div class="col-xl-2">
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark"><th>I</th><th>Random Value</th><th>Cube(i)</th></thead>
                        <% for (int i = 0; i < 10; i++) {%>
                            <tr>
                                <td><%= i %></td>
                                <td><%= new Random().nextInt(20)%></td>
                                <td><%= cube(i) %></td>
                            </tr>        
                        <% }%>
                </table>
                </div>                
            </div>
        </div>
        <div>
            <a class="btn btn-primary" href="index.jsp">Home</a>
        </div>
    </body>
</html>
