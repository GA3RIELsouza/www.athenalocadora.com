<%@page import="classes.Usuarios"%>
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
                    Modelos
                </h1>
            </div>

            <div class="operation-selector">

                <a href="../incluir/modelo.jsp" class="operation">
                    Incluir
                </a>

                <a class="operation selected">
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
        
        <form action="back/excluir_modelo.jsp" method="post" class="outer">
            
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
                        Modelos mod = new Modelos();
                        List<Modelos> listaModelos = new ArrayList<>();
                        listaModelos = mod.consultarExcluirConsultar();
                        
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
                <label for="idMarca">ID da marca <small class="no-select">(buscar por)</small></label><br>
                <select name="idMarca" id="idMarca" required>
                    <option value="" disabled selected>Insira o ID da marca</option>
                    <%
                        Marcas mar = new Marcas();
                        List<Marcas> listaMarcas = new ArrayList<>();
                        listaMarcas = mar.consultarMarcas();
                        
                        int idMarcaConsulta = 0;

                        String idMar = request.getParameter("idMarca");
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