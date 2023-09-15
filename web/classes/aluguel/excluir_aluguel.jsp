<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Alugueis"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        int    vIdAluguel  = Integer.parseInt(request.getParameter("idAluguel"));
        String vCpfCliente = request.getParameter("cpfCliente");

        Alugueis alu = new Alugueis();
        alu.setIdAluguel(vIdAluguel);
        alu.setCpfCliente(vCpfCliente);
        if (alu.cancelarLocacao()){
            response.sendRedirect("aluguel.jsp?sucessoExcluir=SUCESSO AO EXCLUIR O ALUGUEL");
        } else {
            response.sendRedirect("aluguel.jsp?erroExcluir=PROBLEMAS AO EXCLUIR O ALUGUEL");
        }
   %>

</html>