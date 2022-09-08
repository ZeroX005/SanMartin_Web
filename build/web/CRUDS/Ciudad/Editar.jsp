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
        <title>Editar Ciudad</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps;
            ResultSet rs;
            int id = Integer.parseInt(request.getParameter("id"));
            ps = con.prepareStatement("select * from ciudad where idCiudad=" + id);
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
            <h1>Actualizar Ciudad</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width:500px;height:310px">
                Id:
                <input type="text" name="txtId" readonly class="form-control" value="<%= rs.getInt("idCiudad")%>"/>
                Nombre Bus:
                <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("Nombre_Ciudad")%>"/>
                <br>
                <input type="submit" value="Modificar" class="btn btn-primary btn-lg">
                <a href="Listar.jsp">Regresar</a>
            </form>
            <% } %>
    </body>
</html>
<%
    String idef, nombre;
    idef = request.getParameter("txtId");
    nombre = request.getParameter("txtNom");
    if (idef != null && nombre != null) {
        ps = con.prepareStatement("update ciudad set idCiudad='" + idef + "',Nombre_Ciudad='" + nombre + "' where idCiudad=" + idef);
        ps.executeUpdate();
        response.sendRedirect("Listar.jsp");
    }
%>
