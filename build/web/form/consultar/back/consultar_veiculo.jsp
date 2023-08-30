<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Veiculos"%>
<%@page import="classes.Marcas"%>
<%@page import="classes.Modelos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
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

                <a href="../../incluir/veiculo.jsp" class="operation">
                    Incluir
                </a>

                <a href="../../excluir/veiculo.jsp" class="operation">
                    Excluir
                </a>

                <a href="../../alterar/veiculo.jsp" class="operation">
                    Alterar
                </a>

                <a class="operation selected">
                    Consultar
                </a>

            </div>
        </span>
            
        <div class="vertical-space"></div>
        
        <table class="outer">
                
                <thead>
                    
                    <th scope="col" style="background-color: transparent;">
                        <br>
                    </th>
                    
                    <th scope="col" style="border-top-left-radius: var(--smooth-corners);">
                        ID
                    </th>
                    
                    <th scope="col">
                        Modelo
                    </th>
                    
                    <th scope="col">
                        Placa
                    </th>
                    
                    <th scope="col">
                        Cor predominante
                    </th>
                    
                    <th scope="col">
                        Ano de fabricação
                    </th>
                    
                    <th scope="col">
                        Disponível
                    </th>
                    
                    <th scope="col">
                        Ar condicionado
                    </th>
                    
                    <th scope="col">
                        Direção hidráulica
                    </th>
                    
                    <th scope="col" style="border-top-right-radius: var(--smooth-corners);">
                        Revisado
                    </th>
                    
                    <th scope="col" style="background-color: transparent;">
                        <br>
                    </th>
                    
                </thead>
                
                <%
                    int vModoConsulta;
                    if(request.getParameter("modoConsulta") != null) {
                        vModoConsulta = Integer.parseInt(request.getParameter("modoConsulta"));
                    }else {
                        vModoConsulta = -1;
                    }

                    Veiculos vei = new Veiculos();

                    if(vModoConsulta == 0 && request.getParameter("idVeiculo").length() > 0) {
                        int vIdVeiculo = Integer.parseInt(request.getParameter("idVeiculo"));
                        vei.setIdVeiculo(vIdVeiculo);
                        
                        vei = vei.consultarVeiculo();
                        
                        if(vei != null) {
                %>
                
                <tbody>
                    
                    <tr>
                        
                        <td style="background-color: transparent;">
                            <a class="alterar" href="../../alterar/veiculo.jsp?id=<%=vei.getIdVeiculo()%>&modelo=<%=vei.getIdModelo()%>&placa=<%=vei.getPlacaVeiculo()%>&corPredominante=<%=vei.getCorPredominante()%>&anoFabricacao=<%=vei.getAnoFabricacao()%>&disponivel=<%=vei.isDisponivel()%>&arCondicionado=<%=vei.isTemArCondicionado()%>&dirHidraulica=<%=vei.isTemDirHidraulica()%>&revisado=<%=vei.isRevisado()%>">
                                Alterar
                            </a>
                        </td>
                        
                        <td>
                            <%
                                out.print(vei.getIdVeiculo());
                            %>
                        </td>
                        
                        <td>
                            <%
                                Modelos mod = new Modelos();
                                mod.setIdModelo(vei.getIdModelo());
                                
                                mod = mod.consultarModeloId();
                                
                                if(mod != null) {
                                    int    fIdMarca    = mod.getIdMarca();
                                    String fNomeModelo = mod.getNomeModelo();
                                    
                                    Marcas mar = new Marcas();
                                    mar.setIdMarca(fIdMarca);
                                    
                                    mar = mar.consultarMarca();
                                    
                                    if(mar != null) {
                                        String fNomeMarca = mar.getNomeMarca();
                                        
                                        out.print(fNomeMarca + " " + fNomeModelo);
                                    }
                                }
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(vei.getPlacaVeiculo());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(vei.getCorPredominante());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(vei.getAnoFabricacao());
                            %>
                        </td>
                        
                        <td>
                            <%
                                if(vei.isDisponivel()) {
                                    out.print("Sim");
                                }else {
                                    out.print("Não");
                                }
                            %>
                        </td>
                        
                        <td>
                            <%
                                if(vei.isTemArCondicionado()) {
                                    out.print("Sim");
                                }else {
                                    out.print("Não");
                                }
                            %>
                        </td>
                        
                        <td>
                            <%
                                if(vei.isTemDirHidraulica()) {
                                    out.print("Sim");
                                }else {
                                    out.print("Não");
                                }
                            %>
                        </td>
                        
                        <td>
                            <%
                                if(vei.isRevisado()) {
                                    out.print("Sim");
                                }else {
                                    out.print("Não");
                                }
                            %>
                        </td>
                        
                        <td style="background-color: transparent;">
                            <a class="excluir" href="../../excluir/veiculo.jsp?id=<%=vei.getIdVeiculo()%>">
                                Excluir
                            </a>
                        </td>
                
                    </tr>
                    
                </tbody>
                
                <%
                        }else {
                %>
                
                <tbody>
                    
                    <tr>
                        
                        <td style="background-color: transparent;">
                            <br>
                        </td>
                        
                        <td>
                            Nenhum resultado encontrado
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td style="background-color: transparent;">
                            <br>
                        </td>
                        
                    </tr>
                    
                </tbody>
                
                <%
                        } 
                    }else if(vModoConsulta == 1) {
                        List<Veiculos> listaVeiculos = new ArrayList<>();
                        listaVeiculos = vei.consultarVeiculos();
                        
                        for(Veiculos v : listaVeiculos) {
               %>
               
               <tbody>
                    
                    <tr>
                        
                        <td style="background-color: transparent;">
                            <a class="alterar" href="../../alterar/veiculo.jsp?id=<%=v.getIdVeiculo()%>&modelo=<%=v.getIdModelo()%>&placa=<%=v.getPlacaVeiculo()%>&corPredominante=<%=v.getCorPredominante()%>&anoFabricacao=<%=v.getAnoFabricacao()%>&disponivel=<%=v.isDisponivel()%>&arCondicionado=<%=v.isTemArCondicionado()%>&dirHidraulica=<%=v.isTemDirHidraulica()%>&revisado=<%=v.isRevisado()%>">
                                Alterar
                            </a>
                        </td>
                        
                        <td>
                            <%
                                out.print(v.getIdVeiculo());
                            %>
                        </td>
                        
                        <td>
                            <%
                                Modelos mod = new Modelos();
                                mod.setIdModelo(v.getIdModelo());
                                
                                mod = mod.consultarModeloId();
                                
                                if(mod != null) {
                                    int    fIdMarca    = mod.getIdMarca();
                                    String fNomeModelo = mod.getNomeModelo();
                                    
                                    Marcas mar = new Marcas();
                                    mar.setIdMarca(fIdMarca);
                                    
                                    mar = mar.consultarMarca();
                                    
                                    if(mar != null) {
                                        String fNomeMarca = mar.getNomeMarca();
                                        
                                        out.print(fNomeMarca + " " + fNomeModelo);
                                    }
                                }
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(v.getPlacaVeiculo());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(v.getCorPredominante());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(v.getAnoFabricacao());
                            %>
                        </td>
                        
                        <td>
                            <%
                                if(v.isDisponivel()) {
                                    out.print("Sim");
                                }else {
                                    out.print("Não");
                                }
                            %>
                        </td>
                        
                        <td>
                            <%
                                if(v.isTemArCondicionado()) {
                                    out.print("Sim");
                                }else {
                                    out.print("Não");
                                }
                            %>
                        </td>
                        
                        <td>
                            <%
                                if(v.isTemDirHidraulica()) {
                                    out.print("Sim");
                                }else {
                                    out.print("Não");
                                }
                            %>
                        </td>
                        
                        <td>
                            <%
                                if(v.isRevisado()) {
                                    out.print("Sim");
                                }else {
                                    out.print("Não");
                                }
                            %>
                        </td>
                        
                        <td style="background-color: transparent;">
                            <a class="excluir" href="../../excluir/veiculo.jsp?id=<%=v.getIdVeiculo()%>">
                                Excluir
                            </a>
                        </td>
                
                    </tr>
                    
                </tbody>
                
                <%
                        }
                    }else {
                %>
                
                <tbody>
                    
                    <tr>
                        
                        <td style="background-color: transparent;">
                            <br>
                        </td>
                        
                        <td>
                            Nenhum resultado encontrado
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td>
                            ---
                        </td>
                        
                        <td style="background-color: transparent;">
                            <br>
                        </td>
                        
                    </tr>
                    
                </tbody>
                
                <%
                    }  
                %>
                
                <th style="background-color: transparent;">
                    <br>
                </th>
                
                <th style="border-bottom-left-radius: var(--smooth-corners);">
                    <br>
                </th>
                
                <th>
                    <br>
                </th>
                
                <th>
                    <br>
                </th>
                
                <th>
                    <br>
                </th>
                
                <th>
                    <br>
                </th>
                
                <th>
                    <br>
                </th>
                
                <th>
                    <br>
                </th>
                
                <th>
                    <br>
                </th>
                
                <th style="border-bottom-right-radius: var(--smooth-corners);">
                    <br>
                </th>
                
                <th style="background-color: transparent;">
                    <br>
                </th>
                
        </table>
       
       <div class="vertical-space"></div>
            
        <div class="home">
            <a href="../veiculo.jsp" class="home-button outer">
                Voltar
            </a>
        </div>
        
        <div class="vertical-space"></div>
       
        <%@include file="/include/theme.html"%>
        
    </body>
    
</html>