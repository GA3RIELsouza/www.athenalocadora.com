<%@page import="classes.Usuarios"%>
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

                <a class="operation selected">
                    Alterar
                </a>

                <a href="../consultar/pagamento.jsp" class="operation">
                    Consultar
                </a>

            </div>
        </span>
        
        <div class="vertical-space"></div>
        
        <form action="back/incluir_pagamento.jsp" method="post" class="outer">
            
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
            
            <div class="form-input">
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
            
            <div class="form-input">
                <label for="dataPagamento">Data</label><br>
                <input type="datetime-local" id="dataPagamento" name="dataPagamento" value="<%=request.getParameter("data") != null ? request.getParameter("data") : ""%>" required>
            </div>
            
            <div class="form-input">
                <label for="tipoPagamento">Tipo</label><br>
                <select name="tipoPagamento" id="tipoPagamento" required>
                    <option value="" disabled selected>Insira o tipo</option>
                    <%
                        String option1 = "Dinheiro";
                        String option2 = "Cartão crédito";
                        String option3 = "Cartão débito";
                        String option4 = "PIX";
                        
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
            
            <div class="form-input">
                <label for="vlrPagamento">Valor</label><br>
                <input type="number" step=".01" pattern="^\d+(?:\.\d{1,2})?$" id="vlrPagamento" name="vlrPagamento" placeholder="Insira o valor do pagamento (em reais)" value="<%=request.getParameter("valor") != null ? request.getParameter("valor") : ""%>" required>
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
            
        <%@include file="/include/theme.jsp"%>
        
    </body>
    
</html>