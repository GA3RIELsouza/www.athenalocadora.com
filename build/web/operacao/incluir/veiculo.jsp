<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Veiculos"%>
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
        
        <script src="/www.athenalocadora.com/js/jquery-1.2.6.pack.js"></script>
        <script src="/www.athenalocadora.com/js/jquery.maskedinput-1.1.4.pack.js"></script>
        <script>
            $(document).ready(function(){
                $("#placaVeiculo").mask("AAA-9999");
            });
            
            function mudaPlaca() {
                campoPlacaCinza    = document.getElementById("campoPlacaCinza");
                campoPlacaMercosul = document.getElementById("campoPlacaMercosul");
                inputTipoPlaca     = document.getElementById("tipoPlaca").value;
                
                if(inputTipoPlaca === "0") {
                    campoPlacaCinza.style.display = "";
                    console.log("ok");
                }
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
        
        <form action="b/incluir_veiculo.jsp" method="post" class="outer">
            
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
                <label for="marcaModelo">Modelo</label><br>
                <select name="marcaModelo" id="marcaModelo" required>
                    <option value="" disabled selected>Insira o modelo</option>
                    <%
                        Veiculos mod = new Veiculos();
                        List<Modelos> listaModelos = new ArrayList<>();
                        listaModelos = mod.selectModelos();

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
                    <option value="<%= fIdMarca + "-" + fIdModelo%>"><%= fNomeMarca + " " + fNomeModelo%></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
                
            <div class="form-input">
                <label for="tipoPlaca">Tipo de placa</label><br>
                <select name="tipoPlaca" id="tipoPlaca" onchange="mudaPlaca()" required>
                    <option value="" disabled selected>Insira o tipo de placa</option>
                    <option value="0">Cinza</option>
                    <option value="1">Mercosul</option>
                </select>
            </div>
            
            <div class="form-input" id="campoPlacaCinza" style="display: none;">
                <label for="placaVeiculo">Placa</label><br>
                <input type="text" id="placaVeiculo" name="placaVeiculo" placeholder="Insira a placa" minlength="7" maxlength="7" pattern="[a-zA-Z0-9-]{7}" title="Apenas letras e números" required>
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