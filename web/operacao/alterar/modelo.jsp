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

                <a class="operation selected">
                    Alterar
                </a>

                <a href="../consultar/modelo.jsp" class="operation">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="b/alterar_modelo.jsp" method="post" class="outer">
            
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
                <label for="idModelo">ID do modelo <small class="no-select">(buscar por)</small></label><br>
                <select name="idModelo" id="idModelo" required>
                    <option value="" disabled selected>Insira o ID do modelo</option>
                    <%
                        Modelos mod1 = new Modelos();
                        List<Modelos> listaModelos = new ArrayList<>();
                        listaModelos = mod1.selectExAltCon();
                        
                        int idModeloConsulta = 0;

                        String idMod = request.getParameter("idModelo");
                        if (idMod != null && !idMod.isEmpty()) {
                            idModeloConsulta = Integer.parseInt(idMod);
                        }
                        
                        for(Modelos m : listaModelos) {
                            int    fIdModelo = m.getIdModelo();
                            String selectedAttribute = (fIdModelo==idModeloConsulta) ? "selected" : "";
                    %>
                    <option value="<%= fIdModelo%>" <%= selectedAttribute %>><%= fIdModelo%></option>
                    <%
                        }
                    %>
                </select>
            </div>
                
            <div class="form-input">
                <label for="idMarca">Marca <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca" required>
                    <option value="" disabled selected>Insira a marca</option>
                    <%
                        Modelos mar = new Modelos();
                        List<Marcas> listaMarcas = new ArrayList<>();
                        listaMarcas = mar.selectMarcas();
                        
                        int idMarcaConsulta = 0;

                        String idMar = request.getParameter("idMarca");
                        if (idMar != null && !idMar.isEmpty()) {
                            idMarcaConsulta = Integer.parseInt(idMar);
                        }

                        for(Marcas m : listaMarcas) {
                            int    fIdMarca   = m.getIdMarca();
                            String fNomeMarca = m.getNomeMarca();
                            String selectedAttribute = (fIdMarca==idMarcaConsulta) ? "selected" : "";
                    %>
                    <option value="<%= fIdMarca%>" <%= selectedAttribute %>><%= fNomeMarca%></option>
                    <%
                        }
                    %>
                </select>
            </div>
                
            <div class="form-input">
                <label for="nomeModelo">Nome</label><br>
                <input type="text" id="nomeModelo" name="nomeModelo" placeholder="Insira o nome" maxlength="30" value="<%=request.getParameter("nome") != null ? request.getParameter("nome") : ""%>" required>
            </div>
                
            <div class="form-input">
                <label for="tipoModelo">Tipo</label><br>
                <select name="tipoModelo" id="tipoModelo" required>
                    <option value="" disabled selected>Insira o tipo</option>
                    <%
                        String option1 = "Carro";
                        String option2 = "Moto";
                        String option3 = "Caminhonete";
                        String option4 = "Caminhão";
                        
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