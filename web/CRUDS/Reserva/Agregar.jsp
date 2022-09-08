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
        <link href="../../css/StyleImg.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Reserva</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps1, ps2;
            ResultSet rs1, rs2;
            ps1 = con.prepareStatement("select * from cliente");
            ps2 = con.prepareStatement("select * from pasaje");
            rs1 = ps1.executeQuery();
            rs2 = ps2.executeQuery();
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
            <h1>Agregar Reserva</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width:500px;height:250px">
                Cliente:
                <select  name="txtCl" required class="form-control">
                    <% while (rs1.next()) {%>
                    <option value="<%=rs1.getInt("idCliente")%>"><%=rs1.getString("Nombres")%></option>
                    <%}%>
                </select>
                Pasaje:
                <select  name="txtPa" required class="form-control">
                    <% while (rs2.next()) {%>
                    <option value="<%=rs2.getInt("idPasaje")%>"><%=rs2.getString("idPasaje")%></option>
                    <%}%>
                </select>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary">
                <a href="Listar.jsp">Regresar</a>
            </form>
        </div>
    </div>
</body>
</html>

<%
    PreparedStatement ps;
    String cliente, pasaje;
    cliente = request.getParameter("txtCl");
    pasaje = request.getParameter("txtPa");
    if (cliente != null && pasaje != null) {
        ps = con.prepareStatement("insert into reserva (FH_Reserva,idCliente,idPasaje) values (NOW(),'"+cliente+"','"+pasaje+"')");
        ps.executeUpdate();
        response.sendRedirect("Listar.jsp");
    }

%>