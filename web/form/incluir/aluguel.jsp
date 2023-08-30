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

                <a class="operation selected">
                    Locar
                </a>

                <a href="../excluir/aluguel.jsp" class="operation">
                    Cancelar
                </a>

                <a href="../alterar/aluguel.jsp" class="operation">
                    Devolver
                </a>

                <a href="../consultar/aluguel.jsp" class="operation">
                    Consultar
                </a>

            </div>
        </span>
        
        <div class="vertical-space"></div>
        
        <form action="back/incluir_aluguel.jsp" method="post" class="outer">
            
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
                <label for="idVeiculo">ID do veículo</label><br>
                <input type="number" step="1" pattern="\d+" id="idVeiculo" name="idVeiculo" placeholder="Insira o ID do veículo" min="1" max="2147483647" required>
            </div>
            
            <div class="form-input">
                <label for="cpfCliente">CPF do cliente</label><br>
                <select name="cpfCliente" id="cpfCliente" required>
                    <option value="" disabled selected>Insira o CPF do cliente</option>
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
            
            <div class="form-input">
                <label for="dataAluguel">Data de início</label><br>
                <input type="datetime-local" id="dataAluguel" name="dataAluguel" required>
            </div>
            
            <div class="form-input">
                <label for="dataDevolucao">Data de devolução <small class="no-select"><small>(não preencha caso a devolução não tenha sido feita)</small></small></label><br>
                <input type="datetime-local" id="dataDevolucao" name="dataDevolucao">
            </div>
            
            <div class="form-input">
                <label for="dataEstimadaDevolucao">Data estimada de devolução</label><br>
                <input type="datetime-local" id="dataEstimadaDevolucao" name="dataEstimadaDevolucao" required>
            </div>
            
            <div class="form-input">
                <input type="checkbox" id="pagamento" name="pagamento">
                <label for="pagamento">Pagamentos efetuado</label><br>
            </div><br>
            
            <div class="form-button">
                <button type="submit">
                    Enviar
                </button>
                
                <button type="reset">
                    Reset
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