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
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Listado Compras</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps; 
            ResultSet rs; 
            ps = con.prepareStatement("select idReserva,p.idPasaje,c.idCliente, FH_Reserva, c.Nombres, CONCAT(c.Ape_Paterno,' ',c.Ape_Materno) as Apellidos,co.Nombre_ciudad as Origen,"
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
        <div class="container-fluid" style="width: 90%">
            <br>
            <h1>Listado de Compras</h1> 
            <hr>
            <a href="../Pagina_principal.jsp" class="btn btn-warning">Menú Principal</a>
            <br>
            <table class="table-sm table-bordered" style="width: 100% !important">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">FECHA/HORA RESERVA</th>
                    <th class="text-center">NOMBRES</th>
                    <th class="text-center">APELLIDOS</th>
                    <th class="text-center">PASAJE</th>
                    <th class="text-center">ORIGEN</th>
                    <th class="text-center">DESTINO</th>
                    <th class="text-center">PRECIO TOTAL</th>
                    <th class="text-center">ACOMPAÑANTES</th>
                    <th class="text-center">CANTIDAD ASIENTOS</th>
                    <th class="text-center">ASIENTO CLIENTE</th>
                    <th class="text-center">BUS</th>
                    <th class="text-center">ACCIONES</th>
                </tr>

                <br>
                <br>
                <%                    while (rs.next()) {
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("idReserva")%></td>
                    <td class="text-center"><%= rs.getString("FH_Reserva")%></td>
                    <td class="text-center"><%= rs.getString("Nombres")%></td>
                    <td class="text-center"><%= rs.getString("Apellidos")%></td>
                    <td class="text-center"><%= rs.getInt("idPasaje")%></td>
                    <td class="text-center"><%= rs.getString("Origen")%></td>
                    <td class="text-center"><%= rs.getString("Destino")%></td>
                    <td class="text-center"><%= rs.getString("Precio_Total")%></td>
                    <td class="text-center"><a href="FiltroListado.jsp?id=<%= rs.getInt("idCliente")%>"><%= rs.getString("Acompañantes")%></a></td>
                    <td class="text-center"><%= rs.getString("Asientos")%></td>
                    <td class="text-center"><%= rs.getString("Nro_Asiento")%></td>
                    <td class="text-center"><%= rs.getString("Bus")%></td>
                    <td class="text-center">
                        <a href="AgregarAcompañantes.jsp?id=<%= rs.getInt("idPasaje")%>&ic=<%= rs.getInt("idCliente")%>" class="btn btn-success">Agregar Personas</a>
                    </td>
                </tr>
                <% }%>
            </table>
        </div>
        <br>
    </body>
</html>
