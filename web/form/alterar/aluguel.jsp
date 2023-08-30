<%@page import="classes.Usuarios"%>
<%@page import="classes.Alugueis"%>
<%@page import="classes.Clientes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Aluguéis | Athena Locadora</title>
        
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
                    Aluguéis
                </h1>
            </div>

            <div class="operation-selector">

                <a href="../incluir/aluguel.jsp" class="operation">
                    Locar
                </a>

                <a href="../excluir/aluguel.jsp" class="operation">
                    Cancelar
                </a>

                <a class="operation selected">
                    Devolver
                </a>

                <a href="../consultar/aluguel.jsp" class="operation">
                    Consultar
                </a>

            </div>
        </span>
        
        <div class="vertical-space"></div>
        
        <form action="back/alterar_aluguel.jsp" method="post" class="outer">
            
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
                <label for="idAluguel">ID do aluguel <small class="no-select">(buscar por)</small></label><br>
                <select name="idAluguel" id="idAluguel" required>
                    <option value="" disabled selected>Insira o ID do aluguel</option>
                    <%
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
                    %>
                    <option value="<%= fIdAluguel%>" <%= selectedAttribute %>><%= fIdAluguel%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input">
                <label for="cpfCliente">CPF do cliente <small class="no-select">(buscar por)</small></label><br>
                <select name="cpfCliente" id="cpfCliente" required>
                    <option value="" disabled selected>Insira o CPF do cliente</option>
                    <%
                        Clientes cli = new Clientes();
                        List<Clientes> listaClientes = new ArrayList<>();
                        listaClientes = cli.consultarClientes();
                        
                        String cpfConsulta = request.getParameter("cpfCliente") != null ? request.getParameter("cpfCliente") : "";

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
            
            <div class="form-input">
                <label for="dataDevolucao">Data de devolução</label><br>
                <input type="datetime-local" id="dataDevolucao" name="dataDevolucao" value="<%=request.getParameter("dataDevolucao") != null ? request.getParameter("dataDevolucao") : ""%>" required>
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