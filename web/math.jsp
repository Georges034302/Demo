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
        <script>
             $('form input').on('change', function () {
                $(this).closest('form').submit();
            });
            $(function () {
                $('#N').focus();
            });
        </script>
    </head>
    <body>            
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header">
                    <h2 style="color:white;"> Math World</h2>
                </div>
                <form class="navbar-form navbar-right" action="math.jsp">
                    <div class="form-group">
                        <label style="color:white; font-size:18px;">N = </label>
                        <input id="N" type="text" name="N" class="form-control" onsubmit="focus()">
                        <a class="btn btn-info" style="color:white;font-size:16px;text-decoration: none;" href="index.jsp">Home</a>
                    </div>
                </form>
            </div>
        </nav>
        
        <div class="container-fluid">
            <div class="row">               
                <div class="col-xl-2">
                    <jsp:include page="square.jsp" flush="true" />
                </div>  
                <div class="col-xl-2">
                    <jsp:include page="factorial.jsp" flush="true" />
                </div>
                <div class="col-xl-2">
                    <jsp:include page="collatz.jsp" flush="true"/>
                </div>
            </div>
        </div>
    </body>
</html>
