<%@page import="classes.Usuarios"%>
<%@page import="classes.Alugueis"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Aluguéis | Athena Locadora</title>
        
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
                    Aluguéis
                </h1>
            </div>

            <div class="operation-selector">

                <a href="../../incluir/aluguel.jsp" class="operation">
                    Incluir
                </a>

                <a href="../../excluir/aluguel.jsp" class="operation">
                    Cancelar
                </a>

                <a href="../../alterar/aluguel.jsp" class="operation">
                    Devolver
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
                        ID do aluguel
                    </th>
                    
                    <th scope="col">
                        ID do veículo
                    </th>
                    
                    <th scope="col">
                        CPF do cliente
                    </th>
                    
                    <th scope="col">
                        Data de início
                    </th>
                    
                    <th scope="col">
                        Data de devolução
                    </th>
                    
                    <th scope="col">
                        Data estimada de devolução
                    </th>
                    
                    <th scope="col" style="border-top-right-radius: var(--smooth-corners);">
                        Pagamentos realizado
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
                        
                    Alugueis alu = new Alugueis();
                    List<Alugueis> listaAlugueis = new ArrayList<>();
                    
                    if(vModoConsulta >= 0 && vModoConsulta <= 2) {
                        
                        switch(vModoConsulta) {
                            case 0:
                                String vCpfCliente = request.getParameter("cpfCliente");
                                alu.setCpfCliente(vCpfCliente);
                                listaAlugueis = alu.consultarLocacaoCliente();
                            break;
                            
                            case 1:
                                int vIdVeiculo = Integer.parseInt(request.getParameter("idVeiculo"));
                                alu.setIdVeiculo(vIdVeiculo);
                                listaAlugueis = alu.consultarLocacaoVeiculo();
                            break;
                            
                            case 2:
                                listaAlugueis = alu.consultarAlugueis();
                            break;
                        }
                        
                        if(listaAlugueis.isEmpty() != true) {
                            
                            for(Alugueis a : listaAlugueis) {
                %>
                
                <tbody>
                    
                    <tr>
                        
                        <td style="background-color: transparent;">
                            <a class="alterar" href="../../alterar/aluguel.jsp?idAluguel=<%=a.getIdAluguel()%>&idVeiculo=<%=a.getIdVeiculo()%>&cpfCliente=<%=a.getCpfCliente()%>&dataAluguel=<%=a.getDataAluguel()%>&dataDevolucao=<%=a.getDataDevolucao()%>&dataEstimadaDevolucao=<%=a.getDataEstimadaDevolucao()%>&pagamento=<%=a.isPagamento()%>">
                                Devolver
                            </a>
                        </td>
                        
                        <td>
                            <%
                                out.print(a.getIdAluguel());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(a.getIdVeiculo());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(a.getCpfCliente());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(a.getDataAluguel());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(a.getDataDevolucao());
                            %>
                        </td>
                        
                        <td>
                            <%
                                out.print(a.getDataEstimadaDevolucao());
                            %>
                        </td>
                        
                        <td>
                            <%
                                if(a.isPagamento()) {
                                    out.print("Sim");
                                }else {
                                    out.print("Não");
                                }
                            %>
                        </td>
                        
                        <td style="background-color: transparent;">
                            <a class="excluir" href="../../excluir/aluguel.jsp?idAluguel=<%=a.getIdAluguel()%>&cpfCliente=<%=a.getCpfCliente()%>">
                                Cancelar
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
                
                <th style="border-bottom-right-radius: var(--smooth-corners);">
                    <br>
                </th>
                
                <th style="background-color: transparent;">
                    <br>
                </th>
                
        </table>
       
       <div class="vertical-space"></div>
            
        <div class="home">
            <a href="../aluguel.jsp" class="home-button outer">
                Voltar
            </a>
        </div>
        
        <div class="vertical-space"></div>
       
        <%@include file="/include/theme.jsp"%>
        
    </body>
    
</html>