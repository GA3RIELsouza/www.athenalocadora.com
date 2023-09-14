<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Alugueis"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <%
        int       vIdAluguel     = Integer.parseInt(request.getParameter("idAluguel"));
        String    vCpfCliente    = request.getParameter("cpfCliente");
        Timestamp vDataDevolucao = Timestamp.valueOf(request.getParameter("dataDevolucao").replace(request.getParameter("dataDevolucao").charAt(10),' ') + ":00");

        Alugueis alu = new Alugueis();
        alu.setIdAluguel(vIdAluguel);
        alu.setCpfCliente(vCpfCliente);
        alu.setDataDevolucao(vDataDevolucao);
        if (alu.devolverVeiculo()){
            response.sendRedirect("aluguel.jsp?sucessoAlterar=SUCESSO AO ATUALIZAR O STATUS ALUGUEL");
        } else {
            response.sendRedirect("aluguel.jsp?erroAlterar=PROBLEMAS AO ATUALIZAR O STATUS ALUGUEL");
        }
   %>

</html>