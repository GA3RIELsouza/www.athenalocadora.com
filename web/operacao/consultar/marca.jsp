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
        
        <script src="/www.athenalocadora.com/js/jquery-1.2.6.pack.js"></script>
        <script src="/www.athenalocadora.com/js/jquery.maskedinput-1.1.4.pack.js"></script>
        <script>
            function scriptModoConsulta() {
                var campoId         = document.getElementById("campoId");
                var inputId         = document.getElementById("idMarca");
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

            <div class="operation-selector">

                <a href="../incluir/marca.jsp" class="operation">
                    Incluir
                </a>

                <a href="../excluir/marca.jsp" class="operation">
                    Excluir
                </a>

                <a href="../alterar/marca.jsp" class="operation">
                    Alterar
                </a>

                <a class="operation selected">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="b/consultar_marca.jsp" method="post" class="outer">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="0">Por ID</option>
                    <option value="1">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoId">
                <label for="idMarca">ID <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca" required>
                    <option value="" disabled selected>Insira o ID</option>
                    <%
                        Marcas mar = new Marcas();
                        List<Marcas> listaMarcas = new ArrayList<>();
                        listaMarcas = mar.consultarMarcas();
                        
                        for(Marcas m : listaMarcas) {
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