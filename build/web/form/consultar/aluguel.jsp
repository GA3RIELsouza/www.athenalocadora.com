<%@page import="classes.Usuarios"%>
<%@page import="classes.Clientes"%>
<%@page import="classes.Veiculos"%>
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
        
        <script src="/www.athenalocadora.com/js/jquery-1.2.6.pack.js"></script>
        <script src="/www.athenalocadora.com/js/jquery.maskedinput-1.1.4.pack.js"></script>
        <script type="text/javascript">
            function scriptModoConsulta() {
                var campoCpfCliente = document.getElementById("campoCpfCliente");
                var inputCpfCliente = document.getElementById("cpfCliente");
                var campoIdVeiculo  = document.getElementById("campoIdVeiculo");
                var inputIdVeiculo  = document.getElementById("idVeiculo");
                var modoSelecionado = document.getElementById("modoConsulta").value;
                
                if(modoSelecionado === "0") {
                    campoCpfCliente.style.display = "";
                    inputCpfCliente.setAttribute("required", "");
                    campoIdVeiculo.style.display = "none";
                    inputIdVeiculo.removeAttribute("required");
                    inputIdVeiculo.value = "";
                }else if(modoSelecionado === "1") {
                    campoCpfCliente.style.display = "none";
                    inputCpfCliente.removeAttribute("required");
                    campoIdVeiculo.style.display = "";
                    inputIdVeiculo.setAttribute("required", "");
                    inputCpfCliente.value = "";
                }else {
                    campoCpfCliente.style.display = "none";
                    inputCpfCliente.removeAttribute("required");
                    campoIdVeiculo.style.display = "none";
                    inputIdVeiculo.removeAttribute("required");
                    inputIdVeiculo.value = "";
                    inputCpfCliente.value = "";
                }
            }
            
            function limpaForm() {
                //É necessário uma função ao invés
                //do reset convencional nesse caso
                //por conta do campo "modoConsulta"
                event.preventDefault();
                document.getElementById("cpfCliente").value = "";
                document.getElementById("idVeiculo").value = "";
            }
        </script>
        
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

                <a href="../alterar/aluguel.jsp" class="operation">
                    Devolver
                </a>

                <a class="operation selected">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="back/consultar_aluguel.jsp" method="post" class="outer">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="0">Por CPF do cliente</option>
                    <option value="1">Por ID do veículo</option>
                    <option value="2">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoCpfCliente">
                <label for="cpfCliente">CPF do cliente <small class="no-select">(buscar por)</small></label><br>
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
                
            <div class="form-input" id="campoIdVeiculo" style="display: none;">
                <label for="idVeiculo">ID do veículo <small class="no-select">(buscar por)</small></label><br>
                <select name="idVeiculo" id="idVeiculo" required>
                    <option value="" disabled selected>Insira o ID do veículo</option>
                    <%
                        Veiculos vei = new Veiculos();
                        List<Veiculos> listaVeiculos = new ArrayList<>();
                        listaVeiculos = vei.consultarVeiculos();
                        
                        int idVeiculoConsulta = 0;

                        String idVei = request.getParameter("idVeiculo");
                        if (idVei != null && !idVei.isEmpty()) {
                            idVeiculoConsulta = Integer.parseInt(idVei);
                        }
                        
                        for(Veiculos v : listaVeiculos) {
                            int    fIdVeiculo = v.getIdVeiculo();
                            String selectedAttribute = (fIdVeiculo==idVeiculoConsulta) ? "selected" : "";
                    %>
                    <option value="<%= fIdVeiculo%>" <%= selectedAttribute %>><%= fIdVeiculo%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Enviar
                </button>
                
                <button type="reset" onclick="limpaForm()">
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