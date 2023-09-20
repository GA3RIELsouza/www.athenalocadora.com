<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Modelos"%>
<%@page import="classes.Marcas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modelos | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        <%@include file="/include/theme.jsp"%>
        
        <script>
            function scriptModoConsulta() {
                var campoIdModelo   = document.getElementById("campoIdModelo");
                var inputIdModelo   = document.getElementById("idModelo4");
                var campoIdMarca    = document.getElementById("campoIdMarca");
                var inputIdMarca    = document.getElementById("idMarca4");
                var modoSelecionado = document.getElementById("modoConsulta").value;
                
                if(modoSelecionado === "0") {
                    campoIdModelo.style.display = "";
                    inputIdModelo.setAttribute("required", "");
                    campoIdMarca.style.display = "none";
                    inputIdMarca.removeAttribute("required");
                    inputIdMarca.value = "";
                }else if(modoSelecionado === "1") {
                    campoIdModelo.style.display = "none";
                    inputIdModelo.removeAttribute("required");
                    inputIdModelo.value = "";
                    campoIdMarca.style.display = "";
                    inputIdMarca.setAttribute("required", "");
                }else {
                    campoIdModelo.style.display = "none";
                    inputIdModelo.removeAttribute("required");
                    inputIdModelo.value = "";
                    campoIdMarca.style.display = "none";
                    inputIdMarca.removeAttribute("required");
                    inputIdMarca.value = "";
                }
            }
            
            function limpaForm() {
                campoIdModelo.style.display = "none";
                campoIdMarca.style.display  = "none";
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
                    Modelos
                </h1>
            </div>

            <%@include file="/include/operation_selector.html"%>
            
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="incluir_modelo.jsp" method="post" class="outer" id="form_incluir">
            
            <%
                if(true) {
                    String operacao = "Incluir";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="idMarca">Marca</label><br>
                <select name="idMarca" id="idMarca" required>
                    <option value="" disabled selected>Informe a marca</option>
                    <%
                        Modelos mar = new Modelos();
                        List<Marcas> listaMarcas = new ArrayList<>();
                        listaMarcas = mar.selectMarcas();

                        for(Marcas m : listaMarcas) {
                            int    fIdMarca   = m.getIdMarca();
                            String fNomeMarca = m.getNomeMarca();
                    %>
                    <option value="<%= fIdMarca%>"><%= fNomeMarca%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input">
                <label for="nomeModelo">Nome</label><br>
                <input type="text" id="nomeModelo" name="nomeModelo" placeholder="Informe o nome" maxlength="30" required>
            </div>
                
            <div class="form-input">
                <label for="tipoModelo">Tipo</label><br>
                <select name="tipoModelo" id="tipoModelo" required>
                    <option value="" disabled selected>Informe o tipo</option>
                    <option value="Carro">Carro</option>
                    <option value="Moto">Moto</option>
                    <option value="Caminhonete">Caminhonete</option>
                    <option value="Caminhão">Caminhão</option>
                </select>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Incluir
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
        </form>
                
        <form action="alterar_modelo.jsp" method="post" class="outer" id="form_alterar">
            
            <%
                if(true) {
                    String operacao = "Alterar";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="idModelo">ID do modelo <small class="no-select">(buscar por)</small></label><br>
                <select name="idModelo" id="idModelo" required>
                    <option value="" disabled selected>Informe o ID do modelo</option>
                    <%
                        Modelos mod2 = new Modelos();
                        List<Modelos> listaModelos = new ArrayList<>();
                        listaModelos = mod2.selectExAltCon();
                        
                        int idModeloConsulta = 0;

                        String idMod = request.getParameter("idModeloAlterar");
                        if (idMod != null && !idMod.isEmpty()) {
                            idModeloConsulta = Integer.parseInt(idMod);
                        }
                        
                        for(Modelos m : listaModelos) {
                            int    fIdModelo = m.getIdModelo();
                            String selectedAttribute = (fIdModelo==idModeloConsulta) ? "selected" : "";
                    %>
                    <option value="<%= fIdModelo%>" <%= selectedAttribute %>><%= fIdModelo%></option>
                    <%
                        }
                    %>
                </select>
            </div>
                
            <div class="form-input">
                <label for="idMarca">Marca <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca" required>
                    <option value="" disabled selected>Informe a marca</option>
                    <%
                        List<Marcas> listaMarcas2 = new ArrayList<>();
                        listaMarcas2 = mar.selectMarcas();
                        
                        int idMarcaConsulta = 0;

                        String idMar = request.getParameter("idMarcaAlterar");
                        if (idMar != null && !idMar.isEmpty()) {
                            idMarcaConsulta = Integer.parseInt(idMar);
                        }

                        for(Marcas m : listaMarcas2) {
                            int    fIdMarca   = m.getIdMarca();
                            String fNomeMarca = m.getNomeMarca();
                            String selectedAttribute = (fIdMarca==idMarcaConsulta) ? "selected" : "";
                    %>
                    <option value="<%= fIdMarca%>" <%= selectedAttribute %>><%= fNomeMarca%></option>
                    <%
                        }
                    %>
                </select>
            </div>
                
            <div class="form-input">
                <label for="nomeModelo">Nome</label><br>
                <input type="text" id="nomeModelo" name="nomeModelo" placeholder="Informe o nome" maxlength="30" value="<%=request.getParameter("nome") != null ? request.getParameter("nome") : ""%>" required>
            </div>
                
            <div class="form-input">
                <label for="tipoModelo">Tipo</label><br>
                <select name="tipoModelo" id="tipoModelo" required>
                    <option value="" disabled selected>Informe o tipo</option>
                    <%
                        String option1 = "Carro";
                        String option2 = "Moto";
                        String option3 = "Caminhonete";
                        String option4 = "Caminhão";
                        
                        String tipoModeloConsulta = request.getParameter("tipo");
                        for(int i = 0; i < 4; i++) {
                            String optionAtual = "";
                            switch(i) {
                                case 0:
                                    optionAtual = option1;
                                break;

                                case 1:
                                    optionAtual = option2;
                                break;

                                case 2:
                                    optionAtual = option3;
                                break;

                                case 3:
                                    optionAtual = option4;
                                break;
                            }
                            String selectedAttribute = (optionAtual.equals(tipoModeloConsulta)  ) ? "selected" : optionAtual + tipoModeloConsulta;
                    %>
                    <option value="<%= optionAtual %>" <%= selectedAttribute %>><%= optionAtual %></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Alterar
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
        </form>
                
        <form action="excluir_modelo.jsp" method="post" class="outer" id="form_excluir">
            
            <%
                if(true) {
                    String operacao = "Excluir";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="idModelo">ID do modelo <small class="no-select">(buscar por)</small></label><br>
                <select name="idModelo" id="idModelo" required>
                    <option value="" disabled selected>Informe o ID do modelo</option>
                    <%
                        Modelos mod = new Modelos();
                        List<Modelos> listaModelos3 = new ArrayList<>();
                        listaModelos3 = mod.selectExAltCon();
                        
                        int idModeloConsulta3 = 0;

                        String idMod3 = request.getParameter("idModeloExcluir");
                        if (idMod3 != null && !idMod3.isEmpty()) {
                            idModeloConsulta3 = Integer.parseInt(idMod3);
                        }
                        
                        for(Modelos m : listaModelos3) {
                            int    fIdModelo = m.getIdModelo();
                            String selectedAttribute = (fIdModelo==idModeloConsulta3) ? "selected" : "";
                    %>
                    <option value="<%= fIdModelo%>" <%= selectedAttribute %>><%= fIdModelo%></option>
                    <%
                        }
                    %>
                </select>
            </div>
                
            <div class="form-input">
                <label for="idMarca">Marca <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca" required>
                    <option value="" disabled selected>Informe a marca</option>
                    <%
                        Modelos mar3 = new Modelos();
                        List<Marcas> listaMarcas3 = new ArrayList<>();
                        listaMarcas3 = mar3.selectMarcas();
                        
                        int idMarcaConsulta3 = 0;

                        String idMar3 = request.getParameter("idMarcaExcluir");
                        if (idMar3 != null && !idMar3.isEmpty()) {
                            idMarcaConsulta3 = Integer.parseInt(idMar3);
                        }

                        for(Marcas m : listaMarcas3) {
                            int    fIdMarca   = m.getIdMarca();
                            String fNomeMarca = m.getNomeMarca();
                            String selectedAttribute = (fIdMarca==idMarcaConsulta3) ? "selected" : "";
                    %>
                    <option value="<%= fIdMarca%>" <%= selectedAttribute %>><%= fNomeMarca%></option>
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
                
        <form action="consultar_modelo.jsp" method="post" class="outer" id="form_consultar">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="" disabled selected>Informe o modo de consulta</option>
                    <option value="0">Por ID do modelo</option>
                    <option value="1">Por ID da marca</option>
                    <option value="2">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoIdModelo" style="display: none;">
                <label for="idModelo4">ID do modelo <small class="no-select">(buscar por)</small></label><br>
                <select name="idModelo" id="idModelo4" required>
                    <option value="" disabled selected>Informe o ID do modelo</option>
                    <%
                        Modelos mod4 = new Modelos();
                        List<Modelos> listaModelos4 = new ArrayList<>();
                        listaModelos4 = mod4.selectExAltCon();
                        
                        for(Modelos m : listaModelos4) {
                            int    fIdModelo = m.getIdModelo();
                    %>
                    <option value="<%= fIdModelo%>"><%= fIdModelo%></option>
                    <%
                        }
                    %>
                </select>
            </div>
                
                <div class="form-input" id="campoIdMarca" style="display: none;">
                <label for="idMarca4">ID da marca <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca4">
                    <option value="" disabled selected>Informe o ID da marca</option>
                    <%
                        Marcas mar4 = new Marcas();
                        List<Marcas> listaMarcas4 = new ArrayList<>();
                        listaMarcas4 = mar4.consultarMarcas();
                        
                        int idMarcaConsulta4 = 0;

                        String idMar4 = request.getParameter("idMar");
                        if (idMar4 != null && !idMar4.isEmpty()) {
                            idMarcaConsulta4 = Integer.parseInt(idMar4);
                        }
                        
                        for(Marcas m : listaMarcas4) {
                            int    fIdMarca = m.getIdMarca();
                            String selectedAttribute = (fIdMarca==idMarcaConsulta4) ? "selected" : "";
                    %>
                    <option value="<%= fIdMarca%>" <%= selectedAttribute %>><%= fIdMarca%></option>
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