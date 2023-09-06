<%@include file="/include/check_login.jsp"%>
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

                <a class="operation selected">
                    Incluir
                </a>

                <a href="../excluir/pagamento.jsp" class="operation">
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
        
        <form action="b/incluir_pagamento.jsp" method="post" class="outer">
            
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
                <label for="idAluguel">ID do aluguel</label><br>
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
            
            <div class="form-input">
                <label for="dataPagamento">Data</label><br>
                <input type="datetime-local" id="dataPagamento" name="dataPagamento" required>
            </div>
            
            <div class="form-input">
                <label for="tipoPagamento">Tipo</label><br>
                <select name="tipoPagamento" id="tipoPagamento" required>
                    <option value="" disabled selected>Insira o tipo de pagamento</option>
                    <option value="Dinheiro">Dinheiro</option>
                    <option value="Cartão crédito">Cartão crédito</option>
                    <option value="Cartão débito">Cartão débito</option>
                    <option value="PIX">PIX</option>
                </select>
            </div>
            
            <div class="form-input">
                <label for="vlrPagamento">Valor</label><br>
                <input type="number" step=".01" pattern="^\d+(?:\.\d{1,2})?$" id="vlrPagamento" name="vlrPagamento" placeholder="Insira o valor do pagamento (em reais)" required>
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