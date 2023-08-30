<%@page import="classes.Usuarios"%>
<%@page import="classes.Alugueis"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

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

    <%
        int     vIdAluguel             = Integer.parseInt(request.getParameter("idAluguel"));
        String  vCpfCliente            = request.getParameter("cpfCliente");
        Timestamp vDataDevolucao         = Timestamp.valueOf(request.getParameter("dataDevolucao").replace(request.getParameter("dataDevolucao").charAt(10),' ') + ":00");

        Alugueis alu = new Alugueis();
        alu.setIdAluguel(vIdAluguel);
        alu.setCpfCliente(vCpfCliente);
        alu.setDataDevolucao(vDataDevolucao);
        if (alu.devolverVeiculo()){
            response.sendRedirect("../aluguel.jsp?sucesso=SUCESSO AO ATUALIZAR O STATUS ALUGUEL");
        } else {
            response.sendRedirect("../aluguel.jsp?erro=PROBLEMAS AO ATUALIZAR O STATUS ALUGUEL");
        }
   %>

</html>