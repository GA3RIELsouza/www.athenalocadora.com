<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Marcas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clientes | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        <%@include file="/include/theme.jsp"%>
        
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

            <%@include file="/include/operation_selector_consulta.html"%>
            
        </span>
            
        <div class="vertical-space"></div>
        
        <table class="outer">

            <thead>

                <th style="background-color: transparent;">
                    <br>
                </th>

                <th scope="col" style="border-top-left-radius: var(--smooth-corners);">
                    ID
                </th>

                <th scope="col" style="border-top-right-radius: var(--smooth-corners);">
                    Nome
                </th>

                <th style="background-color: transparent;">
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

                Marcas mar = new Marcas();

                if(vModoConsulta == 0 && Integer.parseInt(request.getParameter("idMarca")) > 0) {
                    int vIdMarca = Integer.parseInt(request.getParameter("idMarca"));
                    mar.setIdMarca(vIdMarca);

                    mar = mar.consultarMarca();

                    if(mar != null) {
            %>

            <tbody>

                <tr>

                    <td style="background-color: transparent;">
                        <a class="alterar" href="marca.jsp?idAlterar=<%=mar.getIdMarca()%>&nome=<%=mar.getNomeMarca()%>">
                            Alterar
                        </a>
                    </td>

                    <td>
                        <%
                            out.print(mar.getIdMarca());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(mar.getNomeMarca());
                        %>
                    </td>

                    <td style="background-color: transparent;">
                        <a class="excluir" href="marca.jsp?idExcluir=<%=mar.getIdMarca()%>">
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

                    <td style="background-color: transparent;">
                        <br>
                    </td>

                </tr>

            </tbody>

            <%
                    }
                }else if(vModoConsulta == 1) {
                    List<Marcas> listaMarcas = new ArrayList<>();
                    listaMarcas = mar.consultarMarcas();

                    for(Marcas m : listaMarcas) {
           %>

           <tbody>

                <tr>

                    <td style="background-color: transparent;">
                        <a class="alterar" href="marca.jsp?idAlterar=<%=m.getIdMarca()%>&nome=<%=m.getNomeMarca()%>">
                            Alterar
                        </a>
                    </td>

                    <td>
                        <%
                            out.print(m.getIdMarca());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(m.getNomeMarca());
                        %>
                    </td>

                    <td style="background-color: transparent;">
                        <a class="excluir" href="marca.jsp?idExcluir=<%=m.getIdMarca()%>">
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
            
            <th style="border-bottom-right-radius: var(--smooth-corners);">
                <br>
            </th>

            <th style="background-color: transparent;">
                <br>
            </th>

        </table>
       
       <div class="vertical-space"></div>
            
        <div class="home">
            <a href="marca.jsp?consultar" class="home-button outer">
                Voltar
            </a>
        </div>
        
        <div class="vertical-space"></div>
        
    </body>
    
</html>