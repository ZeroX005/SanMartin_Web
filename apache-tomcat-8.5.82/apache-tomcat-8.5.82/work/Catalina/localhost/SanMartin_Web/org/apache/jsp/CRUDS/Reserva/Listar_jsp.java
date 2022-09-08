/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.82
 * Generated at: 2022-09-08 22:02:45 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.CRUDS.Reserva;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Conex.ConexionDB;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class Listar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("Conex.ConexionDB");
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
    _jspx_imports_classes.add("java.sql.DriverManager");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">  \n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Poppins|Righteous&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"../../css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title>Listar Reservas</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("        <div class=\"menu\">\n");
      out.write("            <nav class=\"navbar navbar-expand-md bg-dark navbar-dark\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <a class=\"navbar-brand col-9\" href=\"../index.jsp\" style=\"font-family: 'Righteous', cursive;\">San Martin</a>\n");
      out.write("                    <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapsibleNavbar\">\n");
      out.write("                        <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <br>\n");
      out.write("            <h1>Listado de Reservas</h1> \n");
      out.write("            <hr>\n");
      out.write("            <!--<a class=\"btn btn-success btn-lg\" href=\"Agregar.jsp\">Nuevo Registro</a>-->\n");
      out.write("            <a href=\"../index.jsp\">Menú Mantenimiento</a>\n");
      out.write("            <table class=\"table-sm table-bordered\">\n");
      out.write("                <tr>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">ID</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">NOMBRES</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">APELLIDOS</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">ID PASAJE</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">ORIGEN</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">DESTINO</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">FECHA/HORA SALIDA</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">PRECIO TOTAL</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">ACOMPAÑANTES</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">CANTIDAD ASIENTOS</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">ASIENTO CLIENTE</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">BUS</th>\n");
      out.write("                    <th class=\"text-center\" style=\"background: dodgerblue\">ACCIONES</th>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                ");
                    while (rs.next()) {
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getInt("idReserva"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("Nombres"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("Apellidos"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getInt("idPasaje"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("Origen"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("Destino"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("FH_Salida"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("Precio_Total"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\"><a href=\"FiltroListado.jsp?id=");
      out.print( rs.getInt("idCliente"));
      out.write("&ic=");
      out.print(rs.getInt("idPasaje"));
      out.write("&ir=");
      out.print(rs.getInt("idReserva"));
      out.write("\" class=\"btn btn-success\">Ver</a></td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("Asientos"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("Nro_Asiento"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">");
      out.print( rs.getString("Bus"));
      out.write("</td>\n");
      out.write("                    <td class=\"text-center\">\n");
      out.write("                        <a href=\"Editar.jsp?id=");
      out.print( rs.getInt("idReserva"));
      out.write("\" class=\"btn btn-warning btn-sm\" style=\"margin-bottom:10px;width:66px\">Editar</a>\n");
      out.write("                        <a href=\"Delete.jsp?id=");
      out.print( rs.getInt("idReserva"));
      out.write("\" class=\"btn btn-danger btn-sm\">Eliminar</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");
 }
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("        <br>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
