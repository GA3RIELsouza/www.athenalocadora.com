<%@page import="classes.Usuarios"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <%
        Usuarios usu = new Usuarios();

        String vLogin  = request.getParameter("login");
        String vSenha  = request.getParameter("senha");

        usu.setLogin(vLogin);
        usu.setSenha(vSenha);

        if (usu.checkLogin()){
            String sessionString = (vLogin + "§" + vSenha + "§" + LocalDateTime.now());
            Cookie loginCookie   = new Cookie("sessionId", sessionString);

            usu.setSessionId(sessionString);
            usu.createSessionId();

            loginCookie.setMaxAge(60*60*24*31);
            response.addCookie(loginCookie);

            response.sendRedirect("inicio.jsp");
        } else {
            response.sendRedirect("index.jsp?erro=LOGIN OU SENHA INCORRETOS");
        }
    %>
        
</html>