<%@ page import="teachmealex.BDController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>English We Can</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicons -->
    <link href="img/favicon.png" rel="icon">
    <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700" rel="stylesheet">

    <!-- Bootstrap CSS File -->
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">

    <!-- Main Stylesheet File -->
    <link href="css/style.css" rel="stylesheet">

</head>

<body id="body">
<%
    String completeURL = request.getRequestURL().toString() + "?" + request.getQueryString();
    BDController bdController = new BDController();
    String user = "";
    String display = "none";
    String password = "";
    int codUser;
    String display2 = "none";
    bdController.status0();

    if (!completeURL.contains("null")){
        user = request.getParameter("uname");
        password = request.getParameter("psw");
        if (completeURL.contains("login-submit")) {
            if (bdController.existeUsuario(user, password)) {
                int cod = bdController.codUser(user);
                bdController.status(cod, user);
                response.sendRedirect("index.jsp");
            } else if (!bdController.existeUsuario(user, password)) {
                display2 = "block";
                display = "block";
            }
        }
    }
    if (!completeURL.contains("null")){
        if (completeURL.contains("register-submit")) {
            user = request.getParameter("uname");
            password = request.getParameter("psw");
            codUser = bdController.ultimoCodUser() + 1;
            display="block";
            display2="none";
            bdController.status(codUser, user);
            bdController.altaUsuario(user, password, codUser);
            response.sendRedirect("index.jsp");
        }
    }
%>
<!--==========================
  Intro Section
============================-->
<section id="intro">

    <div class="intro-content">
        <img src="img/english/logo.png">
        <div>
            <a onclick="document.getElementById('id02').style.display='block'" class="btn-get-started scrollto">Entrar</a>
            <div id="id01" class="modalJI" style="display: none;text-align: center">
                <form class="modalJI-content animate" action="login.jsp" style="text-align: center">
                    <div class="imgcontainer">
                        <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                        <img width="600" src="img/english/logo.png" alt="Avatar" class="avatar">
                    </div>

                    <div class="container" style="text-align: center">
                        <input type="text" placeholder="Escriba su usuario" name="uname" required autofocus><br>
                        <input type="password" placeholder="Escriba su contraseña" name="psw" required><br>
                    </div>
                    <input type="submit" name="register-submit" id="register-submit" tabindex="3" class="form-control btn btn-login" value="Registar">
                </form>
            </div>
            <a onclick="document.getElementById('id01').style.display='block'" class="btn-projects scrollto">Registrar</a>
            <div id="id02" class="modalJI" style="display: <%out.print(display);%>;text-align: center">

                <form class="modalJI-content animate" action="login.jsp">
                    <div class="imgcontainer">
                        <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
                        <img width="600" src="img/english/logo.png" alt="Avatar" class="avatar">
                    </div>
                    <div class="container">
                        <div id="loginError" style="display: <%out.print(display2); %>;" class="alert alert-danger" role="alert">
                            Datos incorrectos
                        </div>
                        <input type="text" placeholder="Escriba su usuario" name="uname" required autofocus><br>
                        <input type="password" placeholder="Escriba su contraseña" name="psw" required><br>
                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Recordar usuario
                        </label>
                    </div>
                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Entrar">
                </form>
            </div>
        </div>
    </div>

    <div id="intro-carousel" class="owl-carousel" >
        <div class="item" style="background-image: url('img/intro-carousel/1.jpg');"></div>
        <div class="item" style="background-image: url('img/intro-carousel/2.jpg');"></div>
        <div class="item" style="background-image: url('img/intro-carousel/3.jpg');"></div>
        <div class="item" style="background-image: url('img/intro-carousel/4.jpg');"></div>
        <div class="item" style="background-image: url('img/intro-carousel/5.jpg');"></div>
    </div>

</section><!-- #intro -->

