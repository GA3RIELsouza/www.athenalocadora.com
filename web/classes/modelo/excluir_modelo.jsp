<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Modelos"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        int vIdModelo = Integer.parseInt(request.getParameter("idModelo"));
        int vIdMarca  = Integer.parseInt(request.getParameter("idMarca"));

        Modelos mod = new Modelos();
        mod.setIdModelo(vIdModelo);
        mod.setIdMarca(vIdMarca);
        if (mod.excluirModelo()){
            response.sendRedirect("modelo.jsp?sucessoExcluir=SUCESSO AO EXCLUIR O MODELO");
        } else {
            response.sendRedirect("modelo.jsp?erroExcluir=PROBLEMAS AO EXCLUIR O MODELO");
        }
   %>

</html>