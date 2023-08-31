<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Marcas"%>
<%@page import="classes.Modelos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Veículos | Athena Locadora</title>
        
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
                    Veículos
                </h1>
            </div>

            <div class="operation-selector">

                <a class="operation selected">
                    Incluir
                </a>

                <a href="../excluir/veiculo.jsp" class="operation">
                    Excluir
                </a>

                <a href="../alterar/veiculo.jsp" class="operation">
                    Alterar
                </a>

                <a href="../consultar/veiculo.jsp" class="operation">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <form action="java/incluir_veiculo.jsp" method="post" class="outer">
            
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
                <label for="idModelo">Modelo</label><br>
                <select name="idModelo" id="idModelo" required>
                    <option value="" disabled selected>Insira o modelo</option>
                    <%
                        Modelos mod = new Modelos();
                        List<Modelos> listaModelos = new ArrayList<>();
                        listaModelos = mod.consultarIncluirAlterar();

                        for(Modelos m : listaModelos) {
                            int    fIdModelo   = m.getIdModelo();
                            String fNomeModelo = m.getNomeModelo();
                            int    fIdMarca    = m.getIdMarca();
                            
                            Marcas mar = new Marcas();
                            mar.setIdMarca(fIdMarca);

                            mar = mar.consultarMarca();

                            if(mar != null) {
                                String fNomeMarca = mar.getNomeMarca();
                    %>
                    <option value="<%= fIdModelo%>"><%= fNomeMarca + " " + fNomeModelo%></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input">
                <label for="placaVeiculo">Placa</label><br>
                <input type="text" id="placaVeiculo" name="placaVeiculo" placeholder="Insira a placa" maxlength="7" pattern="[a-zA-Z0-9-]{7}" title="Apenas letras e números" required>
            </div>
            
            <div class="form-input">
                <label for="corPredominante">Cor predominante</label><br>
                <input type="list" list="listaCores" id="corPredominante" name="corPredominante" placeholder="Insira a cor predominante" maxlength="15" required>
                <datalist id="listaCores">
                  <option value="Branco"></option>
                  <option value="Preto"></option>
                  <option value="Cinza"></option>
                  <option value="Prata"></option>
                  <option value="Vermelho"></option>
                  <option value="Azul"></option>
                  <option value="Verde"></option>
                  <option value="Amarelo"></option>
                  <option value="Laranja"></option>
                  <option value="Rosa"></option>
                  <option value="Roxo"></option>
                  <option value="Ciano"></option>
                  <option value="Marrom"></option>
                </datalist>
            </div>
            
            <div class="form-input">
                <label for="anoFabricacao">Ano de fabricação</label><br>
                <input type="number" step="1" pattern="\d+" id="anoFabricacao" name="anoFabricacao" placeholder="Insira o ano de fabricação" min="1886" max="2147483647" required>
            </div>
            
            <div class="form-input">
                <input type="checkbox" id="disponivel" name="disponivel" value="true">
                <label for="disponivel">Disponível</label>
            </div><br>
            
            <div class="form-input">
                <input type="checkbox" id="temArCondicionado" name="temArCondicionado" value="true">
                <label for="temArCondicionado">Ar condicionado</label>
            </div><br class="noselect">
            
            <div class="form-input">
                <input type="checkbox" id="temDirHidraulica" name="temDirHidraulica" value="true">
                <label for="temDirHidraulica">Direção hidráulica</label>
            </div><br class="noselect">
            
            <div class="form-input">
                <input type="checkbox" id="revisado" name="revisado" value="true">
                <label for="revisado">Revisado</label>
            </div><br class="noselect">
            
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