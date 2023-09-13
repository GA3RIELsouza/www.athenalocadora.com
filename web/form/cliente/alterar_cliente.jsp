<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Clientes"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
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
            response.sendRedirect("cliente.jsp?sucessoAlterar=SUCESSO AO ALTERAR O CLIENTE");
        } else {
            response.sendRedirect("cliente.jsp?erroAlterar=PROBLEMAS AO ALTERAR O CLIENTE");
        }
   %>

</html>