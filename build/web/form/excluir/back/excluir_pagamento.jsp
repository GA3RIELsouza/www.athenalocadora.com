<%@page import="classes.Usuarios"%>
<%@page import="classes.Pagamentos"%>
<%@page import="java.sql.Date"%>
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

        int vIdPagamento = Integer.parseInt(request.getParameter("idPagamento"));
        int vIdAluguel   = Integer.parseInt(request.getParameter("idAluguel"));

        Pagamentos pag = new Pagamentos();
        pag.setIdPagamento(vIdPagamento);
        pag.setIdAluguel(vIdAluguel);
        if (pag.excluirPagamento()){
            response.sendRedirect("../pagamento.jsp?sucesso=SUCESSO AO EXCLUIR O PAGAMENTO");
        } else {
            response.sendRedirect("../pagamento.jsp?erro=PROBLEMAS AO EXCLUIR O PAGAMENTO");
        }
   %>

</html>