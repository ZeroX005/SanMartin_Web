<%-- 
    Document   : index
    Created on : 07/07/2019, 05:20:05 AM
    Author     : gian_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins|Righteous&display=swap" rel="stylesheet">
        <link href="../css/grilla.css?v=1.0" rel="stylesheet" type="text/css"/>
        <link href="../wow/animate.css" rel="stylesheet" type="text/css"/>
        <title>Menu Grillas</title>
    </head>
    <body>
        <div class="menu">
            <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                <div class="container">
                    <a class="navbar-brand col-9" href="index.jsp" style="font-family: 'Righteous', cursive;">San Martin</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </nav>
        </div>

        <section id="grilla">
            <div class="container" style="display:flex">
                    <div class="listado">
                <ul class="wow fadeInLeft">
                    <a style="text-decoration: none" href="Cliente/Listar.jsp"><li style="background-color: #CD3A3A">Mantenimiento Cliente</li></a>
                    <a style="text-decoration: none" href="Acompañantes/Listar.jsp"><li style="background-color: #ECF144">Mantenimiento Acompañantes</li></a>
                    <a style="text-decoration: none" href="Pasaje/Listar.jsp"><li style="background-color: #2CD91F">Mantenimiento Pasaje</li></a>
                    <a style="text-decoration: none" href="Reserva/Listar.jsp"><li style="background-color: #21E0D2">Mantenimiento Reserva</li></a>
                    <a style="text-decoration: none" href="Bus/Listar.jsp"><li style="background-color: #295ED8">Mantenimiento Bus</li></a>
                    <a style="text-decoration: none" href="Ciudad/Listar.jsp"><li style="background-color: #C231D6">Mantenimiento Ciudad</li></a>
                    <a style="text-decoration: none" href="Asientos/Listar.jsp"><li style="background-color: #E0911F">Mantenimiento Asientos</li></a>
                </ul>
                        </div>
                    <div id="imagen">
                <img class="wow fadeIn" style="width: 750px;margin-top: 50px"  src="../Imagenes/crud.png">
                </div>
                </div>
        </section>


        <!------------------SCRIP------------>
        <script src="../wow/wow.min.js" type="text/javascript"></script>
        <script>
            new WOW().init();
        </script>
    </body>
</html>
