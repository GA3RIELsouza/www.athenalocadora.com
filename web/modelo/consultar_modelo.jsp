<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Modelos"%>
<%@page import="classes.Marcas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
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

            <%@include file="/include/operation_selector_consulta.html"%>
            
        </span>
            
        <div class="vertical-space"></div>
        
        <table class="outer">
                
                <thead>
                    
                    <th style="background-color: transparent;">
                        <br>
                    </th>
                    
                    <th scope="col" style="border-top-left-radius: var(--smooth-corners);">
                        ID do modelo
                    </th>
                    
                    <th scope="col">
                        Marca
                    </th>
                    
                    <th scope="col">
                        Nome
                    </th>
                    
                    <th scope="col">
                        Tipo
                    </th>
                    
                    <th style="background-color: transparent;">
                        <br>
                    </th>
                    
                </thead>
                
                <%
                    int vModoConsulta = -1;
                    if(request.getParameter("modoConsulta") != null) {
                        vModoConsulta = Integer.parseInt(request.getParameter("modoConsulta"));
                    }
                        
                    Modelos mod = new Modelos();
                    List<Modelos> listaModelos = new ArrayList<>();
                    
                    if(vModoConsulta >= 0 || vModoConsulta <= 2) {
                        
                        switch(vModoConsulta) {
                            case 0:
                                int vIdModelo = Integer.parseInt(request.getParameter("idModelo"));
                                mod.setIdModelo(vIdModelo);
                                listaModelos = mod.consultarModelosId();
                            break;
                            
                            case 1:
                                int vIdMarca = Integer.parseInt(request.getParameter("idMarca"));
                                mod.setIdMarca(vIdMarca);
                                listaModelos = mod.consultarModelosMarca();
                            break;
                            
                            case 2:
                                listaModelos = mod.consultarModelos();
                            break;
                        }
                        
                        if(listaModelos.isEmpty() != true) {
                            
                            for(Modelos m : listaModelos) {
                %>
                
                <tbody>
                    
                    <tr>
                        
                        <td style="background-color: transparent;">
                            <a class="alterar" href="modelo.jsp?idModeloAlterar=<%=m.getIdModelo()%>&idMarcaAlterar=<%=m.getIdMarca()%>&nome=<%=m.getNomeModelo()%>&tipo=<%=m.getTipoModelo()%>">
                                Alterar
                            </a>
                        </td>
                        
                        <td>
                            <%
                                out.print(m.getIdModelo());
                            %>
                        </td>
                        
                        <td>
                            <%
                                Marcas mar = new Marcas();
                                mar.setIdMarca(m.getIdMarca());
                                mar = mar.consultarMarca();
                                
                                if(mar != null) {
                                    out.print(mar.getNomeMarca());
                                }
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(m.getNomeModelo());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(m.getTipoModelo());
                            %>
                        </td>
                        
                        <td style="background-color: transparent;">
                            <a class="excluir" href="modelo.jsp?idModeloExcluir=<%=m.getIdModelo()%>&idMarcaExcluir=<%=m.getIdMarca()%>">
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
                        
                        <td style="background-color: transparent;">
                            <br>
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
                
                <th style="border-bottom-right-radius: var(--smooth-corners);">
                    <br>
                </th>
                
                <th style="background-color: transparent;">
                    <br>
                </th>
                
        </table>
       
       <div class="vertical-space"></div>
            
        <div class="home">
            <a href="modelo.jsp?consultar" class="home-button outer">
                Voltar
            </a>
        </div>
        
        <div class="vertical-space"></div>
       
        <%@include file="/include/theme.html"%>
        
    </body>
    
</html>