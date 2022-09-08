<%-- 
    Document   : Delete
    Created on : 14/06/2019, 08:29:25 PM
    Author     : Administrador
--%>


<%@page import="Conex.ConexionDB"%>
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
            CallableStatement cs;
            int ia = Integer.parseInt(request.getParameter("ia"));
            int ir = Integer.parseInt(request.getParameter("ir"));
            int ic = Integer.parseInt(request.getParameter("ic"));
            int id = Integer.parseInt(request.getParameter("id"));
            cs = con.prepareCall("{CALL SP_ELI_PERSONA_ASIENTO('" + ia + "')}");
            cs.executeUpdate();
            response.sendRedirect("FiltroListado.jsp?id=" + id + "&ir=" + ir + "&ic=" + ic);
        %>
    </body>
</html>