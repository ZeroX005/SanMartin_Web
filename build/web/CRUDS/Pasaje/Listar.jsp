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
        <title>Listar Pasajes</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps; 
            ResultSet rs; 
            ps = con.prepareStatement("select idPasaje,CONCAT('S/.',Precio) as Precio,Fecha_salida,Hora_Salida,co.Nombre_ciudad as Origen,cd.Nombre_ciudad as Destino from pasaje p inner join ciudad co on p.idCiudad_Origen=co.idCiudad inner join ciudad cd on p.idCiudad_Destino=cd.idCiudad order by idPasaje;");
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
            <br/>
            <h1>Listado de Pasajes</h1>
            <a href="../index.jsp">Menú Mantenimiento</a>
            <hr>
            <a class="btn btn-success btn-lg" href="Agregar.jsp">Nuevo Pasaje</a>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center" style="background: dodgerblue">ID</th>
                    <th class="text-center" style="background: dodgerblue">PRECIO</th>
                    <th class="text-center" style="background: dodgerblue">FECHA SALIDA</th>
                    <th class="text-center" style="background: dodgerblue">HORA SALIDA</th>
                    <th class="text-center" style="background: dodgerblue">ORIGEN</th>
                    <th class="text-center" style="background: dodgerblue">DESTINO</th>
                    <th class="text-center" style="background: dodgerblue">ACCIONES</th>
                </tr>

                <br>
                <br>
                <%                    while (rs.next()) {
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("idPasaje")%></td>
                    <td class="text-center"><%= rs.getString("Precio")%></td>
                    <td class="text-center"><%= rs.getDate("Fecha_salida")%></td>
                    <td class="text-center"><%= rs.getTime("Hora_salida")%></td>
                    <td class="text-center"><%= rs.getString("Origen")%></td>
                    <td class="text-center"><%= rs.getString("Destino")%></td>
                    <td class="text-center">
                        <a href="Editar.jsp?id=<%= rs.getInt("idPasaje")%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="Delete.jsp?id=<%= rs.getInt("idPasaje")%>" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <% }%>
            </table>
        </div>
        <br>
    </body>
</html>
