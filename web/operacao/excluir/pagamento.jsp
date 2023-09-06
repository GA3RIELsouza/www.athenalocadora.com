<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Pagamentos"%>
<%@page import="classes.Alugueis"%>
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

                <a class="operation selected">
                    Excluir
                </a>

                <a href="../alterar/pagamento.jsp" class="operation">
                    Alterar
                </a>

                <a href="../consultar/pagamento.jsp" class="operation">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="b/excluir_pagamento.jsp" method="post" class="outer">
            
            <div class="sucesso" id="sucesso">
                <%
                    if(request.getParameter("sucesso") != null)         
                        out.write(request.getParameter("sucesso"));
                %>
            </div>
            
            <div class="erro" id="erro">
                <%
                    if(request.getParameter("erro") != null)         
                        out.write(request.getParameter("erro"));
                %>
            </div>
            
            <div class="form-input">
                <label for="idPagamento">ID do pagamento <small class="no-select">(buscar por)</small></label><br>
                <select name="idPagamento" id="idPagamento" required>
                    <option value="" disabled selected>Insira o ID do pagamento</option>
                    <%
                        Pagamentos pag = new Pagamentos();
                        List<Pagamentos> listaPagamentos = new ArrayList<>();
                        listaPagamentos = pag.selectExcluirAlterarConsultar();
                        
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
            
            <div class="form-input">
                <label for="idAluguel">ID do aluguel <small class="no-select">(buscar por)</small></label><br>
                <select name="idAluguel" id="idAluguel" required>
                    <option value="" disabled selected>Insira o ID do aluguel</option>
                    <%
                        Alugueis alu = new Alugueis();
                        List<Alugueis> listaAlugueis = new ArrayList<>();
                        listaAlugueis = alu.consultarAlugueis();
                        
                        int idAluguelConsulta = 0;

                        String idAlu = request.getParameter("idAluguel");
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
            
            <div class="form-button">
                <button type="submit">
                    Confirmar
                </button>
                
                <button type="reset">
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