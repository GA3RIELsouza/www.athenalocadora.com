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
        
        <script>
            function scriptModoConsulta() {
                var campoIdPagamento = document.getElementById("campoIdPagamento");
                var inputIdPagamento = document.getElementById("idPagamento4");
                var campoIdAluguel   = document.getElementById("campoIdAluguel");
                var inputIdAluguel   = document.getElementById("idAluguel4");
                var modoSelecionado  = document.getElementById("modoConsulta").value;
                
                if(modoSelecionado === "0") {
                    campoIdPagamento.style.display = "";
                    inputIdPagamento.setAttribute("required", "");
                    campoIdAluguel.style.display = "none";
                    inputIdAluguel.removeAttribute("required");
                    inputIdAluguel.value = "";
                }else if(modoSelecionado === "1") {
                    campoIdPagamento.style.display = "none";
                    inputIdPagamento.removeAttribute("required");
                    inputIdPagamento.value = "";
                    campoIdAluguel.style.display = "";
                    inputIdAluguel.setAttribute("required", "");
                }else {
                    campoIdPagamento.style.display = "none";
                    inputIdPagamento.removeAttribute("required");
                    inputIdPagamento.value = "";
                    campoIdAluguel.style.display = "none";
                    inputIdAluguel.removeAttribute("required");
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

            <%@include file="/include/operation_selector.html"%>
            
        </span>
        
        <div class="vertical-space"></div>
        
        <form action="incluir_pagamento.jsp" method="post" class="outer" id="form_incluir">
            
            <div class="sucesso">
                <%
                    if(request.getParameter("sucessoIncluir") != null)         
                        out.write(request.getParameter("sucessoIncluir"));
                %>
            </div>
            
            <div class="erro">
                <%
                    if(request.getParameter("erroIncluir") != null)         
                        out.write(request.getParameter("erroIncluir"));
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
                
        <form action="alterar_pagamento.jsp" method="post" class="outer" id="form_alterar">
            
            <div class="sucesso">
                <%
                    if(request.getParameter("sucessoAlterar") != null)         
                        out.write(request.getParameter("sucessoAlterar"));
                %>
            </div>
            
            <div class="erro">
                <%
                    if(request.getParameter("erroAlterar") != null)         
                        out.write(request.getParameter("erroAlterar"));
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

                        String idPag = request.getParameter("idPagamentoAlterar");
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
                        Alugueis alu2 = new Alugueis();
                        List<Alugueis> listaAlugueis2 = new ArrayList<>();
                        listaAlugueis2 = alu2.consultarAlugueis();
                        
                        int idAluguelConsulta2 = 0;

                        String idAlu2 = request.getParameter("idAluguelAlterar");
                        if (idAlu2 != null && !idAlu2.isEmpty()) {
                            idAluguelConsulta2 = Integer.parseInt(idAlu2);
                        }

                        for(Alugueis a : listaAlugueis2) {
                            int fIdAluguel = a.getIdAluguel();
                            String selectedAttribute = fIdAluguel==idAluguelConsulta2 ? "selected" : "";
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
            
        <form action="excluir_pagamento.jsp" method="post" class="outer" id="form_excluir">
            
            <div class="sucesso">
                <%
                    if(request.getParameter("sucessoExcluir") != null)         
                        out.write(request.getParameter("sucessoExcluir"));
                %>
            </div>
            
            <div class="erro">
                <%
                    if(request.getParameter("erroExcluir") != null)         
                        out.write(request.getParameter("erroExcluir"));
                %>
            </div>
            
            <div class="form-input">
                <label for="idPagamento">ID do pagamento <small class="no-select">(buscar por)</small></label><br>
                <select name="idPagamento" id="idPagamento" required>
                    <option value="" disabled selected>Insira o ID do pagamento</option>
                    <%
                        Pagamentos pag3 = new Pagamentos();
                        List<Pagamentos> listaPagamentos3 = new ArrayList<>();
                        listaPagamentos3 = pag3.selectExcluirAlterarConsultar();
                        
                        int idPagamentoConsulta3 = 0;

                        String idPag3 = request.getParameter("idPagamentoExcluir");
                        if (idPag3 != null && !idPag3.isEmpty()) {
                            idPagamentoConsulta3 = Integer.parseInt(idPag3);
                        }

                        for(Pagamentos p : listaPagamentos3) {
                            int fIdPagamento = p.getIdPagamento();
                            String selectedAttribute = fIdPagamento==idPagamentoConsulta3 ? "selected" : "";
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
                        Alugueis alu3 = new Alugueis();
                        List<Alugueis> listaAlugueis3 = new ArrayList<>();
                        listaAlugueis3 = alu3.consultarAlugueis();
                        
                        int idAluguelConsulta3 = 0;

                        String idAlu3 = request.getParameter("idAluguelExcluir");
                        if (idAlu3 != null && !idAlu3.isEmpty()) {
                            idAluguelConsulta3 = Integer.parseInt(idAlu3);
                        }

                        for(Alugueis a : listaAlugueis3) {
                            int fIdAluguel = a.getIdAluguel();
                            String selectedAttribute = fIdAluguel==idAluguelConsulta3 ? "selected" : "";
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
                
        <form action="consultar_pagamento.jsp" method="post" class="outer" id="form_consultar">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="0">Por ID do pagamento</option>
                    <option value="1">Por ID do aluguel</option>
                    <option value="2">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoIdPagamento">
                <label for="idPagamento4">ID do pagamento <small class="no-select">(buscar por)</small></label><br>
                <select name="idPagamento" id="idPagamento4" required>
                    <option value="" disabled selected>Insira o ID do pagamento</option>
                    <%
                        Pagamentos pag4 = new Pagamentos();
                        List<Pagamentos> listaPagamentos4 = new ArrayList<>();
                        listaPagamentos4 = pag4.selectExcluirAlterarConsultar();
                        
                        int idPagamentoConsulta4 = 0;

                        String idPag4 = request.getParameter("idPagamento");
                        if (idPag4 != null && !idPag4.isEmpty()) {
                            idPagamentoConsulta4 = Integer.parseInt(idPag4);
                        }

                        for(Pagamentos p : listaPagamentos4) {
                            int fIdPagamento = p.getIdPagamento();
                            String selectedAttribute = fIdPagamento==idPagamentoConsulta4 ? "selected" : "";
                    %>
                    <option value="<%= fIdPagamento%>" <%= selectedAttribute %>><%= fIdPagamento%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input" id="campoIdAluguel" style="display: none;">
                <label for="idAluguel4">ID do aluguel <small class="no-select">(buscar por)</small></label><br>
                <select name="idAluguel" id="idAluguel4">
                    <option value="" disabled selected>Insira o ID do aluguel</option>
                    <%
                        Alugueis alu4 = new Alugueis();
                        List<Alugueis> listaAlugueis4 = new ArrayList<>();
                        listaAlugueis4 = alu4.consultarAlugueis();
                        
                        int idAluguelConsulta4 = 0;

                        String idAlu4 = request.getParameter("idAluguel");
                        if (idAlu4 != null && !idAlu4.isEmpty()) {
                            idAluguelConsulta4 = Integer.parseInt(idAlu4);
                        }

                        for(Alugueis a : listaAlugueis4) {
                            int fIdAluguel = a.getIdAluguel();
                            String selectedAttribute = fIdAluguel==idAluguelConsulta4 ? "selected" : "";
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