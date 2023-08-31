/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.7
 * Generated at: 2023-08-31 10:59:51 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/include/theme.html", Long.valueOf(1693479521686L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
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

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
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

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<html lang=\"pt\">\r\n");
      out.write("    \r\n");
      out.write("    <head>\r\n");
      out.write("        \r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Efetuar login | Athena Locadora</title>\r\n");
      out.write("        \r\n");
      out.write("        <link rel=\"icon\" type=\"image/x-icon\" href=\"images/favicon.ico?v=1\">\r\n");
      out.write("        <link href=\"css/styles.css\" rel=\"stylesheet\">\r\n");
      out.write("        \r\n");
      out.write("    </head>\r\n");
      out.write("    \r\n");
      out.write("    <body>\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"vertical-space\"></div>\r\n");
      out.write("        <div class=\"vertical-space\"></div>\r\n");
      out.write("        <div class=\"vertical-space\"></div>\r\n");
      out.write("        <div class=\"vertical-space\"></div>\r\n");
      out.write("        <div class=\"vertical-space\"></div>\r\n");
      out.write("        <div class=\"vertical-space\"></div>\r\n");
      out.write("        \r\n");
      out.write("        <form action=\"login.jsp\" method=\"post\" class=\"outer\">\r\n");
      out.write("            \r\n");
      out.write("            <h1 class=\"title\">\r\n");
      out.write("                Efetuar login\r\n");
      out.write("            </h1>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"sucesso\" id=\"sucesso\">\r\n");
      out.write("                ");

                    if(request.getParameter("sucesso") != null)         
                        out.write(request.getParameter("sucesso"));
                
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"erro\" id=\"erro\">\r\n");
      out.write("                ");

                    if(request.getParameter("erro") != null)         
                        out.write(request.getParameter("erro"));
                
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"form-input\">\r\n");
      out.write("                <label for=\"login\">Login</label><br>\r\n");
      out.write("                <input type=\"email\" id=\"login\" name=\"login\" placeholder=\"Insira seu login\" pattern=\"[a-z0-9._%+\\-]+@[a-z0-9.\\-]+\\.[a-z]{2,}$\" maxlength=\"50\" required>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"form-input\">\r\n");
      out.write("                <label for=\"senha\">Senha</label><br>\r\n");
      out.write("                <input type=\"password\" id=\"senha\" name=\"senha\" placeholder=\"Insira sua senha\" minlength=\"8\" maxlength=\"50\" required>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"form-button\" style=\"width: 40%; margin: auto;\">\r\n");
      out.write("                <button type=\"submit\">\r\n");
      out.write("                    Entrar\r\n");
      out.write("                </button>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("        </form>\r\n");
      out.write("            \r\n");
      out.write("        ");
      out.write("<html lang=\"pt\">\r\n");
      out.write("    \r\n");
      out.write("    <head>\r\n");
      out.write("        \r\n");
      out.write("        <script>\r\n");
      out.write("            if (localStorage.getItem(\"tema\")) {\r\n");
      out.write("                var elementos  = document.getElementsByTagName(\"*\");\r\n");
      out.write("                \r\n");
      out.write("                for (var i = 0; i < elementos.length; i++) {\r\n");
      out.write("                    elementos[i].classList.remove(\"tema-azul\", \"tema-verde\", \"tema-laranja\", \"tema-cinza\");\r\n");
      out.write("                    elementos[i].classList.add(localStorage.getItem(\"tema\"));\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            function mudaTema() {\r\n");
      out.write("                var temaSelect = document.getElementById(\"tema-select\");\r\n");
      out.write("                var elementos  = document.getElementsByTagName(\"*\");\r\n");
      out.write("                var temaSelecionado = temaSelect.value;\r\n");
      out.write("                \r\n");
      out.write("                for (var i = 0; i < elementos.length; i++) {\r\n");
      out.write("                    elementos[i].classList.remove(\"tema-azul\", \"tema-verde\", \"tema-laranja\", \"tema-cinza\");\r\n");
      out.write("\r\n");
      out.write("                    switch(temaSelecionado) {\r\n");
      out.write("                        case \"0\":\r\n");
      out.write("                            elementos[i].classList.add(\"tema-azul\");\r\n");
      out.write("                            localStorage.setItem(\"tema\", \"tema-azul\");\r\n");
      out.write("                        break;\r\n");
      out.write("\r\n");
      out.write("                        case \"1\":\r\n");
      out.write("                            elementos[i].classList.add(\"tema-verde\");\r\n");
      out.write("                            localStorage.setItem(\"tema\", \"tema-verde\");\r\n");
      out.write("                        break;\r\n");
      out.write("\r\n");
      out.write("                        case \"2\":\r\n");
      out.write("                            elementos[i].classList.add(\"tema-laranja\");\r\n");
      out.write("                            localStorage.setItem(\"tema\", \"tema-laranja\");\r\n");
      out.write("                        break;\r\n");
      out.write("\r\n");
      out.write("                        case \"3\":\r\n");
      out.write("                            elementos[i].classList.add(\"tema-cinza\");\r\n");
      out.write("                            localStorage.setItem(\"tema\", \"tema-cinza\");\r\n");
      out.write("                        break;\r\n");
      out.write("                        \r\n");
      out.write("                        default:\r\n");
      out.write("                            if (localStorage.getItem(\"tema\")) {\r\n");
      out.write("                                var elementos  = document.getElementsByTagName(\"*\");\r\n");
      out.write("\r\n");
      out.write("                                for (var i = 0; i < elementos.length; i++) {\r\n");
      out.write("                                    elementos[i].classList.remove(\"tema-azul\", \"tema-verde\", \"tema-laranja\", \"tema-cinza\");\r\n");
      out.write("                                    elementos[i].classList.add(localStorage.getItem(\"tema\"));\r\n");
      out.write("                                }\r\n");
      out.write("                            }\r\n");
      out.write("                        break;\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        </script>\r\n");
      out.write("        \r\n");
      out.write("    </head>\r\n");
      out.write("    \r\n");
      out.write("    <body>\r\n");
      out.write("        \r\n");
      out.write("        <select class=\"tema-select\" id=\"tema-select\" onchange=\"mudaTema()\">\r\n");
      out.write("            <option value=\"\" selected><strong>Selecione o tema desejado</strong></option>\r\n");
      out.write("            <option value=0>Azul</option>\r\n");
      out.write("            <option value=1>Verde</option>\r\n");
      out.write("            <option value=2>Laranja</option>\r\n");
      out.write("            <option value=3>Cinza</option>\r\n");
      out.write("        </select>\r\n");
      out.write("        \r\n");
      out.write("    </body>\r\n");
      out.write("    \r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("    </body>\r\n");
      out.write("    \r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
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
