<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Pagamentos"%>
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

        int    vIdPagamento      = Integer.parseInt(request.getParameter("idPagamento"));
        int    vIdAluguel        = Integer.parseInt(request.getParameter("idAluguel"));
        Timestamp vDataPagamento = Timestamp.valueOf(request.getParameter("dataPagamento").replace(request.getParameter("dataPagamento").charAt(10),' ') + ":00");
        String    vTipoPagamento = request.getParameter("tipoPagamento");
        double    vVlrPagamento  = Double.parseDouble(request.getParameter("vlrPagamento"));

        Pagamentos pag = new Pagamentos();
        pag.setIdPagamento(vIdPagamento);
        pag.setIdAluguel(vIdAluguel);
        pag.setDataPagamento(vDataPagamento);
        pag.setTipoPagamento(vTipoPagamento);
        pag.setVlrPagamento(vVlrPagamento);
        if (pag.alterarPagamento()){
            response.sendRedirect("../pagamento.jsp?sucesso=SUCESSO AO ALTERAR O PAGAMENTO");
        } else {
            response.sendRedirect("../pagamento.jsp?erro=PROBLEMAS AO ALTERAR O PAGAMENTO");
        }
   %>

</html>