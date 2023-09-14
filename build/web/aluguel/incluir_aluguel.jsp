<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Alugueis"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <%
        int
        vIdVeiculo             = Integer.parseInt(request.getParameter("idVeiculo"));
        String  vCpfCliente    = request.getParameter("cpfCliente");
        Timestamp vDataAluguel = Timestamp.valueOf(request.getParameter("dataAluguel").replace(request.getParameter("dataAluguel").charAt(10),' ') + ":00");
        Timestamp vDataDevolucao;
        if(request.getParameter("dataDevolucao").length() >= 16) {
            vDataDevolucao     = Timestamp.valueOf(request.getParameter("dataDevolucao").replace(request.getParameter("dataDevolucao").charAt(10),' ') + ":00");
        }else {
            vDataDevolucao     = null;
        }
        Timestamp vDataEstimadaDevolucao = Timestamp.valueOf(request.getParameter("dataEstimadaDevolucao").replace(request.getParameter("dataEstimadaDevolucao").charAt(10),' ') + ":00");
        boolean vPagamento               = Boolean.parseBoolean(request.getParameter("pagamento"));

        Alugueis alu = new Alugueis();
        alu.setIdVeiculo(vIdVeiculo);
        alu.setCpfCliente(vCpfCliente);
        alu.setDataAluguel(vDataAluguel);
        alu.setDataDevolucao(vDataDevolucao);
        alu.setDataEstimadaDevolucao(vDataEstimadaDevolucao);
        alu.setPagamento(vPagamento);
        if (alu.locarVeiculo()){
            response.sendRedirect("aluguel.jsp?sucessoIncluir=SUCESSO AO INCLUIR O ALUGUEL");
        } else {
            response.sendRedirect("aluguel.jsp?erroIncluir=PROBLEMAS AO INCLUIR O ALUGUEL");
        }
   %>

</html>