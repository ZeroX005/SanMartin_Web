<%-- 
    Document   : Agregar
    Created on : 14/06/2019, 08:11:05 PM
    Author     : Administrador
--%>


<%@page import="Conex.ConexionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Poppins|Righteous&display=swap" rel="stylesheet">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Ciudad</title>
    </head>
    <body>
        <div class="menu">
            <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                <div class="container">
                    <a class="navbar-brand col-9" href="../index.jsp" style="font-family: 'Righteous', cursive;">San Martin</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </nav>
        </div>
        <div class="container">
            <br>
            <h1>Agregar Ciudad</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width:500px;height:150px">
                Nombre Ciudad:
                <input type="text" name="txtNom" class="form-control"/>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary">
                <a href="Listar.jsp">Regresar</a>
            </form>
        </div>  
    </div>
</body>
</html>

<%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps;
            String nombre;
            nombre = request.getParameter("txtNom");
            if (nombre != null) {
                ps = con.prepareStatement("insert into ciudad (Nombre_Ciudad) values ('"+ nombre + "')");
                ps.executeUpdate();
                response.sendRedirect("Listar.jsp");
    }

%>