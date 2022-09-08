<%-- 
    Document   : Editar
    Created on : 14/06/2019, 08:41:28 PM
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
        <link href="../../css/StyleImg.css" rel="stylesheet" type="text/css"/>
        <title>Editar Reserva</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps, ps1, ps2;
            ResultSet rs, rs1, rs2;
            int id = Integer.parseInt(request.getParameter("id"));
            ps = con.prepareStatement("select * from reserva where idReserva=" + id);
            ps1 = con.prepareStatement("select * from cliente");
            ps2 = con.prepareStatement("select idPasaje,CONCAT(co.Nombre_ciudad,'-',cd.Nombre_ciudad) AS Ruta from pasaje p inner join ciudad co on p.idCiudad_Origen=co.idCiudad inner join ciudad cd on p.idCiudad_Destino=cd.idCiudad order by idPasaje");
            rs1 = ps1.executeQuery();
            rs2 = ps2.executeQuery();
            rs = ps.executeQuery();
            while (rs.next()) {
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
            <h1>Actualizar Reserva</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width:500px;height:350px">
                Id:
                <input type="text" name="txtId" readonly class="form-control" value="<%= rs.getInt("idReserva")%>"/>
                Cliente:
                <select  name="txtCl" required class="form-control">
                    <% while (rs1.next()) {%>
                    <option value="<%=rs1.getInt("idCliente")%>"><%=rs1.getString("Nombres")%></option>
                    <%}%>
                </select>
                Pasaje(O-D):
                <select  name="txtPa" required class="form-control">
                    <% while (rs2.next()) {%>
                    <option value="<%=rs2.getInt("idPasaje")%>"><%=rs2.getString("Ruta")%></option>
                    <%}%>
                </select>
                <br>
                <input type="submit" value="Modificar" class="btn btn-primary btn-lg">
                <a href="Listar.jsp">Regresar</a>
            </form>
            <% } %>
    </body>
</html>
<%
    String idef, cliente, pasaje;
    idef = request.getParameter("txtId");
    cliente = request.getParameter("txtCl");
    pasaje = request.getParameter("txtPa");
    if (cliente != null && pasaje != null) {
        ps = con.prepareStatement("update reserva set idReserva='" + idef + "',idCliente='" + cliente + "',idPasaje='" + pasaje + "' where idReserva=" + idef);
        ps.executeUpdate();
        response.sendRedirect("Listar.jsp");
    }
%>
