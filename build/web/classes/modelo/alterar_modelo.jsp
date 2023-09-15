<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Modelos"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        int vIdModelo = Integer.parseInt(request.getParameter("idModelo"));
        int vIdMarca  = Integer.parseInt(request.getParameter("idMarca"));
        String vNomeModelo = request.getParameter("nomeModelo");
        String vTipoModelo = request.getParameter("tipoModelo");

        Modelos mod = new Modelos();
        mod.setIdModelo(vIdModelo);
        mod.setIdMarca(vIdMarca);
        mod.setNomeModelo(vNomeModelo);
        mod.setTipoModelo(vTipoModelo);
        if (mod.alterarModelo()){
            response.sendRedirect("modelo.jsp?sucessoAlterar=SUCESSO AO ALTERAR O MODELO");
        } else {
            response.sendRedirect("modelo.jsp?erroAlterar=PROBLEMAS AO ALTERAR O MODELO");
        }
    %>

</html>