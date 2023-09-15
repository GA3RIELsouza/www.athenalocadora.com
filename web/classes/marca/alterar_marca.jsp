<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Marcas"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        int    vIdMarca   = Integer.parseInt(request.getParameter("idMarca"));
        String vNomeMarca = request.getParameter("nomeMarca");

        Marcas mar = new Marcas();
        mar.setIdMarca(vIdMarca);
        mar.setNomeMarca(vNomeMarca);
        if (mar.alterarMarca()){
            response.sendRedirect("marca.jsp?sucessoAlterar=SUCESSO AO ALTERAR A MARCA");
        } else {
            response.sendRedirect("marca.jsp?erroAlterar=PROBLEMAS AO ALTERAR A MARCA");
        }
    %>

</html>