<%@include file="/include/check_login.jsp"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        Cookie themeId;
        String nome   = "themeId";
        String tema   = request.getParameter("tema");
        int    maxAge = Integer.MAX_VALUE;
        String path   = "/www.athenalocadora.com";
        
        themeId = new Cookie(nome, tema);
        themeId.setMaxAge(maxAge);
        themeId.setPath(path);
        
        response.addCookie(themeId);
        response.sendRedirect("tema.jsp?sucessoAlterar=SUCESSO AO ALTERAR O TEMA");
   %>

</html>