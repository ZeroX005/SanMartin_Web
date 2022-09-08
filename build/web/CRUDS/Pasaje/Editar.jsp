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
        <title>Editar Registro</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps,ps1,ps2;
            ResultSet rs,rs1,rs2;
            int id = Integer.parseInt(request.getParameter("id"));
            ps = con.prepareStatement("select * from pasaje where idPasaje=" + id);
            ps1 = con.prepareStatement("select * from ciudad");
            ps2 = con.prepareStatement("select * from ciudad");
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
            <h1>Actualizar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width:500px;height:450px">
                Id:
                <input type="text" name="txtId" readonly class="form-control" value="<%= rs.getInt("idPasaje")%>"/>
                Precio:
                <input type="text" name="txtPre" required class="form-control" value="<%= rs.getString("Precio")%>"/>
                Fecha Salida:
                <input type="date" name="txtFs" required class="form-control" value="<%= rs.getDate("Fecha_Salida")%>"/>
                Hora Salida:
                <input type="time" name="txtHs" required class="form-control" value="<%= rs.getTime("Hora_Salida")%>"/>
                Origen:
                <select  name="txtOr" required class="form-control">
                    <% while (rs1.next()) {%>
                    <option value="<%=rs1.getInt("idCiudad")%>"><%=rs1.getString("Nombre_Ciudad")%></option>
                    <%}%>
                </select>
                Destino:
                <select  name="txtDe" minlength="8" maxlength="8" required class="form-control">
                    <% while (rs2.next()) {%>
                    <option value="<%=rs2.getInt("idCiudad")%>"><%=rs2.getString("Nombre_Ciudad")%></option>
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
    String idef, precio, fsalida, hsalida, origen, destino;
    idef = request.getParameter("txtId");
    precio = request.getParameter("txtPre");
    fsalida = request.getParameter("txtFs");
    hsalida = request.getParameter("txtHs");
    origen = request.getParameter("txtOr");
    destino = request.getParameter("txtDe");
     if (idef != null && precio != null && fsalida != null && hsalida != null && origen != null && destino != null) {
        ps = con.prepareStatement("update pasaje set idPasaje='" + idef + "',Precio='" + precio + "',Fecha_Salida='" + fsalida + "',Hora_Salida='" + hsalida + "',idCiudad_Origen='" + origen + "',idCiudad_Destino='" + destino + "' where idPasaje=" + idef);
        ps.executeUpdate();
        response.sendRedirect("Listar.jsp");
    }
%>
