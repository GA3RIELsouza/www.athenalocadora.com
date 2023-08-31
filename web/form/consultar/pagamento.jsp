<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Pagamentos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pagamentos | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        
        <script>
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
        
        <%@include file="/include/header.html"%>
        
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
        
        <form action="java/consultar_pagamento.jsp" method="post" class="outer">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="0">Por IDs</option>
                    <option value="1">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoIdPagamento">
                <label for="idPagamento">ID do pagamento <small class="no-select">(buscar por)</small></label><br>
                <select name="idPagamento" id="idPagamento" required>
                    <option value="" disabled selected>Insira o ID do aluguel</option>
                    <%
                        Pagamentos pag1 = new Pagamentos();
                        List<Pagamentos> listaPagamentos = new ArrayList<>();
                        listaPagamentos = pag1.consultarPagamentos();
                        
                        int idPagamentoConsulta = 0;

                        String idPag = request.getParameter("idPagamento");
                        if (idPag != null && !idPag.isEmpty()) {
                            idPagamentoConsulta = Integer.parseInt(idPag);
                        }

                        for(Pagamentos p : listaPagamentos) {
                            int fIdPagamento = p.getIdPagamento();
                            String selectedAttribute = fIdPagamento==idPagamentoConsulta ? "selected" : "";
                    %>
                    <option value="<%= fIdPagamento%>" <%= selectedAttribute %>><%= fIdPagamento%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input" id="campoIdAluguel">
                <label for="idAluguel">ID do aluguel <small class="no-select">(buscar por)</small></label><br>
                <select name="idAluguel" id="idAluguel" required>
                    <option value="" disabled selected>Insira o ID do aluguel</option>
                    <%
                        Pagamentos pag2 = new Pagamentos();
                        List<Pagamentos> listaAlugueis = new ArrayList<>();
                        listaAlugueis = pag2.consultarPagamentos();
                        
                        int idAluguelConsulta = 0;

                        String idAlu = request.getParameter("idAluguel");
                        if (idAlu != null && !idAlu.isEmpty()) {
                            idAluguelConsulta = Integer.parseInt(idAlu);
                        }

                        for(Pagamentos p : listaAlugueis) {
                            int fIdAluguel = p.getIdAluguel();
                            String selectedAttribute = fIdAluguel==idAluguelConsulta ? "selected" : "";
                    %>
                    <option value="<%= fIdAluguel%>" <%= selectedAttribute %>><%= fIdAluguel%></option>
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