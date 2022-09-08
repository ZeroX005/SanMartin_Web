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
        <title>Listar Acompañantes</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps; 
            ResultSet rs; 
            ps = con.prepareStatement("select idPersonas,pa.idPasaje,a.idAsiento as Cod_Asiento,Nombres,CONCAT(Ape_Paterno,' ',Ape_Materno) as Apellidos,Fecha_Nacimiento,DNI,CONCAT(co.Nombre_Ciudad,'-',cd.Nombre_Ciudad) as Ruta,a.Nro_Asiento as Asiento from personas p inner join asiento a on p.idAsiento=a.idAsiento inner join pasaje pa on pa.idPasaje=p.idPasaje inner join ciudad co on co.idCiudad=pa.idCiudad_Origen inner join ciudad cd on cd.idCiudad=pa.idCiudad_Destino order by idPersonas");
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
            <h1>Listado de Acompañantes</h1> 
            <a href="../index.jsp">Menú Mantenimiento</a>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center" style="background: dodgerblue">ID</th>
                    <th class="text-center" style="background: dodgerblue">NOMBRES</th>
                    <th class="text-center" style="background: dodgerblue">APELLIDOS</th>
                    <th class="text-center" style="background: dodgerblue">FECHA NACIMIENTO</th>
                    <th class="text-center" style="background: dodgerblue">DNI</th>
                    <th class="text-center" style="background: dodgerblue">PASAJE</th>
                    <th class="text-center" style="background: dodgerblue">RUTA</th>
                    <th class="text-center" style="background: dodgerblue">ASIENTO</th>
                    <th class="text-center" style="background: dodgerblue">ACCIONES</th>
                </tr>

                <br>
                <br>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("idPersonas")%></td>
                    <td class="text-center"><%= rs.getString("Nombres")%></td>
                    <td class="text-center"><%= rs.getString("Apellidos")%></td>
                    <td class="text-center"><%= rs.getDate("Fecha_Nacimiento")%></td>
                    <td class="text-center"><%= rs.getString("DNI")%></td>
                    <td class="text-center"><%= rs.getInt("idPasaje")%></td>
                    <td class="text-center"><%= rs.getString("Ruta")%></td>
                    <td class="text-center"><%= rs.getString("Asiento")%></td>
                    <td class="text-center">
                        <a href="Editar.jsp?id=<%= rs.getInt("idPersonas")%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="Delete.jsp?id=<%= rs.getInt("Cod_Asiento")%>" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <% }%>
            </table>
        </div>
            <br>
    </body>
</html>
