<%@page import="classes.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pagamentos | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        
        <script type="text/javascript">
            function scriptModoConsulta() {
                var campoIdPagamento = document.getElementById("campoIdPagamento");
                var inputIdPagamento = document.getElementById("idPagamento");
                var campoIdAluguel   = document.getElementById("campoIdAluguel");
                var inputIdAluguel   = document.getElementById("idAluguel");
                var modoSelecionado  = document.getElementById("modoConsulta").value;
                
                if(modoSelecionado === "0") {
                    campoIdPagamento.style.display = "";
                    campoIdAluguel.style.display = "";
                    inputIdPagamento.setAttribute("required", "");
                    inputIdAluguel.setAttribute("required", "");
                }else {
                    campoIdPagamento.style.display = "none";
                    campoIdAluguel.style.display = "none";
                    inputIdPagamento.removeAttribute("required");
                    inputIdAluguel.removeAttribute("required");
                    inputIdPagamento.value = "";
                    inputIdAluguel.value = "";
                }
            }
            
            function limpaForm() {
                //É necessário uma função ao invés
                //do reset convencional nesse caso
                //por conta do campo "modoConsulta"
                event.preventDefault();
                document.getElementById("idPagamento").value = "";
                document.getElementById("idAluguel").value = "";
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
                    Pagamentos
                </h1>
            </div>

            <div class="operation-selector">

                <a href="../incluir/pagamento.jsp" class="operation">
                    Incluir
                </a>

                <a href="../excluir/pagamento.jsp" class="operation">
                    Excluir
                </a>

                <a href="../alterar/pagamento.jsp" class="operation">
                    Alterar
                </a>

                <a class="operation selected">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="back/consultar_pagamento.jsp" method="post" class="outer">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="0">Por IDs</option>
                    <option value="1">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoIdPagamento">
                <label for="idPagamento">ID do pagamento <small class="no-select">(buscar por)</small></label><br>
                <input type="number" step="1" pattern="\d+" id="idPagamento" name="idPagamento" placeholder="Insira o ID do pagamento" min="1" max="2147483647" required>
            </div>
            
            <div class="form-input" id="campoIdAluguel">
                <label for="idAluguel">ID do aluguel <small>(buscar por)</small></label><br>
                <input type="number" step="1" pattern="\d+" id="idAluguel" name="idAluguel" placeholder="Insira o ID do aluguel" min="1" max="2147483647" required>
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