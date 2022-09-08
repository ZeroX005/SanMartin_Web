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
        <title>Listar Reservas</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps; 
            ResultSet rs;
            ps = con.prepareStatement("select idReserva,p.idPasaje,c.idCliente,CONCAT(p.Fecha_Salida,'-',p.Hora_Salida) as FH_Salida, c.Nombres, CONCAT(c.Ape_Paterno,' ',c.Ape_Materno) as Apellidos,co.Nombre_ciudad as Origen,"
                    + " cd.Nombre_ciudad as Destino ,CONCAT('S/.',(p.Precio * (COUNT(ac.idPersonas)+1))) as Precio_Total,COUNT(ac.idPersonas)as Acompañantes,1 + COUNT(ac.idPersonas) as Asientos ,a.Nro_Asiento,b.Nom_Bus as Bus"
                    + " from reserva r inner join cliente c "
                    + " on r.idCliente = c.idCliente inner join pasaje p"
                    + " on r.idPasaje = p.idPasaje inner join ciudad co"
                    + " on p.idCiudad_Origen = co.idCiudad inner join ciudad cd"
                    + " on p.idCiudad_Destino = cd.idCiudad inner join asiento a"
                    + " on a.idAsiento = c.idAsiento inner join bus b"
                    + " on a.idBus = b.idBus left join personas ac"
                    + " on ac.idCliente=c.idCliente"
                    + " group by r.idReserva,r.FH_Reserva,c.Nombres,c.Ape_Paterno,c.Ape_Materno,co.Nombre_ciudad,cd.Nombre_ciudad,p.Precio,b.Nom_Bus");
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
            <h1>Listado de Reservas</h1> 
            <hr>
            <!--<a class="btn btn-success btn-lg" href="Agregar.jsp">Nuevo Registro</a>-->
            <a href="../index.jsp">Menú Mantenimiento</a>
            <table class="table-sm table-bordered">
                <tr>
                    <th class="text-center" style="background: dodgerblue">ID</th>
                    <th class="text-center" style="background: dodgerblue">NOMBRES</th>
                    <th class="text-center" style="background: dodgerblue">APELLIDOS</th>
                    <th class="text-center" style="background: dodgerblue">ID PASAJE</th>
                    <th class="text-center" style="background: dodgerblue">ORIGEN</th>
                    <th class="text-center" style="background: dodgerblue">DESTINO</th>
                    <th class="text-center" style="background: dodgerblue">FECHA/HORA SALIDA</th>
                    <th class="text-center" style="background: dodgerblue">PRECIO TOTAL</th>
                    <th class="text-center" style="background: dodgerblue">ACOMPAÑANTES</th>
                    <th class="text-center" style="background: dodgerblue">CANTIDAD ASIENTOS</th>
                    <th class="text-center" style="background: dodgerblue">ASIENTO CLIENTE</th>
                    <th class="text-center" style="background: dodgerblue">BUS</th>
                    <th class="text-center" style="background: dodgerblue">ACCIONES</th>
                </tr>

                <br>
                <br>
                <%                    while (rs.next()) {
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("idReserva")%></td>
                    <td class="text-center"><%= rs.getString("Nombres")%></td>
                    <td class="text-center"><%= rs.getString("Apellidos")%></td>
                    <td class="text-center"><%= rs.getInt("idPasaje")%></td>
                    <td class="text-center"><%= rs.getString("Origen")%></td>
                    <td class="text-center"><%= rs.getString("Destino")%></td>
                    <td class="text-center"><%= rs.getString("FH_Salida")%></td>
                    <td class="text-center"><%= rs.getString("Precio_Total")%></td>
                    <td class="text-center"><a href="FiltroListado.jsp?id=<%= rs.getInt("idCliente")%>&ic=<%=rs.getInt("idPasaje")%>&ir=<%=rs.getInt("idReserva")%>" class="btn btn-success">Ver</a></td>
                    <td class="text-center"><%= rs.getString("Asientos")%></td>
                    <td class="text-center"><%= rs.getString("Nro_Asiento")%></td>
                    <td class="text-center"><%= rs.getString("Bus")%></td>
                    <td class="text-center">
                        <a href="Editar.jsp?id=<%= rs.getInt("idReserva")%>" class="btn btn-warning btn-sm" style="margin-bottom:10px;width:66px">Editar</a>
                        <a href="Delete.jsp?id=<%= rs.getInt("idReserva")%>" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <% }%>
            </table>
        </div>
        <br>
    </body>
</html>
