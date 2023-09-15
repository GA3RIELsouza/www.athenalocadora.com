<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Pagamentos"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%

        int vIdPagamento = Integer.parseInt(request.getParameter("idPagamento"));
        int vIdAluguel   = Integer.parseInt(request.getParameter("idAluguel"));

        Pagamentos pag = new Pagamentos();
        pag.setIdPagamento(vIdPagamento);
        pag.setIdAluguel(vIdAluguel);
        if (pag.excluirPagamento()){
            response.sendRedirect("pagamento.jsp?sucessoExcluir=SUCESSO AO EXCLUIR O PAGAMENTO");
        } else {
            response.sendRedirect("pagamento.jsp?erroExcluir=PROBLEMAS AO EXCLUIR O PAGAMENTO");
        }
   %>

</html>