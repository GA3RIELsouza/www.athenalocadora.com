<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Veiculos"%>
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
        int vIdVeiculo = Integer.parseInt(request.getParameter("idVeiculo"));

        Veiculos vei = new Veiculos();
        vei.setIdVeiculo(vIdVeiculo);
        if (vei.excluirVeiculo()){
            response.sendRedirect("../veiculo.jsp?sucesso=SUCESSO AO EXCLUIR O VEICULO");
        } else {
            response.sendRedirect("../veiculo.jsp?erro=PROBLEMAS AO EXCLUIR O VEICULO");
        }
   %>

</html>