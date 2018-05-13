<%@ page import="java.util.ArrayList" %>
<%@ page import="teachmealex.BDController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="routes/header.jsp"%>

<body>
<%
    String completeURL = request.getRequestURL().toString() + "?" + request.getQueryString();
    BDController bdController = new BDController();
    String error = "";
    String display = "none";
    boolean check = true;
    if (bdController.getStatus() == 0){
        response.sendRedirect("login.jsp");
    }

    if (!completeURL.contains("null")){
        String palabra = request.getParameter("verbo");

        if (!bdController.existeVerbo(palabra)) {
            error = "No existe ese verbo en nuestro vocabulario";
            display = "block";
        }else {
            bdController.bajaVerbo(palabra);
            response.sendRedirect("carteraVerb.jsp");
        }
    }
%>
<div class="wrapper">
    <%@include file="routes/navbar.jsp"%>
        <!-- Page Content Holder -->
    <div style="width: 100%;"  id="content">
        <div class="imgresponsive"><img src="img/english/logo.png" id="logoresponsive"></div>
        <nav class="navbar navbar-default">
            <div class="container-fluid fixed-top">
                <div class="navbar-header">
                    <button type="button" id="sidebarCollapse" class="btn btn-dark navbar-btn">
                        <i class="glyphicon glyphicon-menu-hamburger"></i>
                        <span></span>
                    </button>
                    <span>
                        <nav aria-label="breadcrumb">
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
                            <li class="breadcrumb-item"><a href="carteraVoc.jsp">Vocabulario</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Alta</li>
                          </ol>
                        </nav>
                    </span>
                </div>
            </div>
        </nav>

        <h2>Eliminar verbo</h2>
        <div style="display: <%out.print(display);%>" class="alert alert-danger" role="alert" id="#errorForm">
            ¡<%out.print(error);%>!
        </div>
        <form>
            <div class="form-group row">
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="verbo" id="inputVerb" placeholder="Escriba el verbo" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-danger">Eliminar</button>
                </div>
            </div>
        </form>
        <div class="line"></div>
    </div>
</div>

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- Bootstrap Js CDN -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>
</body>
</html>