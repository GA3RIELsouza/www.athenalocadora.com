<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Marcas"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        int vIdMarca = Integer.parseInt(request.getParameter("idMarca"));

        Marcas mar = new Marcas();
        mar.setIdMarca(vIdMarca);
        if (mar.excluirMarca()){
            response.sendRedirect("marca.jsp?sucessoExcluir=SUCESSO AO EXCLUIR A MARCA");
        } else {
            response.sendRedirect("marca.jsp?erroExcluir=PROBLEMAS AO EXCLUIR A MARCA");
        }
   %>

</html>