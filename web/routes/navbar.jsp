<!-- Sidebar Holder -->
<nav id="sidebar">
    <div class="sidebar-header">
        <img width="250" src="img/english/logo.png">
    </div>
    <div id="userButton"><span class="glyphicon glyphicon-user"></span> <%out.print(bdController.nameUser());%>
    <a href="login.jsp"><button type="button" id="logOutButton" class="btn btn-default btn-sm">
        <span class="glyphicon glyphicon-log-out"></span> Salir
    </button></a></div>
    <ul class="list-unstyled components clear">
        <li class="active">
            <a href="index.jsp" >
                <i class="glyphicon glyphicon-home"></i>
                Inicio
            </a>
        </li>
        <li>
            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-th-list"></i>
                Mi Cartera
            </a>
            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li><a href="carteraVoc.jsp">Vocabulario</a></li>
                <li><a href="carteraVerb.jsp">Verbos</a></li>
                <li><a href="#">Phrasal verbs</a></li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class="glyphicon glyphicon-flag"></i>
                Ejercicios
            </a>
        </li>
        <li>
            <a href="#repasarSubmenu" data-toggle="collapse" aria-expanded="false">
                <i class="glyphicon glyphicon-education"></i>
                Repasar
            </a>
            <ul class="collapse list-unstyled" id="repasarSubmenu">
                <li><a href="#">Vocabulario</a></li>
                <li><a href="#">Verbos</a></li>
                <li><a href="#">Phrasal Verbs</a></li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class="glyphicon glyphicon-flag"></i>
                Listados
            </a>
        </li>
    </ul>

</nav>