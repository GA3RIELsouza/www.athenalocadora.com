<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Clientes"%>
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
        String vCpfCliente = request.getParameter("cpfCliente");

        Clientes cli = new Clientes();
        cli.setCpfCliente(vCpfCliente);
        if (cli.excluirCliente()){
            response.sendRedirect("../cliente.jsp?sucesso=SUCESSO AO EXCLUIR O CLIENTE");
        } else {
            response.sendRedirect("../cliente.jsp?erro=PROBLEMAS AO EXCLUIR O CLIENTE");
        }
   %>

</html>