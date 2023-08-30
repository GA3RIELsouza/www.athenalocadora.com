<%@page import="classes.Usuarios"%>
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
        String vCpfCliente      = request.getParameter("cpfCliente");
        String vNomeCliente     = request.getParameter("nomeCliente");
        String vFoneCliente     = request.getParameter("foneCliente");
        String vEmailCliente    = request.getParameter("emailCliente");
        String vNrCartaoDebCred = request.getParameter("nrCartaoDebCred");
        String vChavePix        = request.getParameter("chavePix");

        Clientes cli = new Clientes();
        cli.setCpfCliente(vCpfCliente);
        cli.setNomeCliente(vNomeCliente);
        cli.setFoneCliente(vFoneCliente);
        cli.setEmailCliente(vEmailCliente);
        cli.setNrCartaoDebCred(vNrCartaoDebCred);
        cli.setChavePix(vChavePix);
        if (cli.alterarCliente()){
            response.sendRedirect("../cliente.jsp?sucesso=SUCESSO AO ALTERAR O CLIENTE");
        } else {
            response.sendRedirect("../cliente.jsp?erro=PROBLEMAS AO ALTERAR O CLIENTE");
        }
   %>

</html>