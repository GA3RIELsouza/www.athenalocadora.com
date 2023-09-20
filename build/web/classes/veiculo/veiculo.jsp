<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Veiculos"%>
<%@page import="classes.Marcas"%>
<%@page import="classes.Modelos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Veículos | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        <%@include file="/include/theme.jsp"%>
        
        <script src="/www.athenalocadora.com/js/jquery-1.2.6.pack.js"></script>
        <script src="/www.athenalocadora.com/js/jquery.maskedinput-1.1.4.pack.js"></script>
        <script>
            $(document).ready(function(){
                $("#placaVeiculoC1").mask("aaa-9999");
                $("#placaVeiculoM1").mask("aaa9a99");
                $("#placaVeiculoC2").mask("aaa-9999");
                $("#placaVeiculoM2").mask("aaa9a99");
            });
            
            function mudaPlaca(number) {
                campoPlacaCinza    = document.getElementById("campoPlacaCinza" + number);
                inputPlacaCinza    = document.getElementById("placaVeiculoC" + number);
                campoPlacaMercosul = document.getElementById("campoPlacaMercosul" + number);
                inputPlacaMercosul = document.getElementById("placaVeiculoM" + number);
                inputTipoPlaca     = document.getElementById("tipoPlacaVeiculo" + number);
                
                if(inputTipoPlaca.value === "Cinza") {
                    campoPlacaCinza.style.display = "";
                    inputPlacaCinza.setAttribute("required", "");
                    campoPlacaMercosul.style.display = "none";
                    inputPlacaMercosul.removeAttribute("required");
                    inputPlacaMercosul.value = "";
                }else if(inputTipoPlaca.value === "Mercosul"){
                    campoPlacaCinza.style.display = "none";
                    inputPlacaCinza.removeAttribute("required");
                    inputPlacaCinza.value = "";
                    campoPlacaMercosul.style.display = "";
                    inputPlacaMercosul.setAttribute("required", "");
                }
            }
            
            function scriptModoConsulta() {
                var campoId         = document.getElementById("campoId");
                var inputId         = document.getElementById("idVeiculo4");
                var modoSelecionado = document.getElementById("modoConsulta").value;
                
                if(modoSelecionado === "0") {
                    campoId.style.display = "";
                    inputId.setAttribute("required", "");
                }else {
                    campoId.style.display = "none";
                    inputId.removeAttribute("required");
                    inputId.value = "";
                }
            }
            
            function limpaForm() {
                campoId.style.display = "none";
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
                    Veículos
                </h1>
            </div>

            <%@include file="/include/operation_selector.html"%>
            
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="incluir_veiculo.jsp" method="post" class="outer" id="form_incluir">
            
            <%
                if(true) {
                    String operacao = "Incluir";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="marcaModelo">Modelo</label><br>
                <select name="marcaModelo" id="marcaModelo" required>
                    <option value="" disabled selected>Informe o modelo</option>
                    <%
                        Veiculos mod = new Veiculos();
                        List<Modelos> listaModelos = new ArrayList<>();
                        listaModelos = mod.selectModelos();

                        for(Modelos m : listaModelos) {
                            int    fIdModelo   = m.getIdModelo();
                            String fNomeModelo = m.getNomeModelo();
                            int    fIdMarca    = m.getIdMarca();
                            
                            Marcas mar = new Marcas();
                            mar.setIdMarca(fIdMarca);

                            mar = mar.consultarMarca();

                            if(mar != null) {
                                String fNomeMarca = mar.getNomeMarca();
                    %>
                    <option value="<%= fIdMarca + "-" + fIdModelo%>"><%= fNomeMarca + " " + fNomeModelo%></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
                
            <div class="form-input">
                <label for="tipoPlacaVeiculo1">Tipo de placa</label><br>
                <select name="tipoPlacaVeiculo" id="tipoPlacaVeiculo1" onchange="mudaPlaca(1)" required>
                    <option value="" disabled selected>Informe o tipo de placa</option>
                    <option value="Cinza">Cinza</option>
                    <option value="Mercosul">Mercosul</option>
                </select>
            </div>
            
            <div class="form-input" id="campoPlacaCinza1" style="display: none;">
                <label for="placaVeiculoC1">Placa</label><br>
                <input type="text" id="placaVeiculoC1" name="placaVeiculo" placeholder="Informe a placa" minlength="7" maxlength="7" pattern="[a-zA-Z0-9-]{7}" title="Apenas letras e números">
            </div>
            
            <div class="form-input" id="campoPlacaMercosul1" style="display: none;">
                <label for="placaVeiculoM1">Placa</label><br>
                <input type="text" id="placaVeiculoM1" name="placaVeiculo" placeholder="Informe a placa" minlength="7" maxlength="7" pattern="[a-zA-Z0-9-]{7}" title="Apenas letras e números">
            </div>
            
            <div class="form-input">
                <label for="corPredominante">Cor predominante</label><br>
                <input type="list" list="listaCores" id="corPredominante" name="corPredominante" placeholder="Informe a cor predominante" maxlength="15" required>
                <datalist id="listaCores">
                  <option value="Branco"></option>
                  <option value="Preto"></option>
                  <option value="Cinza"></option>
                  <option value="Prata"></option>
                  <option value="Vermelho"></option>
                  <option value="Azul"></option>
                  <option value="Verde"></option>
                  <option value="Amarelo"></option>
                  <option value="Laranja"></option>
                  <option value="Rosa"></option>
                  <option value="Roxo"></option>
                  <option value="Ciano"></option>
                  <option value="Marrom"></option>
                </datalist>
            </div>
            
            <div class="form-input">
                <label for="anoFabricacao">Ano de fabricação</label><br>
                <input type="number" step="1" pattern="\d+" id="anoFabricacao" name="anoFabricacao" placeholder="Informe o ano de fabricação" min="1886" max="2147483647" required>
            </div>
            
            <div class="form-input">
                <input type="checkbox" id="disponivel" name="disponivel" value="true">
                <label for="disponivel">Disponível</label>
            </div><br>
            
            <div class="form-input">
                <input type="checkbox" id="temArCondicionado" name="temArCondicionado" value="true">
                <label for="temArCondicionado">Ar condicionado</label>
            </div><br class="noselect">
            
            <div class="form-input">
                <input type="checkbox" id="temDirHidraulica" name="temDirHidraulica" value="true">
                <label for="temDirHidraulica">Direção hidráulica</label>
            </div><br class="noselect">
            
            <div class="form-input">
                <input type="checkbox" id="revisado" name="revisado" value="true">
                <label for="revisado">Revisado</label>
            </div><br class="noselect">
            
            <div class="form-button">
                <button type="submit">
                    Incluir
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
            
        </form>
                
        <form action="alterar_veiculo.jsp" method="post" class="outer" id="form_alterar">
            
            <%
                if(true) {
                    String operacao = "Alterar";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="idVeiculo2">ID <small class="no-select">(buscar por)</small></label><br>
                <select name="idVeiculo" id="idVeiculo2" required>
                    <option value="" disabled selected>Informe o ID do veículo</option>
                    <%
                        Veiculos vei = new Veiculos();
                        List<Veiculos> listaVeiculos = new ArrayList<>();
                        listaVeiculos = vei.consultarVeiculos();
                        
                        int idVeiculoConsulta = 0;

                        String idVei = request.getParameter("idAlterar");
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
                <label for="marcaModelo">Modelo</label><br>
                <select name="marcaModelo" id="marcaModelo" required>
                    <option value="" disabled selected>Informe o modelo</option>
                    <%
                        List<Modelos> listaModelos2 = new ArrayList<>();
                        listaModelos2 = mod.selectModelos();

                        String marModConsulta = request.getParameter("marcaModelo");

                        for(Modelos m : listaModelos2) {
                            int    fIdModelo   = m.getIdModelo();
                            String fNomeModelo = m.getNomeModelo();
                            int    fIdMarca    = m.getIdMarca();
                            
                            Marcas mar = new Marcas();
                            mar.setIdMarca(fIdMarca);

                            mar = mar.consultarMarca();

                            if(mar != null) {
                                String fNomeMarca = mar.getNomeMarca();
                                String idMarcaModelo = (fIdMarca + "-" + fIdModelo);
                                String selectedAttribute = (idMarcaModelo.equals(marModConsulta)) ? "selected" : "";
                    %>
                    <option value="<%= idMarcaModelo%>" <%= selectedAttribute%>><%= fNomeMarca + " " + fNomeModelo%></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input">
                <label for="tipoPlacaVeiculo2">Tipo de placa</label><br>
                <select name="tipoPlacaVeiculo" id="tipoPlacaVeiculo2" onchange="mudaPlaca(2)" required>
                    <option value="" disabled selected>Informe o tipo de placa</option>
                    <%
                        String tipoPlacaConsulta = request.getParameter("tipoPlaca");
                        String cinzaSelected;
                        String mercoSelected;
                        
                        if(tipoPlacaConsulta != null) {
                            cinzaSelected = (tipoPlacaConsulta.equals("Cinza")) ? "selected" : "";
                            mercoSelected = (tipoPlacaConsulta.equals("Mercosul")) ? "selected" : "";
                        }else {
                            cinzaSelected = "";
                            mercoSelected = "";
                        }
                        
                    %>
                    <option value="Cinza" <%= cinzaSelected%>>Cinza</option>
                    <option value="Mercosul"<%= mercoSelected%>>Mercosul</option>
                </select>
            </div>
            
            <div class="form-input" id="campoPlacaCinza2" style="display: none;">
                <label for="placaVeiculoC2">Placa</label><br>
                <input type="text" id="placaVeiculoC2" name="placaVeiculo" placeholder="Informe a placa" minlength="7" maxlength="7" pattern="[a-zA-Z0-9-]{7}" title="Apenas letras e números" value="<%=request.getParameter("corPredominante") != null ? request.getParameter("placa") : ""%>">
            </div>
                
            <div class="form-input" id="campoPlacaMercosul2" style="display: none;">
                <label for="placaVeiculoM2">Placa</label><br>
                <input type="text" id="placaVeiculoM2" name="placaVeiculo" placeholder="Informe a placa" minlength="7" maxlength="7" pattern="[a-zA-Z0-9-]{7}" title="Apenas letras e números" value="<%=request.getParameter("corPredominante") != null ? request.getParameter("placa") : ""%>">
            </div>
            
            <div class="form-input">
                <label for="corPredominante">Cor predominante</label><br>
                <input type="list" list="listaCores" id="corPredominante" name="corPredominante" placeholder="Informe a cor predominante" maxlength="15" value="<%=request.getParameter("corPredominante") != null ? request.getParameter("corPredominante") : ""%>" required>
                <datalist id="listaCores">
                  <option value="Branco"></option>
                  <option value="Preto"></option>
                  <option value="Cinza"></option>
                  <option value="Prata"></option>
                  <option value="Vermelho"></option>
                  <option value="Azul"></option>
                  <option value="Verde"></option>
                  <option value="Amarelo"></option>
                  <option value="Laranja"></option>
                  <option value="Rosa"></option>
                  <option value="Roxo"></option>
                  <option value="Ciano"></option>
                  <option value="Marrom"></option>
                </datalist>
            </div>
            
            <div class="form-input">
                <label for="anoFabricacao">Ano de fabricação</label><br>
                <input type="number" step="1" pattern="\d+" id="anoFabricacao" name="anoFabricacao" placeholder="Informe o ano de fabricação" min="1886" max="2023" value="<%=request.getParameter("anoFabricacao") != null ? request.getParameter("anoFabricacao") : ""%>" required>
            </div>
            
            <div class="form-input">
                <input type="checkbox" id="disponivel" name="disponivel" value="true" <%=request.getParameter("disponivel") != null && request.getParameter("disponivel").equals("true") ? "checked" : ""%>>
                <label for="disponivel">Disponível</label>
            </div><br>
            
            <div class="form-input">
                <input type="checkbox" id="temArCondicionado" name="temArCondicionado" value="true" <%=request.getParameter("arCondicionado") != null && request.getParameter("arCondicionado").equals("true") ? "checked" : ""%>>
                <label for="temArCondicionado">Ar condicionado</label>
            </div><br>
            
            <div class="form-input">
                <input type="checkbox" id="temDirHidraulica" name="temDirHidraulica" value="true" <%=request.getParameter("dirHidraulica") != null && request.getParameter("dirHidraulica").equals("true") ? "checked" : ""%>>
                <label for="temDirHidraulica">Direção hidráulica</label>
            </div><br>
            
            <div class="form-input">
                <input type="checkbox" id="revisado" name="revisado" value="true" <%=request.getParameter("revisado") != null && request.getParameter("revisado").equals("true") ? "checked" : ""%>>
                <label for="revisado">Revisado</label>
            </div><br>
            
            <div class="form-button">
                <button type="submit">
                    Alterar
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
        </form>
                
        <form action="excluir_veiculo.jsp" method="post" class="outer" id="form_excluir">
            
            <%
                if(true) {
                    String operacao = "Excluir";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="idVeiculo3">ID <small class="no-select">(buscar por)</small></label><br>
                <select name="idVeiculo" id="idVeiculo3" required>
                    <option value="" disabled selected>Informe o ID do veículo</option>
                    <%
                        List<Veiculos> listaVeiculos3 = new ArrayList<>();
                        listaVeiculos3 = vei.consultarVeiculos();
                        
                        int idVeiculoConsulta3 = 0;

                        String idVei3 = request.getParameter("idExcluir");
                        if (idVei3 != null && !idVei3.isEmpty()) {
                            idVeiculoConsulta3 = Integer.parseInt(idVei3);
                        }
                        
                        for(Veiculos v : listaVeiculos3) {
                            int    fIdVeiculo = v.getIdVeiculo();
                            String selectedAttribute = (fIdVeiculo==idVeiculoConsulta3) ? "selected" : "";
                    %>
                    <option value="<%= fIdVeiculo%>" <%= selectedAttribute %>><%= fIdVeiculo%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Excluir
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
        </form>
                
        <form action="consultar_veiculo.jsp" method="post" class="outer" id="form_consultar">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="" disabled selected>Informe o modo de consulta</option>
                    <option value="0">Por ID</option>
                    <option value="1">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoId" style="display: none;">
                <label for="idVeiculo4">ID <small class="no-select">(buscar por)</small></label><br>
                <select name="idVeiculo" id="idVeiculo4" required>
                    <option value="" disabled selected>Informe o ID do veículo</option>
                    <%
                        List<Veiculos> listaVeiculos4 = new ArrayList<>();
                        listaVeiculos4 = vei.consultarVeiculos();
                        
                        int idVeiculoConsulta4 = 0;

                        String idMod = request.getParameter("idMod");
                        if (idMod != null && !idMod.isEmpty()) {
                            idVeiculoConsulta4 = Integer.parseInt(idMod);
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