<%-- 
    Document   : index
    Created on : 14/06/2019, 07:14:13 PM
    Author     : Administrador
--%>
<%@page import="Conex.ConexionDB"%>
<%@page import="java.sql.ResultSet"%>
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
        <title>Listar Asientos</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps; 
            ResultSet rs; 
            ps = con.prepareStatement("select idAsiento,Nro_Asiento as Asiento,estado as Estado, b.Nom_bus as Bus from asiento a inner join bus b on a.idBus=b.idBus ;");
            rs = ps.executeQuery();
        %>
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
            <h1>Listado de Asientos</h1> 
            <a href="../index.jsp">Menú Mantenimiento</a>
            <hr>
            <a class="btn btn-success btn-lg" href="Agregar.jsp">Nuevo Asiento</a>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center" style="background: dodgerblue">ID</th>
                    <th class="text-center" style="background: dodgerblue">ASIENTO</th>
                    <th class="text-center" style="background: dodgerblue">ESTADO</th>
                    <th class="text-center" style="background: dodgerblue">BUS</th>
                    <th class="text-center" style="background: dodgerblue">ACCIONES</th>
                </tr>

                <br>
                <br>
                <%                    while (rs.next()) {
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("idAsiento")%></td>
                    <td class="text-center"><%= rs.getString("Asiento")%></td>
                    <td class="text-center"><%= rs.getString("Estado")%></td>
                    <td class="text-center"><%= rs.getString("Bus")%></td>

                    <td class="text-center">
                        <a href="Editar.jsp?id=<%= rs.getInt("idAsiento")%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="Delete.jsp?id=<%= rs.getInt("idAsiento")%>" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <% }%>
            </table>
        </div>
        <br>
    </body>
</html>
