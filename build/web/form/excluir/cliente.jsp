<%@page import="classes.Usuarios"%>
<%@page import="classes.Clientes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clientes | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        
    </head>
    
    <body>
        
        <%
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
        %>
        
        <%@include file="/include/header.jsp"%>
        
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        
        <span class="outer">
            <div class="title-form">
                <h1>
                    Clientes
                </h1>
            </div>

            <div class="operation-selector">

                <a href="../incluir/cliente.jsp" class="operation">
                    Incluir
                </a>

                <a class="operation selected">
                    Excluir
                </a>

                <a href="../alterar/cliente.jsp" class="operation">
                    Alterar
                </a>

                <a href="../consultar/cliente.jsp" class="operation">
                    Consultar
                </a>

            </div>
        </span>
        
        <div class="vertical-space"></div>
        
        <form action="back/excluir_cliente.jsp" method="post" class="outer">
            
            <div class="sucesso" id="sucesso">
                <%
                    if(request.getParameter("sucesso") != null)         
                        out.write(request.getParameter("sucesso"));
                %>
            </div>
            
            <div class="erro" id="erro">
                <%
                    if(request.getParameter("erro") != null)         
                        out.write(request.getParameter("erro"));
                %>
            </div>
            
            <div class="form-input">
                <label for="cpfCliente">CPF <small class="no-select">(buscar por)</small></label><br>
                <select name="cpfCliente" id="cpfCliente" required>
                    <option value="" disabled selected>Insira o CPF</option>
                    <%
                        Clientes cli = new Clientes();
                        List<Clientes> listaClientes = new ArrayList<>();
                        listaClientes = cli.consultarClientes();
                        
                        String cpfConsulta = request.getParameter("cpf") != null ? request.getParameter("cpf") : "";

                        for(Clientes c : listaClientes) {
                            String fCpfCliente = c.getCpfCliente();
                            String selectedAttribute = fCpfCliente.equals(cpfConsulta) ? "selected" : "";
                    %>
                    <option value="<%= fCpfCliente%>" <%= selectedAttribute %>><%= fCpfCliente%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Confirmar
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
        </form>
            
        <div class="vertical-space"></div>
        
        <div class="home">
            <a href="/www.athenalocadora.com/inicio.jsp" class="home-button outer">
                Voltar
            </a>
        </div>
        
        <div class="vertical-space"></div>
            
        <%@include file="/include/theme.jsp"%>
        
    </body>
    
</html>