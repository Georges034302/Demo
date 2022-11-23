<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Mathematics</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                <div class="navbar-header navbar-left">
                    <a class="navbar-brand" href="#">Math World</a>                    
                    <a class="btn btn-info" style="text-decoration: none; color: white; font-size: 16px;" href="index.jsp">Home</a>               
                </div>
                
                <form class="navbar-form navbar-left" action="math.jsp">
                    <div class="input-group">
                        <input id="N" type="text" name="N" class="form-control" placeholder="N" onsubmit="focus()">                        
                    </div>
                </form>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-2">
                    <jsp:include page="square.jsp" flush="true"/>
                </div>
                <div class="col-xl-2">
                    <jsp:include page="factorial.jsp" flush="true"/>
                </div>
                <div class="col-xl-2">
                    <jsp:include page="collatz.jsp" flush="true"/>
                </div>
            </div>
        </div>
    </body>
</html>