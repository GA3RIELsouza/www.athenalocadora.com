<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Marcas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Marcas | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        
        <script>
            function scriptModoConsulta() {
                var campoId         = document.getElementById("campoId");
                var inputId         = document.getElementById("idMarca4");
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
                //É necessário uma função ao invés
                //do reset convencional nesse caso
                //por conta do campo "modoConsulta"
                event.preventDefault();
                document.getElementById("idMarca").value = "";
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
                    Marcas
                </h1>
            </div>

            <%@include file="/include/operation_selector.html"%>
            
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="incluir_marca.jsp" method="post" class="outer" id="form_incluir">
            
            <%
                if(true) {
                    String operacao = "Incluir";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="nomeMarca">Nome</label><br>
                <input type="text" id="nomeMarca" name="nomeMarca" placeholder="Insira o nome" maxlength="30" required>
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
            
        <form action="alterar_marca.jsp" method="post" class="outer" id="form_alterar">
            
            <%
                if(true) {
                    String operacao = "Alterar";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="idMarca">ID <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca" required>
                    <option value="" disabled selected>Insira o ID</option>
                    <%
                        Marcas mar = new Marcas();
                        List<Marcas> listaMarcas = new ArrayList<>();
                        listaMarcas = mar.consultarMarcas();
                        
                        int idMarcaConsulta = 0;

                        String idMar = request.getParameter("idAlterar");
                        if (idMar != null && !idMar.isEmpty()) {
                            idMarcaConsulta = Integer.parseInt(idMar);
                        }
                        
                        for(Marcas m : listaMarcas) {
                            int    fIdMarca = m.getIdMarca();
                            String selectedAttribute = (fIdMarca==idMarcaConsulta) ? "selected" : "";
                    %>
                    <option value="<%= fIdMarca%>" <%= selectedAttribute %>><%= fIdMarca%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input">
                <label for="nomeMarca">Nome</label><br>
                <input type="text" id="nomeMarca" name="nomeMarca" placeholder="Insira o nome" maxlength="30" value="<%=request.getParameter("nome") != null ? request.getParameter("nome") : ""%>" required>
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
            
        <form action="excluir_marca.jsp" method="post" class="outer" id="form_excluir">
            
            <%
                if(true) {
                    String operacao = "Excluir";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="idMarca">ID <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca" required>
                    <option value="" disabled selected>Insira o ID</option>
                    <%
                        List<Marcas> listaMarcas3 = new ArrayList<>();
                        listaMarcas3 = mar.consultarMarcas();
                        
                        int idMarcaConsulta3 = 0;

                        String idMar3 = request.getParameter("idExcluir");
                        if (idMar3 != null && !idMar3.isEmpty()) {
                            idMarcaConsulta3 = Integer.parseInt(idMar3);
                        }
                        
                        for(Marcas m : listaMarcas3) {
                            int    fIdMarca = m.getIdMarca();
                            String selectedAttribute = (fIdMarca==idMarcaConsulta3) ? "selected" : "";
                    %>
                    <option value="<%= fIdMarca%>" <%= selectedAttribute %>><%= fIdMarca%></option>
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
                
        <form action="consultar_marca.jsp" method="post" class="outer" id="form_consultar">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="0">Por ID</option>
                    <option value="1">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoId">
                <label for="idMarca4">ID <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca4" required>
                    <option value="" disabled selected>Insira o ID</option>
                    <%
                        List<Marcas> listaMarcas4 = new ArrayList<>();
                        listaMarcas4 = mar.consultarMarcas();
                        
                        for(Marcas m : listaMarcas4) {
                            int    fIdMarca = m.getIdMarca();
                    %>
                    <option value="<%= fIdMarca%>"><%= fIdMarca%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Confirmar
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
            
        <%@include file="/include/theme.html"%>
        
    </body>
    
</html>