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
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins|Righteous&display=swap" rel="stylesheet">
        <link href="../css/StyleImg.css" rel="stylesheet" type="text/css"/>
        <title>Editar Registro Acompañante</title>
    </head>
    <body>
        <%
            ConexionDB conexion = new ConexionDB();
            Connection con;
            con = conexion.obtenerConexión();
            PreparedStatement ps, ps1, ps2, ps3, ps4, ps5, ps6, ps7, ps8, ps9, ps10, ps11, ps12, ps13, ps14, ps15, ps16, ps17, ps18, ps19, ps20, ps21, ps22, ps23, ps24, ps25, ps26, ps27, ps28, ps29, ps30, ps31, ps32;
            ResultSet rs, rs1, rs2, rs3, rs4, rs5, rs6, rs7, rs8, rs9, rs10, rs11, rs12, rs13, rs14, rs15, rs16, rs17, rs18, rs19, rs20, rs21, rs22, rs23, rs24, rs25, rs26, rs27, rs28, rs29, rs30, rs31, rs32;
            int ip = Integer.parseInt(request.getParameter("ip"));
            int ir = Integer.parseInt(request.getParameter("ir"));
            int ic = Integer.parseInt(request.getParameter("ic"));
            int id = Integer.parseInt(request.getParameter("id"));
            ps = con.prepareStatement("select CONCAT(co.Nombre_Ciudad,'-',cd.Nombre_Ciudad) as Ruta,p.idPersonas,a.idAsiento,a.estado,p.Nombres,p.Ape_Paterno,p.Ape_Materno,p.Fecha_Nacimiento,p.DNI,p.idPasaje,p.idAsiento,p.idCliente from personas p inner join pasaje pa on p.idPasaje=pa.idPasaje inner join ciudad co on pa.idCiudad_Origen=co.idCiudad inner join ciudad cd on pa.idCiudad_Destino=cd.idCiudad inner join asiento a on p.idAsiento=a.idAsiento where idPersonas=" + ip);
            rs = ps.executeQuery();
            ps1 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=1");
            ps2 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=2");
            ps3 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=3");
            ps4 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=4");
            ps5 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=5");
            ps6 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=6");
            ps7 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=7");
            ps8 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=8");
            ps9 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=9");
            ps10 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=10");
            ps11 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=11");
            ps12 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=12");
            ps13 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=13");
            ps14 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=14");
            ps15 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=15");
            ps16 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=16");
            ps17 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=17");
            ps18 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=18");
            ps19 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=19");
            ps20 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=20");
            ps21 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=21");
            ps22 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=22");
            ps23 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=23");
            ps24 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=24");
            ps25 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=25");
            ps26 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=26");
            ps27 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=27");
            ps28 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=28");
            ps29 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=29");
            ps30 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=30");
            ps31 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=31");
            ps32 = con.prepareStatement("select idAsiento,estado from asiento where idAsiento=32");
            rs1 = ps1.executeQuery();
            rs2 = ps2.executeQuery();
            rs3 = ps3.executeQuery();
            rs4 = ps4.executeQuery();
            rs5 = ps5.executeQuery();
            rs6 = ps6.executeQuery();
            rs7 = ps7.executeQuery();
            rs8 = ps8.executeQuery();
            rs9 = ps9.executeQuery();
            rs10 = ps10.executeQuery();
            rs11 = ps11.executeQuery();
            rs12 = ps12.executeQuery();
            rs13 = ps13.executeQuery();
            rs14 = ps14.executeQuery();
            rs15 = ps15.executeQuery();
            rs16 = ps16.executeQuery();
            rs17 = ps17.executeQuery();
            rs18 = ps18.executeQuery();
            rs19 = ps19.executeQuery();
            rs20 = ps20.executeQuery();
            rs21 = ps21.executeQuery();
            rs22 = ps22.executeQuery();
            rs23 = ps23.executeQuery();
            rs24 = ps24.executeQuery();
            rs25 = ps25.executeQuery();
            rs26 = ps26.executeQuery();
            rs27 = ps27.executeQuery();
            rs28 = ps28.executeQuery();
            rs29 = ps29.executeQuery();
            rs30 = ps30.executeQuery();
            rs31 = ps31.executeQuery();
            rs32 = ps32.executeQuery();
            while (rs.next()) {
        %>
        <div class="menu">
            <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                <div class="container">
                    <a class="navbar-brand col-9" href="../Pagina_principal.jsp" style="font-family: 'Righteous', cursive;">San Martin</a>
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
            <div class="costado">
                <form action="" method="post" class="form-control" style="width:500px;height:780px">
                    Reserva:
                    <input type="text" name="txtRes" readonly required class="form-control"  value="<%=ir%>"/>
                    ID Pasaje:
                    <input type="text" name="txtPasa" readonly required class="form-control" value="<%= rs.getString("idPasaje")%>"/>
                    Ruta:
                    <input type="text" name="txtRut" readonly required class="form-control"  value="<%=rs.getString("Ruta")%>"/>
                    ID Persona:
                    <input type="text" name="txtId" readonly class="form-control" value="<%= rs.getInt("idPersonas")%>"/>
                    Nombres:
                    <input type="text" name="txtNom" required class="form-control" value="<%= rs.getString("Nombres")%>"/>
                    Apellido Paterno:
                    <input type="text" name="txtAp" required class="form-control" value="<%= rs.getString("Ape_Paterno")%>"/>
                    Apellido Materno:
                    <input type="text" name="txtAm" required class="form-control" value="<%= rs.getString("Ape_Materno")%>"/>
                    Fecha Nacimiento:
                    <input type="date" name="txtFn" required class="form-control" value="<%= rs.getDate("Fecha_Nacimiento")%>"/>
                    DNI:
                    <input type="text" name="txtDNI" required minlength="8" maxlength="8" class="form-control" value="<%= rs.getString("DNI")%>"/>
                    Asiento:
                    <input type="text" id="asiento" name="txtAsi" class="form-control" readonly value="<%= rs.getString("idAsiento")%>"/>
                    Estado:
                    <input type="text" class="form-control" id="estado"  name="txtEst" data-readonly  value="<%= rs.getString("estado")%>"/>
                    <br>
                    <input type="submit" value="Modificar" class="btn btn-primary btn-lg">
                    <a href="FiltroListado.jsp?ir=<%=ir%>&ic=<%=ic%>&id=<%=id%>">Regresar</a>
                </form>
                <% } %>

                <div class="imagen">
                    <img src="../Imagenes/bus.PNG">
                    <%while (rs1.next()) {%>
                    <h7 id="A01" p2="<%=rs1.getString("estado")%>" p1="<%=rs1.getString("idAsiento")%>">1</h7>
                        <%}%>
                        <%while (rs2.next()) {%>
                    <h7 id="A02" p2="<%=rs2.getString("estado")%>" p1="<%=rs2.getString("idAsiento")%>">2</h7>
                        <%}%>
                        <%while (rs3.next()) {%>
                    <h7 id="A03" p2="<%=rs3.getString("estado")%>" p1="<%=rs3.getString("idAsiento")%>">3</h7>
                        <%}%>
                        <%while (rs4.next()) {%>
                    <h7 id="A04" p2="<%=rs4.getString("estado")%>" p1="<%=rs4.getString("idAsiento")%>">4</h7>
                        <%}%>
                        <%while (rs5.next()) {%>
                    <h7 id="A05" p2="<%=rs5.getString("estado")%>" p1="<%=rs5.getString("idAsiento")%>">5</h7>
                        <%}%>
                        <%while (rs6.next()) {%>
                    <h7 id="A06" p2="<%=rs6.getString("estado")%>" p1="<%=rs6.getString("idAsiento")%>">6</h7>
                        <%}%>
                        <%while (rs7.next()) {%>
                    <h7 id="A07" p2="<%=rs7.getString("estado")%>" p1="<%=rs7.getString("idAsiento")%>">7</h7>
                        <%}%>
                        <%while (rs8.next()) {%>
                    <h7 id="A08" p2="<%=rs8.getString("estado")%>" p1="<%=rs8.getString("idAsiento")%>">8</h7>
                        <%}%>
                        <%while (rs9.next()) {%>
                    <h7 id="A09" p2="<%=rs9.getString("estado")%>" p1="<%=rs9.getString("idAsiento")%>">9</h7>
                        <%}%>
                        <%while (rs10.next()) {%>
                    <h7 id="A10" p2="<%=rs10.getString("estado")%>" p1="<%=rs10.getString("idAsiento")%>">10</h7>
                        <%}%>
                        <%while (rs11.next()) {%>
                    <h7 id="A11" p2="<%=rs11.getString("estado")%>" p1="<%=rs11.getString("idAsiento")%>">11</h7>
                        <%}%>
                        <%while (rs12.next()) {%>
                    <h7 id="A12" p2="<%=rs12.getString("estado")%>" p1="<%=rs12.getString("idAsiento")%>">12</h7>
                        <%}%>
                        <%while (rs13.next()) {%>
                    <h7 id="A13" p2="<%=rs13.getString("estado")%>" p1="<%=rs13.getString("idAsiento")%>">13</h7>
                        <%}%>
                        <%while (rs14.next()) {%>
                    <h7 id="A14" p2="<%=rs14.getString("estado")%>" p1="<%=rs14.getString("idAsiento")%>">14</h7>
                        <%}%>
                        <%while (rs15.next()) {%>
                    <h7 id="A15" p2="<%=rs15.getString("estado")%>" p1="<%=rs15.getString("idAsiento")%>">15</h7>
                        <%}%>
                        <%while (rs16.next()) {%>
                    <h7 id="A16" p2="<%=rs16.getString("estado")%>" p1="<%=rs16.getString("idAsiento")%>">16</h7>
                        <%}%>
                        <%while (rs17.next()) {%>
                    <h7 id="A17" p2="<%=rs17.getString("estado")%>" p1="<%=rs17.getString("idAsiento")%>">17</h7>
                        <%}%>
                        <%while (rs18.next()) {%>
                    <h7 id="A18" p2="<%=rs18.getString("estado")%>" p1="<%=rs18.getString("idAsiento")%>">18</h7>
                        <%}%>
                        <%while (rs19.next()) {%>
                    <h7 id="A19" p2="<%=rs19.getString("estado")%>" p1="<%=rs19.getString("idAsiento")%>">19</h7>
                        <%}%>
                        <%while (rs20.next()) {%>
                    <h7 id="A20" p2="<%=rs20.getString("estado")%>" p1="<%=rs20.getString("idAsiento")%>">20</h7>
                        <%}%>
                        <%while (rs21.next()) {%>
                    <h7 id="A21" p2="<%=rs21.getString("estado")%>" p1="<%=rs21.getString("idAsiento")%>">21</h7>
                        <%}%>
                        <%while (rs22.next()) {%>
                    <h7 id="A22" p2="<%=rs22.getString("estado")%>" p1="<%=rs22.getString("idAsiento")%>">22</h7>
                        <%}%>
                        <%while (rs23.next()) {%>
                    <h7 id="A23" p2="<%=rs23.getString("estado")%>" p1="<%=rs23.getString("idAsiento")%>">23</h7>
                        <%}%>
                        <%while (rs24.next()) {%>
                    <h7 id="A24" p2="<%=rs24.getString("estado")%>" p1="<%=rs24.getString("idAsiento")%>">24</h7>
                        <%}%>
                        <%while (rs25.next()) {%>
                    <h7 id="A25" p2="<%=rs25.getString("estado")%>" p1="<%=rs25.getString("idAsiento")%>">25</h7>
                        <%}%>
                        <%while (rs26.next()) {%>
                    <h7 id="A26" p2="<%=rs26.getString("estado")%>" p1="<%=rs26.getString("idAsiento")%>">26</h7>
                        <%}%>
                        <%while (rs27.next()) {%>
                    <h7 id="A27" p2="<%=rs27.getString("estado")%>" p1="<%=rs27.getString("idAsiento")%>">27</h7>
                        <%}%>
                        <%while (rs28.next()) {%>
                    <h7 id="A28" p2="<%=rs28.getString("estado")%>" p1="<%=rs28.getString("idAsiento")%>">28</h7>
                        <%}%>
                        <%while (rs29.next()) {%>
                    <h7 id="A29" p2="<%=rs29.getString("estado")%>" p1="<%=rs29.getString("idAsiento")%>">29</h7>
                        <%}%>
                        <%while (rs30.next()) {%>
                    <h7 id="A30" p2="<%=rs30.getString("estado")%>" p1="<%=rs30.getString("idAsiento")%>">30</h7>
                        <%}%>
                        <%while (rs31.next()) {%>
                    <h7 id="A31" p2="<%=rs31.getString("estado")%>" p1="<%=rs31.getString("idAsiento")%>">31</h7>
                        <%}%>
                        <%while (rs32.next()) {%>
                    <h7 id="A32" p2="<%=rs32.getString("estado")%>" p1="<%=rs32.getString("idAsiento")%>">32</h7>
                        <%}%>

                </div>
            </div>
            <!--------------------------------ESTILO Y SCRIPTS-------------------------------------->                    
            <style>
                input[data-readonly] {
                    pointer-events: none;
                }
            </style>
            <script src="../js/jquery.min.js" type="text/javascript"></script>
            <script>
                $(document).ready(function () {
                    $('#A01, #A02, #A03, #A04, #A05, #A06, #A07, #A08, #A09, #A10, #A11, #A12, #A13, #A14, #A15, #A16, #A17, #A18, #A19, #A20, #A21, #A22, #A23, #A24, #A25, #A26, #A27, #A28, #A29, #A30, #A31, #A32').click(function () {
                        $valor = $(this).attr('p1');
                        $('#asiento').val($valor);
                    });
                });
            </script>

            <script>
                $(document).ready(function () {
                    $('#A01, #A02, #A03, #A04, #A05, #A06, #A07, #A08, #A09, #A10, #A11, #A12, #A13, #A14, #A15, #A16, #A17, #A18, #A19, #A20, #A21, #A22, #A23, #A24, #A25, #A26, #A27, #A28, #A29, #A30, #A31, #A32').click(function () {
                        $valor = $(this).attr('p2');
                        $('#estado').val($valor);
                    });
                });
            </script>
    </body>
</html>
<%
    String idef, nombre, paterno, materno, fecha, dni, pasaje, asiento;
    idef = request.getParameter("txtId");
    nombre = request.getParameter("txtNom");
    paterno = request.getParameter("txtAp");
    materno = request.getParameter("txtAm");
    fecha = request.getParameter("txtFn");
    dni = request.getParameter("txtDNI");
    pasaje = request.getParameter("txtPasa");
    asiento = request.getParameter("txtAsi");
    if (idef != null && nombre != null && paterno != null && materno != null && fecha != null && dni != null && pasaje != null && asiento != null) {
        ps = con.prepareStatement("update personas set idPersonas='" + idef + "',Nombres='" + nombre + "',Ape_Paterno='" + paterno + "',Ape_Materno='" + materno + "',Fecha_Nacimiento='" + fecha + "',DNI='" + dni + "',idPasaje='" + pasaje + "',idAsiento='" + asiento + "' where idPersonas=" + idef);
        ps.executeUpdate();
        response.sendRedirect("FiltroListado.jsp?id="+id+"&ir="+ir+"&ic="+ic);
    }
%>
