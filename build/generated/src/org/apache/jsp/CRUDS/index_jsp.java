package org.apache.jsp.CRUDS;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

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
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"../css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Poppins|Righteous&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"../css/grilla.css?v=1.0\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"../wow/animate.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title>Menu Grillas</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"menu\">\n");
      out.write("            <nav class=\"navbar navbar-expand-md bg-dark navbar-dark\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <a class=\"navbar-brand col-9\" href=\"index.jsp\" style=\"font-family: 'Righteous', cursive;\">San Martin</a>\n");
      out.write("                    <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapsibleNavbar\">\n");
      out.write("                        <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <section id=\"grilla\">\n");
      out.write("            <div class=\"container\" style=\"display:flex\">\n");
      out.write("                    <div class=\"listado\">\n");
      out.write("                <ul class=\"wow fadeInLeft\">\n");
      out.write("                    <a style=\"text-decoration: none\" href=\"Cliente/Listar.jsp\"><li style=\"background-color: #CD3A3A\">Mantenimiento Cliente</li></a>\n");
      out.write("                    <a style=\"text-decoration: none\" href=\"Acompañantes/Listar.jsp\"><li style=\"background-color: #ECF144\">Mantenimiento Acompañantes</li></a>\n");
      out.write("                    <a style=\"text-decoration: none\" href=\"Pasaje/Listar.jsp\"><li style=\"background-color: #2CD91F\">Mantenimiento Pasaje</li></a>\n");
      out.write("                    <a style=\"text-decoration: none\" href=\"Reserva/Listar.jsp\"><li style=\"background-color: #21E0D2\">Mantenimiento Reserva</li></a>\n");
      out.write("                    <a style=\"text-decoration: none\" href=\"Bus/Listar.jsp\"><li style=\"background-color: #295ED8\">Mantenimiento Bus</li></a>\n");
      out.write("                    <a style=\"text-decoration: none\" href=\"Ciudad/Listar.jsp\"><li style=\"background-color: #C231D6\">Mantenimiento Ciudad</li></a>\n");
      out.write("                    <a style=\"text-decoration: none\" href=\"Asientos/Listar.jsp\"><li style=\"background-color: #E0911F\">Mantenimiento Asientos</li></a>\n");
      out.write("                </ul>\n");
      out.write("                        </div>\n");
      out.write("                    <div id=\"imagen\">\n");
      out.write("                <img class=\"wow fadeIn\" style=\"width: 750px;margin-top: 50px\"  src=\"../Imagenes/crud.png\">\n");
      out.write("                </div>\n");
      out.write("                </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!------------------SCRIP------------>\n");
      out.write("        <script src=\"../wow/wow.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script>\n");
      out.write("            new WOW().init();\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
