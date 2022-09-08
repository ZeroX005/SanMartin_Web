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
        <title>Agregar Asiento</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps1;
            PreparedStatement ps2;
            ResultSet rs;
            ps1 = con.prepareStatement("select * from bus");
            rs = ps1.executeQuery();
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
            <h1>Agregar Asiento</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width:500px;height:300px">
                Nombre Asiento:
                <input type="text" name="txtNom" maxlength="3" class="form-control"/>
                Estado:
                <select name="txtEst" class="form-control">
                <option value="Disponible">Disponible</option> 
                <option value="Ocupado">Ocupado</option>
                </select>
                Bus:
                <select name="txtBus" class="form-control">
                <% while(rs.next()) {%>
                <option value="<%= rs.getInt("idBus")%>"><%= rs.getString("Nom_Bus")%></option>
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
    Class.forName(Driver);
    con = DriverManager.getConnection(url, user, clave);

    PreparedStatement ps;
    String nombre,estado,bus;
    nombre = request.getParameter("txtNom");
    estado = request.getParameter("txtEst");
    bus = request.getParameter("txtBus");
    
    if (nombre != null && estado != null && bus != null) {
        ps = con.prepareStatement("insert into asiento (Nro_Asiento,estado,idBus) values ('" + nombre + "','" + estado + "','" + bus + "')");
        ps.executeUpdate();
        response.sendRedirect("Listar.jsp");
    }

%>