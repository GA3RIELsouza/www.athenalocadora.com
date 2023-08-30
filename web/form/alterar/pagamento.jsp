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
                <input type="number" step="1" pattern="\d+" id="idPagamento" name="idPagamento" placeholder="Insira o ID do pagamento" min="1" max="2147483647" value="<%=request.getParameter("idPagamento") != null ? request.getParameter("idPagamento") : ""%>" required>
            </div>
            
            <div class="form-input">
                <label for="idAluguel">ID do aluguel <small>(buscar por)</small></label><br>
                <input type="number" step="1" pattern="\d+" id="idAluguel" name="idAluguel" placeholder="Insira o ID do aluguel" min="1" max="2147483647" value="<%=request.getParameter("idAluguel") != null ? request.getParameter("idAluguel") : ""%>" required>
            </div>
            
            <div class="form-input">
                <label for="dataPagamento">Data</label><br>
                <input type="datetime-local" id="dataPagamento" name="dataPagamento" value="<%=request.getParameter("data") != null ? request.getParameter("data") : ""%>" required>
            </div>
            
            <div class="form-input">
                <label for="tipoPagamento">Tipo</label><br>
                <select name="tipoPagamento" id="tipoPagamento" value="<%=request.getParameter("tipo") != null ? request.getParameter("tipo") : ""%>" required>
                    <option value="" disabled selected>Insira o tipo de pagamento</option>
                    <option value="Dinheiro">Dinheiro</option>
                    <option value="Cartão crédito">Cartão crédito</option>
                    <option value="Cartão débito">Cartão débito</option>
                    <option value="PIX">PIX</option>
                </select>
            </div>
            
            <div class="form-input">
                <label for="vlrPagamento">Valor</label><br>
                <input type="number" step=".01" pattern="^\d+(?:\.\d{1,2})?$" id="vlrPagamento" name="vlrPagamento" placeholder="Insira o valor do pagamento (em reais)" value="<%=request.getParameter("valor") != null ? request.getParameter("valor") : ""%>" required>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Enviar
                </button>
                
                <button type="reset">
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