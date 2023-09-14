<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Marcas"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        String vNomeMarca = request.getParameter("nomeMarca");

        Marcas mar = new Marcas();
        mar.setNomeMarca(vNomeMarca);
        if (mar.incluirMarca()){
            response.sendRedirect("marca.jsp?sucessoIncluir=SUCESSO AO INCLUIR A MARCA");
        } else {
            response.sendRedirect("marca.jsp?erroIncluir=PROBLEMAS AO INCLUIR A MARCA");
        }
    %>

</html>