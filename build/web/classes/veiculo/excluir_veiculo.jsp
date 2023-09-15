<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Veiculos"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <%
        int vIdVeiculo = Integer.parseInt(request.getParameter("idVeiculo"));

        Veiculos vei = new Veiculos();
        vei.setIdVeiculo(vIdVeiculo);
        if (vei.excluirVeiculo()){
            response.sendRedirect("veiculo.jsp?sucessoExcluir=SUCESSO AO EXCLUIR O VEICULO");
        } else {
            response.sendRedirect("veiculo.jsp?erroExcluir=PROBLEMAS AO EXCLUIR O VEICULO");
        }
   %>

</html>