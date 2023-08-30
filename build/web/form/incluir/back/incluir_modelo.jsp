<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Modelos"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        int    vIdMarca    = Integer.parseInt(request.getParameter("idMarca"));
        String vNomeModelo = request.getParameter("nomeModelo");
        String vTipoModelo = request.getParameter("tipoModelo");

        Modelos mod = new Modelos();
        mod.setIdMarca(vIdMarca);
        mod.setNomeModelo(vNomeModelo);
        mod.setTipoModelo(vTipoModelo);
        if (mod.incluirModelo()){
            response.sendRedirect("../modelo.jsp?sucesso=SUCESSO AO INCLUIR O MODELO");
        } else {
            response.sendRedirect("../modelo.jsp?erro=PROBLEMAS AO INCLUIR O MODELO");
        }
    %>

</html>