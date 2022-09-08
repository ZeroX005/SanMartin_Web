<%-- 
    Document   : Delete
    Created on : 14/06/2019, 08:29:25 PM
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
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps,ps1;
            ResultSet rs;
            int idPa =Integer.parseInt(request.getParameter("idPasa"));
            int idAs =Integer.parseInt( request.getParameter("idAs"));
            ps1 = con.prepareStatement("select idCliente from cliente where idAsiento="+idAs);
            rs=ps1.executeQuery();
            while(rs.next()){
            int idCli = rs.getInt("idCliente");
            ps = con.prepareStatement("insert into reserva (FH_Reserva,idCliente,idPasaje) values (NOW(),'" +idCli+"','"+idPa+"')");
            ps.executeUpdate();
            response.sendRedirect("DetalleCompra.jsp");
            }
        %>
    </body>
</html>