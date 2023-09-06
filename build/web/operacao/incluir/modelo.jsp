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

                <a class="operation selected">
                    Incluir
                </a>

                <a href="../excluir/modelo.jsp" class="operation">
                    Excluir
                </a>

                <a href="../alterar/modelo.jsp" class="operation">
                    Alterar
                </a>

                <a href="../consultar/modelo.jsp" class="operation">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="b/incluir_modelo.jsp" method="post" class="outer">
            
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
                <label for="idMarca">Marca</label><br>
                <select name="idMarca" id="idMarca" required>
                    <option value="" disabled selected>Insira a marca</option>
                    <%
                        Marcas mar = new Marcas();
                        List<Marcas> listaMarcas = new ArrayList<>();
                        listaMarcas = mar.consultarMarcas();

                        for(Marcas m : listaMarcas) {
                            int    fIdMarca   = m.getIdMarca();
                            String fNomeMarca = m.getNomeMarca();
                    %>
                    <option value="<%= fIdMarca%>"><%= fNomeMarca%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input">
                <label for="nomeModelo">Nome</label><br>
                <input type="text" id="nomeModelo" name="nomeModelo" placeholder="Insira o nome" maxlength="30" required>
            </div>
                
            <div class="form-input">
                <label for="tipoModelo">Tipo</label><br>
                <select name="tipoModelo" id="tipoModelo" required>
                    <option value="" disabled selected>Insira o tipo</option>
                    <option value="Carro">Carro</option>
                    <option value="Moto">Moto</option>
                    <option value="Caminhonete">Caminhonete</option>
                    <option value="Caminhão">Caminhão</option>
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