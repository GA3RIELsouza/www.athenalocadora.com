<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Pagamentos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pagamentos | Athena Locadora</title>
        
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
                    Pagamentos
                </h1>
            </div>

            <div class="operation-selector">

                <a href="../../incluir/pagamento.jsp" class="operation">
                    Incluir
                </a>

                <a href="../../excluir/pagamento.jsp" class="operation">
                    Excluir
                </a>

                <a href="../../alterar/pagamento.jsp" class="operation">
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
                    
                    <th style="background-color: transparent;">
                        <br>
                    </th>
                    
                    <th scope="col" style="border-top-left-radius: var(--smooth-corners);">
                        ID do pagamento
                    </th>
                    
                    <th scope="col">
                        ID do aluguel
                    </th>
                    
                    <th scope="col">
                        Data
                    </th>
                    
                    <th scope="col">
                        Tipo
                    </th>
                    
                    <th scope="col" style="border-top-right-radius: var(--smooth-corners);">
                        Valor
                    </th>
                    
                    <th style="background-color: transparent;"">
                        <br>
                    </th>
                    
                </thead>
                
                <%
                    int vModoConsulta = -1;
                    if(request.getParameter("modoConsulta") != null) {
                        vModoConsulta = Integer.parseInt(request.getParameter("modoConsulta"));
                    }

                    Pagamentos pag = new Pagamentos();
                    List<Pagamentos> listaPagamentos = new ArrayList<>();

                    if(vModoConsulta >= 0 || vModoConsulta <= 2) {
                        
                        switch(vModoConsulta) {
                            case 0:
                                int vIdPagamento = Integer.parseInt(request.getParameter("idPagamento"));
                                pag.setIdPagamento(vIdPagamento);
                                listaPagamentos = pag.consultarPagamentosId();
                            break;
                            
                            case 1:
                                int vIdAluguel = Integer.parseInt(request.getParameter("idAluguel"));
                                pag.setIdAluguel(vIdAluguel);
                                listaPagamentos = pag.consultarPagamentosAluguel();
                            break;
                            
                            case 2:
                                listaPagamentos = pag.consultarPagamentos();
                            break;
                        }
                        
                        if(listaPagamentos.isEmpty() != true) {
                            
                            for(Pagamentos p : listaPagamentos) {
                %>
                
                <tbody>
                    
                    <tr>
                        
                        <td style="background-color: transparent;">
                            <a class="alterar" href="../../alterar/pagamento.jsp?idPagamento=<%=pag.getIdPagamento()%>&idAluguel=<%=pag.getIdAluguel()%>&data=<%=pag.getDataPagamento()%>&tipo=<%=pag.getTipoPagamento()%>&valor=<%=pag.getVlrPagamento()%>">
                                Alterar
                            </a>
                        </td>
                        
                        <td>
                            <%
                                out.print(p.getIdPagamento());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(p.getIdAluguel());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(p.getDataPagamento());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(p.getTipoPagamento());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print("R$" + p.getVlrPagamento());
                            %>
                        </td>
                        
                        <td style="background-color: transparent;">
                            <a class="excluir" href="../../excluir/pagamento.jsp?idPagamento=<%=pag.getIdPagamento()%>&idAluguel=<%=pag.getIdAluguel()%>">
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
                
                <th style="border-bottom-right-radius: var(--smooth-corners);">
                    <br>
                </th>
                
                <th style="background-color: transparent;">
                    <br>
                </th>
                
        </table>
       
       <div class="vertical-space"></div>
            
        <div class="home">
            <a href="../pagamento.jsp" class="home-button outer">
                Voltar
            </a>
        </div>
        
        <div class="vertical-space"></div>
       
        <%@include file="/include/theme.html"%>
        
    </body>
    
</html>