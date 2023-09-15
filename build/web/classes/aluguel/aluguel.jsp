<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Veiculos"%>
<%@page import="classes.Alugueis"%>
<%@page import="classes.Clientes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Aluguéis | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        <%@include file="/include/theme.jsp"%>
        
        <script src="/www.athenalocadora.com/js/placeholder-datetime.js"></script>
        <script>
            function scriptModoConsulta() {
                var campoCpfCliente = document.getElementById("campoCpfCliente");
                var inputCpfCliente = document.getElementById("cpfCliente4");
                var campoIdVeiculo  = document.getElementById("campoIdVeiculo");
                var inputIdVeiculo  = document.getElementById("idVeiculo4");
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
                    inputCpfCliente.value = "";
                    campoIdVeiculo.style.display = "";
                    inputIdVeiculo.setAttribute("required", "");
                }else {
                    campoCpfCliente.style.display = "none";
                    inputCpfCliente.removeAttribute("required");
                    inputCpfCliente.value = "";
                    campoIdVeiculo.style.display = "none";
                    inputIdVeiculo.removeAttribute("required");
                    inputIdVeiculo.value = "";
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
        
        <%@include file="/include/header.html"%>
        
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        
        <span class="outer">
            
            <div class="title-form">
                <h1>
                    Aluguéis
                </h1>
            </div>

            <%@include file="/include/operation_selector.html"%>
            
        </span>
        
        <div class="vertical-space"></div>
        
        <form action="incluir_aluguel.jsp" method="post" class="outer" onreset="resetPlaceholder()" id="form_incluir">
            
            <%
                if(true) {
                    String operacao = "Incluir";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="idVeiculo">ID do veículo</label><br>
                <select name="idVeiculo" id="idVeiculo" required>
                    <option value="" disabled selected>Insira o ID do veículo</option>
                    <%
                        Veiculos vei = new Veiculos();
                        List<Veiculos> listaVeiculos = new ArrayList<>();
                        listaVeiculos = vei.consultarVeiculos();
                        
                        int idVeiculoConsulta = 0;

                        String idVei = request.getParameter("id");
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
                <label for="dataAluguel1">Data de início</label><br>
                <input type="datetime-local" id="dataAluguel1" name="dataAluguel" oninput="placeholderDatetime()" required>
            </div>
            
            <div class="form-input">
                <label for="dataDevolucao1">Data de devolução <small class="no-select">(campo não obrigatório)</small></label><br>
                <input type="datetime-local" id="dataDevolucao1" name="dataDevolucao" oninput="placeholderDatetime()">
            </div>
            
            <div class="form-input">
                <label for="dataEstimadaDevolucao1">Data estimada de devolução</label><br>
                <input type="datetime-local" id="dataEstimadaDevolucao1" name="dataEstimadaDevolucao" oninput="placeholderDatetime()" required>
            </div>
            
            <div class="form-input">
                <input type="checkbox" id="pagamento" name="pagamento">
                <label for="pagamento">Pagamentos efetuado</label><br>
            </div><br>
            
            <div class="form-button">
                <button type="submit">
                    Incluir
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
        </form>
                
        <form action="alterar_aluguel.jsp" method="post" class="outer" onreset="resetPlaceholder()" id="form_alterar">
            
            <%
                if(true) {
                    String operacao = "Alterar";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="idAluguel">ID do aluguel <small class="no-select">(buscar por)</small></label><br>
                <select name="idAluguel" id="idAluguel" required>
                    <option value="" disabled selected>Insira o ID do aluguel</option>
                    <%
                        Alugueis alu = new Alugueis();
                        List<Alugueis> listaAlugueis = new ArrayList<>();
                        listaAlugueis = alu.consultarAlugueis();
                        
                        int idAluguelConsulta = 0;

                        String idAlu = request.getParameter("idAluguelAlterar");
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
                        Clientes cli2 = new Clientes();
                        List<Clientes> listaClientes2 = new ArrayList<>();
                        listaClientes2 = cli2.consultarClientes();
                        
                        String cpfConsulta2 = request.getParameter("cpfClienteAlterar") != null ? request.getParameter("cpfClienteAlterar") : "";

                        for(Clientes c : listaClientes2) {
                            String fCpfCliente = c.getCpfCliente();
                            String selectedAttribute = fCpfCliente.equals(cpfConsulta2) ? "selected" : "";
                    %>
                    <option value="<%= fCpfCliente%>" <%= selectedAttribute %>><%= fCpfCliente%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input">
                <label for="dataDevolucao">Data de devolução</label><br>
                <input type="datetime-local" id="dataDevolucao2" name="dataDevolucao" value="<%=request.getParameter("dataDevolucao") != null ? request.getParameter("dataDevolucao") : ""%>" oninput="placeholderDatetime()" required>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Devolver
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
        </form>
            
        <form action="excluir_aluguel.jsp" method="post" class="outer" id="form_excluir">
            
            <%
                if(true) {
                    String operacao = "Excluir";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="idAluguel">ID do aluguel <small class="no-select">(buscar por)</small></label><br>
                <select name="idAluguel" id="idAluguel" required>
                    <option value="" disabled selected>Insira o ID do aluguel</option>
                    <%
                        Alugueis alu3 = new Alugueis();
                        List<Alugueis> listaAlugueis3 = new ArrayList<>();
                        listaAlugueis3 = alu3.consultarAlugueis();
                        
                        int idAluguelConsulta3 = 0;

                        String idAlu3 = request.getParameter("idAluguelExcluir");
                        if (idAlu3 != null && !idAlu3.isEmpty()) {
                            idAluguelConsulta3 = Integer.parseInt(idAlu3);
                        }

                        for(Alugueis a : listaAlugueis3) {
                            int fIdAluguel = a.getIdAluguel();
                            String selectedAttribute = fIdAluguel==idAluguelConsulta3 ? "selected" : "";
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
                        Clientes cli3 = new Clientes();
                        List<Clientes> listaClientes3 = new ArrayList<>();
                        listaClientes3 = cli3.consultarClientes();
                        
                        String cpfConsulta3 = request.getParameter("cpfClienteExcluir") != null ? request.getParameter("cpfClienteExcluir") : "";

                        for(Clientes c : listaClientes3) {
                            String fCpfCliente = c.getCpfCliente();
                            String selectedAttribute = fCpfCliente.equals(cpfConsulta3) ? "selected" : "";
                    %>
                    <option value="<%= fCpfCliente%>" <%= selectedAttribute %>><%= fCpfCliente%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Cancelar
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
        </form>
                
        <form action="consultar_aluguel.jsp" method="post" class="outer" id="form_consultar">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="0">Por CPF do cliente</option>
                    <option value="1">Por ID do veículo</option>
                    <option value="2">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoCpfCliente">
                <label for="cpfCliente4">CPF do cliente <small class="no-select">(buscar por)</small></label><br>
                <select name="cpfCliente" id="cpfCliente4" required>
                    <option value="" disabled selected>Insira o CPF do cliente</option>
                    <%
                        Clientes cli4 = new Clientes();
                        List<Clientes> listaClientes4 = new ArrayList<>();
                        listaClientes4 = cli4.consultarClientes();
                        
                        String cpfConsulta4 = request.getParameter("cpf") != null ? request.getParameter("cpf") : "";

                        for(Clientes c : listaClientes4) {
                            String fCpfCliente = c.getCpfCliente();
                            String selectedAttribute = fCpfCliente.equals(cpfConsulta4) ? "selected" : "";
                    %>
                    <option value="<%= fCpfCliente%>" <%= selectedAttribute %>><%= fCpfCliente%></option>
                    <%
                        }
                    %>
                </select>
            </div>
                
            <div class="form-input" id="campoIdVeiculo" style="display: none;">
                <label for="idVeiculo4">ID do veículo <small class="no-select">(buscar por)</small></label><br>
                <select name="idVeiculo" id="idVeiculo4" required>
                    <option value="" disabled selected>Insira o ID do veículo</option>
                    <%
                        Veiculos vei4 = new Veiculos();
                        List<Veiculos> listaVeiculos4 = new ArrayList<>();
                        listaVeiculos4 = vei4.consultarVeiculos();
                        
                        int idVeiculoConsulta4 = 0;

                        String idVei4 = request.getParameter("idVeiculo");
                        if (idVei4 != null && !idVei4.isEmpty()) {
                            idVeiculoConsulta4 = Integer.parseInt(idVei4);
                        }
                        
                        for(Veiculos v : listaVeiculos4) {
                            int    fIdVeiculo = v.getIdVeiculo();
                            String selectedAttribute = (fIdVeiculo==idVeiculoConsulta4) ? "selected" : "";
                    %>
                    <option value="<%= fIdVeiculo%>" <%= selectedAttribute %>><%= fIdVeiculo%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Consultar
                </button>
                
                <button type="reset" onclick="limpaForm()">
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
        
    </body>
    
</html>