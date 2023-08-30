<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Alugueis"%>
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
        int    vIdAluguel  = Integer.parseInt(request.getParameter("idAluguel"));
        String vCpfCliente = request.getParameter("cpfCliente");

        Alugueis alu = new Alugueis();
        alu.setIdAluguel(vIdAluguel);
        alu.setCpfCliente(vCpfCliente);
        if (alu.cancelarLocacao()){
            response.sendRedirect("../aluguel.jsp?sucesso=SUCESSO AO EXCLUIR O ALUGUEL");
        } else {
            response.sendRedirect("../aluguel.jsp?erro=PROBLEMAS AO EXCLUIR O ALUGUEL");
        }
   %>

</html>