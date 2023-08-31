<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Marcas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Marcas | Athena Locadora</title>
        
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
                    Marcas
                </h1>
            </div>

            <div class="operation-selector">

                <a href="../incluir/marca.jsp" class="operation">
                    Incluir
                </a>

                <a href="../excluir/marca.jsp" class="operation">
                    Excluir
                </a>

                <a class="operation selected">
                    Alterar
                </a>

                <a href="../consultar/marca.jsp" class="operation">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="java/alterar_marca.jsp" method="post" class="outer">
            
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
                <label for="idMarca">ID <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca" required>
                    <option value="" disabled selected>Insira o ID</option>
                    <%
                        Marcas mar = new Marcas();
                        List<Marcas> listaMarcas = new ArrayList<>();
                        listaMarcas = mar.consultarMarcas();
                        
                        int idMarcaConsulta = 0;

                        String idMar = request.getParameter("id");
                        if (idMar != null && !idMar.isEmpty()) {
                            idMarcaConsulta = Integer.parseInt(idMar);
                        }
                        
                        for(Marcas m : listaMarcas) {
                            int    fIdMarca = m.getIdMarca();
                            String selectedAttribute = (fIdMarca==idMarcaConsulta) ? "selected" : "";
                    %>
                    <option value="<%= fIdMarca%>" <%= selectedAttribute %>><%= fIdMarca%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input">
                <label for="nomeMarca">Nome</label><br>
                <input type="text" id="nomeMarca" name="nomeMarca" placeholder="Insira o nome" maxlength="30" value="<%=request.getParameter("nome") != null ? request.getParameter("nome") : ""%>" required>
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