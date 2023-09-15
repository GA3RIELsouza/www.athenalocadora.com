<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Clientes"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <%
        String vCpfCliente = request.getParameter("cpfCliente");

        Clientes cli = new Clientes();
        cli.setCpfCliente(vCpfCliente);
        if (cli.excluirCliente()){
            response.sendRedirect("cliente.jsp?sucessoExcluir=SUCESSO AO EXCLUIR O CLIENTE");
        } else {
            response.sendRedirect("cliente.jsp?erroExcluir=PROBLEMAS AO EXCLUIR O CLIENTE");
        }
   %>

</html>