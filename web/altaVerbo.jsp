<%@ page import="teachmealex.BDController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="routes/header.jsp"%>

<body>
<%
    String completeURL = request.getRequestURL().toString() + "?" + request.getQueryString();
    BDController bdController = new BDController();
    if (bdController.getStatus() == 0){
        response.sendRedirect("login.jsp");
    }
    String error = "";
    String display = "none";
    boolean check = true;
    if (!completeURL.contains("null")){
        String type = request.getParameter("type");
        String esp = request.getParameter("esp");
        String present = request.getParameter("present");
        String past = request.getParameter("past");
        String pparticipie = request.getParameter("pparticipie");


        if (!bdController.existePalabraEspanol(esp)) {
            error = "No existe ese verbo en español";
            display = "block";
            check = false;
        } else if (!bdController.existePDiccionario("ding", present)) {
            error = "No existe el present en ingles";
            display = "block";
            check = false;
        } else if (!bdController.existePDiccionario("ding", past)){
            error = "No existe el past en ingles";
            display = "block";
            check = false;
        }else if (!bdController.existePDiccionario("ding", pparticipie)) {
            error = "No existe el past participie en ingles";
            display = "block";
            check = false;
        }

        if (check) {
            bdController.insertarVerbo(esp,present,past,pparticipie,bdController.codUser(bdController.nameUser()), type);
        }
    }
%>
<div class="wrapper">
    <%@include file="routes/navbar.jsp"%>
        <!-- Page Content Holder -->
    <div id="content">
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
                            <li class="breadcrumb-item"><a href="carteraVerb.jsp">Verbos</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Alta</li>
                          </ol>
                        </nav>
                    </span>
                </div>
            </div>
        </nav>

        <h2>Alta de verbo</h2>
        <p>Vamos a introducir verbos en nuestra cartera de verbos. Para ello, especifica el significado en español, y los tiempos present, past and past participie. Para finalizar selecciona el tipo de verbo.</p>
        <div style="display: <%out.print(display);%>" class="alert alert-danger" role="alert" id="#errorForm">
            ¡<%out.print(error);%>!
        </div>
        <form action="altaVerbo.jsp">
            <div class="form-group row">
                <label for="inputEsp" class="col-sm-2 col-form-label">Español</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="esp" id="inputEsp" placeholder="Escriba el verbo en español" autofocus>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPresent" class="col-sm-2 col-form-label">Present</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="present" id="inputPresent" placeholder="Escriba el verbo en present">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPast" class="col-sm-2 col-form-label">Past</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="past" id="inputPast" placeholder="Escriba el verbo en past">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPParticipie" class="col-sm-2 col-form-label">Past participie</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="pparticipie" id="inputPParticipie" placeholder="Escriba el verbo en past participie">
                </div>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="type" id="exampleRadios1" value="regular" checked>
                <label class="form-check-label" for="exampleRadios1">
                    Regular
                </label>
                <input class="form-check-input" type="radio" name="type" id="exampleRadios2" value="irregular">
                <label class="form-check-label" for="exampleRadios2">
                    Irregular
                </label>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-danger">Alta verbo</button>
                </div>
            </div>
        </form>
        <div class="line"></div>
    </div>
</div>


<script type="text/javascript">

</script>

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