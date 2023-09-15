<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Clientes"%>
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
                    Clientes
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
                    CPF
                </th>

                <th scope="col">
                    Nome
                </th>

                <th scope="col">
                    Telefone
                </th>

                <th scope="col">
                    E-mail
                </th>

                <th scope="col">
                    Nrº cartão crédito/débito
                </th>

                <th scope="col" style="border-top-right-radius: var(--smooth-corners);">
                    PIX
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

                Clientes cli = new Clientes();

                if(vModoConsulta == 0 && request.getParameter("cpfCliente").length() == 14) {
                    String vCpfCliente = request.getParameter("cpfCliente");
                    cli.setCpfCliente(vCpfCliente);

                    cli = cli.consultarCliente();

                    if(cli != null) {
            %>

            <tbody>

                <tr>

                    <td style="background-color: transparent;">
                        <a class="alterar" href="cliente.jsp?cpfAlterar=<%=cli.getCpfCliente()%>&nome=<%=cli.getNomeCliente()%>&fone=<%=cli.getFoneCliente()%>&email=<%=cli.getEmailCliente()%>&cartao=<%=cli.getNrCartaoDebCred()%>&pix=<%=cli.getChavePix()%>">
                            Alterar
                        </a>
                    </td>

                    <td>
                        <%
                            out.print(cli.getCpfCliente());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(cli.getNomeCliente());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(cli.getFoneCliente());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(cli.getEmailCliente());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(cli.getNrCartaoDebCred());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(cli.getChavePix());
                        %>
                    </td>

                    <td style="background-color: transparent;">
                        <a class="excluir" href="cliente.jsp?cpfExcluir=<%=cli.getCpfCliente()%>">
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

                    <td style="background-color: transparent;">
                        <br>
                    </td>

                </tr>

            </tbody>

            <%
                    }
                }else if(vModoConsulta == 1) {
                    List<Clientes> listaClientes = new ArrayList<>();
                    listaClientes = cli.consultarClientes();

                    for(Clientes c : listaClientes) {
           %>

           <tbody>

                <tr>

                    <td style="background-color: transparent;">
                        <a class="alterar" href="cliente.jsp?cpfAlterar=<%=c.getCpfCliente()%>&nome=<%=c.getNomeCliente()%>&fone=<%=c.getFoneCliente()%>&email=<%=c.getEmailCliente()%>&cartao=<%=c.getNrCartaoDebCred()%>&pix=<%=c.getChavePix()%>">
                            Alterar
                        </a>
                    </td>

                    <td>
                        <%
                            out.print(c.getCpfCliente());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(c.getNomeCliente());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(c.getFoneCliente());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(c.getEmailCliente());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(c.getNrCartaoDebCred());
                        %>
                    </td>

                    <td>
                        <%
                            out.print(c.getChavePix());
                        %>
                    </td>

                    <td style="background-color: transparent;">
                        <a class="excluir" href="cliente.jsp?cpfExcluir=<%=c.getCpfCliente()%>">
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

            <th style="border-bottom-right-radius: var(--smooth-corners);">
                <br>
            </th>

            <th style="background-color: transparent;">
                <br>
            </th>

        </table>
       
       <div class="vertical-space"></div>
            
        <div class="home">
            <a href="cliente.jsp?Consultar" class="home-button outer">
                Voltar
            </a>
        </div>
        
        <div class="vertical-space"></div>
        
    </body>
    
</html>