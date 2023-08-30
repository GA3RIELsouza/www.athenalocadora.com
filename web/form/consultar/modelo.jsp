<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Modelos"%>
<%@page import="classes.Marcas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modelos | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        
        <script src="/www.athenalocadora.com/js/jquery-1.2.6.pack.js"></script>
        <script src="/www.athenalocadora.com/js/jquery.maskedinput-1.1.4.pack.js"></script>
        <script>
                function scriptModoConsulta() {
                var campoIdModelo   = document.getElementById("campoIdModelo");
                var inputIdModelo   = document.getElementById("idModelo");
                var campoIdMarca    = document.getElementById("campoIdMarca");
                var inputIdMarca    = document.getElementById("idMarca");
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
                    campoIdMarca.style.display = "";
                    inputIdMarca.setAttribute("required", "");
                    inputIdModelo.value = "";
                }else {
                    campoIdModelo.style.display = "none";
                    inputIdModelo.removeAttribute("required");
                    campoIdMarca.style.display = "none";
                    inputIdMarca.removeAttribute("required");
                    inputIdMarca.value = "";
                    inputIdModelo.value = "";
                }
            }
            
            function limpaForm() {
                //É necessário uma função ao invés
                //do reset convencional nesse caso
                //por conta do campo "modoConsulta"
                event.preventDefault();
                document.getElementById("idModelo").value = "";
                document.getElementById("idMarca").value  = "";
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

            <div class="operation-selector">

                <a href="../incluir/modelo.jsp" class="operation">
                    Incluir
                </a>

                <a href="../excluir/modelo.jsp" class="operation">
                    Excluir
                </a>

                <a href="../alterar/modelo.jsp" class="operation">
                    Alterar
                </a>

                <a class="operation selected">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="back/consultar_modelo.jsp" method="post" class="outer">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="0">Por ID do modelo</option>
                    <option value="1">Por ID da marca</option>
                    <option value="2">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoIdModelo">
                <label for="idModelo">ID do modelo <small class="no-select">(buscar por)</small></label><br>
                <select name="idModelo" id="idModelo" required>
                    <option value="" disabled selected>Insira o ID do modelo</option>
                    <%
                        Modelos mod1 = new Modelos();
                        List<Modelos> listaModelos = new ArrayList<>();
                        listaModelos = mod1.consultarExcluirConsultar();
                        
                        for(Modelos m : listaModelos) {
                            int    fIdModelo = m.getIdModelo();
                    %>
                    <option value="<%= fIdModelo%>"><%= fIdModelo%></option>
                    <%
                        }
                    %>
                </select>
            </div>
                
                <div class="form-input" id="campoIdMarca" style="display: none;">
                <label for="idMarca">ID da marca <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca">
                    <option value="" disabled selected>Insira o ID da marca</option>
                    <%
                        Marcas mar = new Marcas();
                        List<Marcas> listaMarcas = new ArrayList<>();
                        listaMarcas = mar.consultarMarcas();
                        
                        int idMarcaConsulta = 0;

                        String idMar = request.getParameter("idMar");
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