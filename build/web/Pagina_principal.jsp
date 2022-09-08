<%-- 
    Document   : Pagina_principal
    Created on : 26/06/2019, 03:44:15 AM
    Author     : gian_
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css?v=8.0" rel="stylesheet" type="text/css"/>
        <link href="wow/animate.css" rel="stylesheet" type="text/css"/>
        <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Poppins|Righteous&display=swap" rel="stylesheet">

    </head>
    <body>
        <div class="menu">
            <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                <div class="container">
                    <a class="navbar-brand col-10" href="Pagina_principal.jsp" style="font-family: 'Righteous', cursive;">San Martin</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="collapsibleNavbar">
                        <ul class="navbar-nav col-4">
                            <li class="nav-item">
                                <a class="nav-link" href="#about">Conócenos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="PROCESO DE PASAJE/DetalleReserva.jsp">Reservas</a>
                            </li>
                        </ul>
                    </div> 
                </div>
            </nav>
        </div>

        <div class="contenedor-reserva">
            <div class="reserva-hijo">
            <a style="text-decoration: none;color:black" href="PROCESO DE PASAJE/ListarPasajes.jsp" class="btn-mio">Buscar Pasajes</a>
            </div>
        </div>


        <section id="about">
            <div class="container">
                <h3>Conócenos</h3>
                <div class="contenido">
                    <div class="about-img wow rotateInDownLeft"><img src="Imagenes/fondo.jpg"></div>
                    <div class="about-text wow fadeInRightBig">
                        <p> Con 40 años de servicio. La empresa de transporte San Martín
                            de Porres S.A. Es una empresa huachana puesto
                            al servicio de nuestra provincia.
                            Cubre las rutas Huacho - Lima - Huacho. Demostrando confianza
                            y seguridad en viaje, del cual cuenta con el respaldo de sus miles de usuarios.</p>
                    </div>
                </div>
            </div>

        </section>

        <footer>
            <section id="socialmedia">
                <div class="container">
                    <div class="redes">
                        <a href="https://www.facebook.com/SanMartindePorressaOFICIAL/"><img src="Imagenes/facebook.png" alt=""></a>
                        <a href="#"><img src="Imagenes/linkedin.png" alt=""></a>
                        <a href="#"><img src="Imagenes/medium.png" alt=""></a>
                        <div class="parrafo"></div>
                        <p>© 2020 San Martin de Porres | Empresa de Transporte. Todos los derechos reservados</p>
                    </div>
                </div>
            </section>

        </footer>





        <!---------------------------SCRIPTS----------------->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>

        <script>
            var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
            $('#startDate').datepicker({
                uiLibrary: 'bootstrap4',
                iconsLibrary: 'fontawesome',
                minDate: today,
                maxDate: function () {
                    return $('#endDate').val();
                }
            });
        </script>

        <script src="wow/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>
    </body>
</html>