<main id="main">

    <!--==========================
      About Section
    ============================-->
    <section id="about" class="wow fadeInUp">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 about-img">
                    <img id="logoCabecera" src="img/english/logo2.png" alt="">
                </div>

                <div class="col-lg-6 content">
                    <h2>Lorem ipsum dolor sit amet, consectetur adipiscing</h2>
                    <h3>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</h3>

                    <ul>
                        <li><i class="ion-android-checkmark-circle"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                        <li><i class="ion-android-checkmark-circle"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                        <li><i class="ion-android-checkmark-circle"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</li>
                    </ul>

                </div>
            </div>

        </div>
    </section><!-- #about -->

    <!--==========================
      Services Section
    ============================-->
    <section id="services">
        <div class="container">
            <div class="section-header">
                <h2>Services</h2>
                <p>Sed tamen tempor magna labore dolore dolor sint tempor duis magna elit veniam aliqua esse amet veniam enim export quid quid veniam aliqua eram noster malis nulla duis fugiat culpa esse aute nulla ipsum velit export irure minim illum fore</p>
            </div>

            <div class="row">

                <div class="col-lg-6">
                    <div class="box wow fadeInLeft">
                        <div class="icon"><i class="fa fa-bar-chart"></i></div>
                        <h4 class="title"><a href="">Lorem Ipsum</a></h4>
                        <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident etiro rabeta lingo.</p>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="box wow fadeInRight">
                        <div class="icon"><i class="fa fa-picture-o"></i></div>
                        <h4 class="title"><a href="">Dolor Sitema</a></h4>
                        <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata nodera clas.</p>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="box wow fadeInLeft" data-wow-delay="0.2s">
                        <div class="icon"><i class="fa fa-shopping-bag"></i></div>
                        <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
                        <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur trinige zareta lobur trade.</p>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="box wow fadeInRight" data-wow-delay="0.2s">
                        <div class="icon"><i class="fa fa-map"></i></div>
                        <h4 class="title"><a href="">Magni Dolores</a></h4>
                        <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum rideta zanox satirente madera</p>
                    </div>
                </div>

            </div>

        </div>
    </section><!-- #services -->

    <!--==========================
      Call To Action Section
    ============================-->
    <section id="call-to-action" class="wow fadeInUp">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 text-center text-lg-left">
                    <h3 class="cta-title">Call To Action</h3>
                    <p class="cta-text"> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
                <div class="col-lg-3 cta-btn-container text-center">
                    <a class="cta-btn align-middle" href="#">Call To Action</a>
                </div>
            </div>

        </div>
    </section><!-- #call-to-action -->

    <!--==========================
      Contact Section
    ============================-->
    <section id="contact" class="wow fadeInUp">
        <div class="container">
            <div class="section-header">
                <h2>Contact Us</h2>
                <p>Sed tamen tempor magna labore dolore dolor sint tempor duis magna elit veniam aliqua esse amet veniam enim export quid quid veniam aliqua eram noster malis nulla duis fugiat culpa esse aute nulla ipsum velit export irure minim illum fore</p>
            </div>

            <div class="row contact-info">

                <div class="col-md-4">
                    <div class="contact-address">
                        <i class="ion-ios-location-outline"></i>
                        <h3>Address</h3>
                        <address>A108 Adam Street, NY 535022, USA</address>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="contact-phone">
                        <i class="ion-ios-telephone-outline"></i>
                        <h3>Phone Number</h3>
                        <p><a href="tel:+155895548855">+1 5589 55488 55</a></p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="contact-email">
                        <i class="ion-ios-email-outline"></i>
                        <h3>Email</h3>
                        <p><a href="mailto:info@example.com">info@example.com</a></p>
                    </div>
                </div>

            </div>
        </div>
    </section><!-- #contact -->

</main>

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
<script>
    var modal = document.getElementById('id01');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
<!-- JavaScript Libraries -->
<script src="lib/jquery/jquery.min.js"></script>
<script src="lib/jquery/jquery-migrate.min.js"></script>
<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/superfish/hoverIntent.js"></script>
<script src="lib/superfish/superfish.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/magnific-popup/magnific-popup.min.js"></script>
<script src="lib/sticky/sticky.js"></script>

<!-- Template Main Javascript File -->
<script src="js/main.js"></script>

</body>
</html>
