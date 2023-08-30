<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Veiculos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Veículos | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        
        <script>
            function scriptModoConsulta() {
                var campoId         = document.getElementById("campoId");
                var inputId         = document.getElementById("idVeiculo");
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
                    Veículos
                </h1>
            </div>

            <div class="operation-selector">

                <a href="../incluir/veiculo.jsp" class="operation">
                    Incluir
                </a>

                <a href="../excluir/veiculo.jsp" class="operation">
                    Excluir
                </a>

                <a href="../alterar/veiculo.jsp" class="operation">
                    Alterar
                </a>

                <a class="operation selected">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="back/consultar_veiculo.jsp" method="post" class="outer">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="0">Por ID</option>
                    <option value="1">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoId">
                <label for="idVeiculo">ID <small class="no-select">(buscar por)</small></label><br>
                <select name="idVeiculo" id="idVeiculo" required>
                    <option value="" disabled selected>Insira o ID do veículo</option>
                    <%
                        Veiculos vei = new Veiculos();
                        List<Veiculos> listaVeiculos = new ArrayList<>();
                        listaVeiculos = vei.consultarVeiculos();
                        
                        int idVeiculoConsulta = 0;

                        String idMod = request.getParameter("idMod");
                        if (idMod != null && !idMod.isEmpty()) {
                            idVeiculoConsulta = Integer.parseInt(idMod);
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