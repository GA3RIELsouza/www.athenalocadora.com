<%@page import="classes.Usuarios"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <%
        Cookie[] cookies = request.getCookies();
        Usuarios  usu     = new Usuarios();
        
        String   vLogin  = request.getParameter("login");
        String   vSenha  = request.getParameter("senha");

        if(cookies != null) {
           for(Cookie atual : cookies) {
                if(atual.getName().equals("sessionId")) {
                    atual.setMaxAge(0);
                    
                    usu.setSessionId(atual.getValue());
                    usu.deleteSessionId();
                    
                    response.addCookie(atual);
                    break;
                }
            }
        }
        
        response.sendRedirect("/www.athenalocadora.com/index.jsp");
    %>
    
</html>