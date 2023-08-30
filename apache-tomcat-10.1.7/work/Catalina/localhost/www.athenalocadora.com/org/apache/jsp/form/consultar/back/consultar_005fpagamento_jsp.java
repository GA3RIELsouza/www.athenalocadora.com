/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.7
 * Generated at: 2023-08-30 21:35:21 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.form.consultar.back;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import classes.Usuarios;
import classes.Pagamentos;
import java.util.ArrayList;
import java.util.List;
import java.io.PrintWriter;

public final class consultar_005fpagamento_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
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
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("classes.Usuarios");
    _jspx_imports_classes.add("classes.Pagamentos");
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
      out.write("        <title>Pagamentos | Athena Locadora</title>\n");
      out.write("        \n");
      out.write("        <link rel=\"icon\" type=\"image/x-icon\" href=\"/www.athenalocadora.com/images/favicon.ico?v=1\">\n");
      out.write("        <link href=\"/www.athenalocadora.com/css/styles.css\" rel=\"stylesheet\">\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        ");

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
      out.write("                    Pagamentos\n");
      out.write("                </h1>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"operation-selector\">\n");
      out.write("\n");
      out.write("                <a href=\"../../incluir/pagamento.jsp\" class=\"operation\">\n");
      out.write("                    Incluir\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"../../excluir/pagamento.jsp\" class=\"operation\">\n");
      out.write("                    Excluir\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"../../alterar/pagamento.jsp\" class=\"operation\">\n");
      out.write("                    Alterar\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a class=\"operation selected\">\n");
      out.write("                    Consultar\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </span>\n");
      out.write("            \n");
      out.write("        <div class=\"vertical-space\"></div>\n");
      out.write("        \n");
      out.write("        <table class=\"outer\">\n");
      out.write("                \n");
      out.write("                <thead>\n");
      out.write("                    \n");
      out.write("                    <th style=\"background-color: transparent;\">\n");
      out.write("                        <br>\n");
      out.write("                    </th>\n");
      out.write("                    \n");
      out.write("                    <th scope=\"col\" style=\"border-top-left-radius: var(--smooth-corners);\">\n");
      out.write("                        ID do pagamento\n");
      out.write("                    </th>\n");
      out.write("                    \n");
      out.write("                    <th scope=\"col\">\n");
      out.write("                        ID do aluguel\n");
      out.write("                    </th>\n");
      out.write("                    \n");
      out.write("                    <th scope=\"col\">\n");
      out.write("                        Data\n");
      out.write("                    </th>\n");
      out.write("                    \n");
      out.write("                    <th scope=\"col\">\n");
      out.write("                        Tipo\n");
      out.write("                    </th>\n");
      out.write("                    \n");
      out.write("                    <th scope=\"col\" style=\"border-top-right-radius: var(--smooth-corners);\">\n");
      out.write("                        Valor\n");
      out.write("                    </th>\n");
      out.write("                    \n");
      out.write("                    <th style=\"background-color: transparent;\"\">\n");
      out.write("                        <br>\n");
      out.write("                    </th>\n");
      out.write("                    \n");
      out.write("                </thead>\n");
      out.write("                \n");
      out.write("                ");

                    int vModoConsulta;
                    if(request.getParameter("modoConsulta") != null) {
                        vModoConsulta = Integer.parseInt(request.getParameter("modoConsulta"));
                    }else {
                        vModoConsulta = -1;
                    }

                    Pagamentos pag = new Pagamentos();

                    if(vModoConsulta == 0 && Integer.parseInt(request.getParameter("idPagamento")) > 0 && Integer.parseInt(request.getParameter("idAluguel")) > 0) {
                        int vIdPagamento = Integer.parseInt(request.getParameter("idPagamento"));
                        pag.setIdPagamento(vIdPagamento);
                        int vIdAluguel = Integer.parseInt(request.getParameter("idAluguel"));
                        pag.setIdAluguel(vIdAluguel);
                        
                        pag = pag.consultarPagamento();
                        
                        if(pag != null) {
                
      out.write("\n");
      out.write("                \n");
      out.write("                <tbody>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        \n");
      out.write("                        <td style=\"background-color: transparent;\">\n");
      out.write("                            <a class=\"alterar\" href=\"../../alterar/pagamento.jsp?idPagamento=");
      out.print(pag.getIdPagamento());
      out.write("&idAluguel=");
      out.print(pag.getIdAluguel());
      out.write("&data=");
      out.print(pag.getDataPagamento());
      out.write("&tipo=");
      out.print(pag.getTipoPagamento());
      out.write("&valor=");
      out.print(pag.getVlrPagamento());
      out.write("\">\n");
      out.write("                                Alterar\n");
      out.write("                            </a>\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ");

                                out.print(pag.getIdPagamento());
                            
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ");

                                out.print(pag.getIdAluguel());
                            
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ");

                                out.print(pag.getDataPagamento());
                            
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ");

                                out.print(pag.getTipoPagamento());
                            
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ");

                                out.print("R$" + pag.getVlrPagamento());
                            
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td style=\"background-color: transparent;\">\n");
      out.write("                            <a class=\"excluir\" href=\"../../excluir/pagamento.jsp?idPagamento=");
      out.print(pag.getIdPagamento());
      out.write("&idAluguel=");
      out.print(pag.getIdAluguel());
      out.write("\">\n");
      out.write("                                Excluir\n");
      out.write("                            </a>\n");
      out.write("                        </td>\n");
      out.write("                \n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                </tbody>\n");
      out.write("                \n");
      out.write("                ");

                        }else {
                
      out.write("\n");
      out.write("                \n");
      out.write("                <tbody>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        \n");
      out.write("                        <td style=\"background-color: transparent;\">\n");
      out.write("                            <br>\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            Nenhum resultado encontrado\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ---\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ---\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ---\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ---\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td style=\"background-color: transparent;\">\n");
      out.write("                            <br>\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                </tbody>\n");
      out.write("                \n");
      out.write("                ");

                        }
                    }else if(vModoConsulta == 1) {
                        List<Pagamentos> listaPagamentos = new ArrayList<>();
                        listaPagamentos = pag.consultarPagamentos();
                        
                        for(Pagamentos p : listaPagamentos) {
               
      out.write("\n");
      out.write("               \n");
      out.write("               <tbody>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        \n");
      out.write("                        <td style=\"background-color: transparent;\">\n");
      out.write("                            <a class=\"alterar\" href=\"../../alterar/pagamento.jsp?idPagamento=");
      out.print(p.getIdPagamento());
      out.write("&idAluguel=");
      out.print(p.getIdAluguel());
      out.write("&data=");
      out.print(p.getDataPagamento());
      out.write("&tipo=");
      out.print(p.getTipoPagamento());
      out.write("&valor=");
      out.print(p.getVlrPagamento());
      out.write("\">\n");
      out.write("                                Alterar\n");
      out.write("                            </a>\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ");

                                out.print(p.getIdPagamento());
                            
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ");

                                out.print(p.getIdAluguel());
                            
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ");

                                out.print(p.getDataPagamento());
                            
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ");

                                out.print(p.getTipoPagamento());
                            
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ");

                                out.print("R$" + p.getVlrPagamento());
                            
      out.write("\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td style=\"background-color: transparent;\">\n");
      out.write("                            <a class=\"excluir\" href=\"../../excluir/pagamento.jsp?idPagamento=");
      out.print(p.getIdPagamento());
      out.write("&idAluguel=");
      out.print(p.getIdAluguel());
      out.write("\">\n");
      out.write("                                Excluir\n");
      out.write("                            </a>\n");
      out.write("                        </td>\n");
      out.write("                \n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                </tbody>\n");
      out.write("                \n");
      out.write("                ");

                        }
                    }else {
                
      out.write("\n");
      out.write("                \n");
      out.write("                <tbody>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        \n");
      out.write("                        <td style=\"background-color: transparent;\">\n");
      out.write("                            <br>\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            Nenhum resultado encontrado\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ---\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ---\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ---\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td>\n");
      out.write("                            ---\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                        <td style=\"background-color: transparent;\">\n");
      out.write("                            <br>\n");
      out.write("                        </td>\n");
      out.write("                        \n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                </tbody>\n");
      out.write("                \n");
      out.write("                ");

                    }  
                
      out.write("\n");
      out.write("                \n");
      out.write("                <th style=\"background-color: transparent;\">\n");
      out.write("                    <br>\n");
      out.write("                </th>\n");
      out.write("                \n");
      out.write("                <th style=\"border-bottom-left-radius: var(--smooth-corners);\">\n");
      out.write("                    <br>\n");
      out.write("                </th>\n");
      out.write("                \n");
      out.write("                <th>\n");
      out.write("                    <br>\n");
      out.write("                </th>\n");
      out.write("                \n");
      out.write("                <th>\n");
      out.write("                    <br>\n");
      out.write("                </th>\n");
      out.write("                \n");
      out.write("                <th>\n");
      out.write("                    <br>\n");
      out.write("                </th>\n");
      out.write("                \n");
      out.write("                <th style=\"border-bottom-right-radius: var(--smooth-corners);\">\n");
      out.write("                    <br>\n");
      out.write("                </th>\n");
      out.write("                \n");
      out.write("                <th style=\"background-color: transparent;\">\n");
      out.write("                    <br>\n");
      out.write("                </th>\n");
      out.write("                \n");
      out.write("        </table>\n");
      out.write("       \n");
      out.write("       <div class=\"vertical-space\"></div>\n");
      out.write("            \n");
      out.write("        <div class=\"home\">\n");
      out.write("            <a href=\"../pagamento.jsp\" class=\"home-button outer\">\n");
      out.write("                Voltar\n");
      out.write("            </a>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div class=\"vertical-space\"></div>\n");
      out.write("       \n");
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
