/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.7
 * Generated at: 2023-08-30 21:59:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.form.excluir;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import classes.Usuarios;
import classes.Alugueis;
import classes.Clientes;
import java.util.ArrayList;
import java.util.List;

public final class aluguel_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/include/check_login.jsp", Long.valueOf(1693431423111L));
    _jspx_dependants.put("/include/header.html", Long.valueOf(1693431191856L));
    _jspx_dependants.put("/include/theme.html", Long.valueOf(1693431220346L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("classes.Clientes");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("classes.Alugueis");
    _jspx_imports_classes.add("classes.Usuarios");
    _jspx_imports_classes.add("java.util.ArrayList");
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

      out.write('\n');
      out.write('\n');

    Cookie[] cookies = request.getCookies();
    Usuarios  usu     = new Usuarios();
    boolean  ok       = false;

    if(cookies != null) {
       for(Cookie atual : cookies) {
            if(atual.getName().equals("sessionId")) {
                usu.setSessionId(atual.getValue());

                if(usu.checkSessionId()) {
                    ok = true;
                }
            }
        }
    }

    if(ok == false) {
        response.sendRedirect("/www.athenalocadora.com/index.jsp");
    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html lang=\"pt\">\n");
      out.write("    \n");
      out.write("    <head>\n");
      out.write("        \n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Aluguéis | Athena Locadora</title>\n");
      out.write("        \n");
      out.write("        <link rel=\"icon\" type=\"image/x-icon\" href=\"/www.athenalocadora.com/images/favicon.ico?v=1\">\n");
      out.write("        <link href=\"/www.athenalocadora.com/css/styles.css\" rel=\"stylesheet\">\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        ");
      out.write("<html lang=\"pt\">\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <header>\n");
      out.write("            \n");
      out.write("            <img class=\"home-img\" src=\"/www.athenalocadora.com/images/favicon.ico?v=1\" alt=\"InÃ­cio\" onclick=\"location.href='/www.athenalocadora.com/inicio.jsp'\">\n");
      out.write("            \n");
      out.write("            <a href=\"/www.athenalocadora.com/inicio.jsp\" class=\"home-text\">\n");
      out.write("                Athena Locadora\n");
      out.write("            </a>\n");
      out.write("            \n");
      out.write("            <a href=\"/www.athenalocadora.com/usuario/perfil.jsp\" class=\"profile\">\n");
      out.write("                Perfil\n");
      out.write("            </a>\n");
      out.write("            \n");
      out.write("            <a href=\"/www.athenalocadora.com/logoff.jsp\" class=\"logoff\">\n");
      out.write("                Sair\n");
      out.write("            </a>\n");
      out.write("            \n");
      out.write("        </header>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("</html>");
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"vertical-space\"></div>\n");
      out.write("        <div class=\"vertical-space\"></div>\n");
      out.write("        \n");
      out.write("        <span class=\"outer\">\n");
      out.write("            <div class=\"title-form\">\n");
      out.write("                <h1>\n");
      out.write("                    Aluguéis\n");
      out.write("                </h1>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"operation-selector\">\n");
      out.write("\n");
      out.write("                <a href=\"../incluir/aluguel.jsp\" class=\"operation\">\n");
      out.write("                    Locar\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a class=\"operation selected\">\n");
      out.write("                    Cancelar\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"../alterar/aluguel.jsp\" class=\"operation\">\n");
      out.write("                    Devolver\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"../consultar/aluguel.jsp\" class=\"operation\">\n");
      out.write("                    Consultar\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </span>\n");
      out.write("        \n");
      out.write("        <div class=\"vertical-space\"></div>\n");
      out.write("        \n");
      out.write("        <form action=\"back/excluir_aluguel.jsp\" method=\"post\" class=\"outer\">\n");
      out.write("            \n");
      out.write("            <div class=\"sucesso\" id=\"sucesso\">\n");
      out.write("                ");

                    if(request.getParameter("sucesso") != null)         
                        out.write(request.getParameter("sucesso"));
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"erro\" id=\"erro\">\n");
      out.write("                ");

                    if(request.getParameter("erro") != null)         
                        out.write(request.getParameter("erro"));
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"form-input\">\n");
      out.write("                <label for=\"idAluguel\">ID do aluguel <small class=\"no-select\">(buscar por)</small></label><br>\n");
      out.write("                <select name=\"idAluguel\" id=\"idAluguel\" required>\n");
      out.write("                    <option value=\"\" disabled selected>Insira o ID do aluguel</option>\n");
      out.write("                    ");

                        Alugueis alu = new Alugueis();
                        List<Alugueis> listaAlugueis = new ArrayList<>();
                        listaAlugueis = alu.consultarAlugueis();
                        
                        int idAluguelConsulta = 0;

                        String idAlu = request.getParameter("idAluguel");
                        if (idAlu != null && !idAlu.isEmpty()) {
                            idAluguelConsulta = Integer.parseInt(idAlu);
                        }

                        for(Alugueis a : listaAlugueis) {
                            int fIdAluguel = a.getIdAluguel();
                            String selectedAttribute = fIdAluguel==idAluguelConsulta ? "selected" : "";
                    
      out.write("\n");
      out.write("                    <option value=\"");
      out.print( fIdAluguel);
      out.write('"');
      out.write(' ');
      out.print( selectedAttribute );
      out.write('>');
      out.print( fIdAluguel);
      out.write("</option>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"form-input\">\n");
      out.write("                <label for=\"cpfCliente\">CPF do cliente <small class=\"no-select\">(buscar por)</small></label><br>\n");
      out.write("                <select name=\"cpfCliente\" id=\"cpfCliente\" required>\n");
      out.write("                    <option value=\"\" disabled selected>Insira o CPF do cliente</option>\n");
      out.write("                    ");

                        Clientes cli = new Clientes();
                        List<Clientes> listaClientes = new ArrayList<>();
                        listaClientes = cli.consultarClientes();
                        
                        String cpfConsulta = request.getParameter("cpfCliente") != null ? request.getParameter("cpfCliente") : "";

                        for(Clientes c : listaClientes) {
                            String fCpfCliente = c.getCpfCliente();
                            String selectedAttribute = fCpfCliente.equals(cpfConsulta) ? "selected" : "";
                    
      out.write("\n");
      out.write("                    <option value=\"");
      out.print( fCpfCliente);
      out.write('"');
      out.write(' ');
      out.print( selectedAttribute );
      out.write('>');
      out.print( fCpfCliente);
      out.write("</option>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"form-button\">\n");
      out.write("                <button type=\"submit\">\n");
      out.write("                    Confirmar\n");
      out.write("                </button>\n");
      out.write("                \n");
      out.write("                <button type=\"reset\">\n");
      out.write("                    Reiniciar\n");
      out.write("                </button>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("            \n");
      out.write("        <div class=\"vertical-space\"></div>\n");
      out.write("        \n");
      out.write("        <div class=\"home\">\n");
      out.write("            <a href=\"/www.athenalocadora.com/inicio.jsp\" class=\"home-button outer\">\n");
      out.write("                Voltar\n");
      out.write("            </a>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div class=\"vertical-space\"></div>\n");
      out.write("            \n");
      out.write("        ");
      out.write("<html lang=\"pt\">\n");
      out.write("    \n");
      out.write("    <head>\n");
      out.write("        \n");
      out.write("        <script>\n");
      out.write("            if (localStorage.getItem(\"tema\")) {\n");
      out.write("                var elementos  = document.getElementsByTagName(\"*\");\n");
      out.write("                \n");
      out.write("                for (var i = 0; i < elementos.length; i++) {\n");
      out.write("                    elementos[i].classList.remove(\"tema-azul\", \"tema-verde\", \"tema-laranja\", \"tema-cinza\");\n");
      out.write("                    elementos[i].classList.add(localStorage.getItem(\"tema\"));\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function mudaTema() {\n");
      out.write("                var temaSelect = document.getElementById(\"tema-select\");\n");
      out.write("                var elementos  = document.getElementsByTagName(\"*\");\n");
      out.write("                var temaSelecionado = temaSelect.value;\n");
      out.write("                \n");
      out.write("                for (var i = 0; i < elementos.length; i++) {\n");
      out.write("                    elementos[i].classList.remove(\"tema-azul\", \"tema-verde\", \"tema-laranja\", \"tema-cinza\");\n");
      out.write("\n");
      out.write("                    switch(temaSelecionado) {\n");
      out.write("                        case \"0\":\n");
      out.write("                            elementos[i].classList.add(\"tema-azul\");\n");
      out.write("                            localStorage.setItem(\"tema\", \"tema-azul\");\n");
      out.write("                        break;\n");
      out.write("\n");
      out.write("                        case \"1\":\n");
      out.write("                            elementos[i].classList.add(\"tema-verde\");\n");
      out.write("                            localStorage.setItem(\"tema\", \"tema-verde\");\n");
      out.write("                        break;\n");
      out.write("\n");
      out.write("                        case \"2\":\n");
      out.write("                            elementos[i].classList.add(\"tema-laranja\");\n");
      out.write("                            localStorage.setItem(\"tema\", \"tema-laranja\");\n");
      out.write("                        break;\n");
      out.write("\n");
      out.write("                        case \"3\":\n");
      out.write("                            elementos[i].classList.add(\"tema-cinza\");\n");
      out.write("                            localStorage.setItem(\"tema\", \"tema-cinza\");\n");
      out.write("                        break;\n");
      out.write("                        \n");
      out.write("                        default:\n");
      out.write("                            if (localStorage.getItem(\"tema\")) {\n");
      out.write("                                var elementos  = document.getElementsByTagName(\"*\");\n");
      out.write("\n");
      out.write("                                for (var i = 0; i < elementos.length; i++) {\n");
      out.write("                                    elementos[i].classList.remove(\"tema-azul\", \"tema-verde\", \"tema-laranja\", \"tema-cinza\");\n");
      out.write("                                    elementos[i].classList.add(localStorage.getItem(\"tema\"));\n");
      out.write("                                }\n");
      out.write("                            }\n");
      out.write("                        break;\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <select class=\"tema-select\" id=\"tema-select\" onchange=\"mudaTema()\">\n");
      out.write("            <option value=\"\" selected><strong>Selecione o tema desejado</strong></option>\n");
      out.write("            <option value=0>Azul</option>\n");
      out.write("            <option value=1>Verde</option>\n");
      out.write("            <option value=2>Laranja</option>\n");
      out.write("            <option value=3>Cinza</option>\n");
      out.write("        </select>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("</html>");
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("    \n");
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
