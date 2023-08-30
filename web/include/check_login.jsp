<%@page import="classes.Usuarios"%>

<%
    Cookie[] cookies = request.getCookies();
    Usuarios  usu     = new Usuarios();
    boolean  ok       = false;

    if(cookies != null) {
       for(Cookie atual : cookies) {
            if(atual.getName().equals("sessionId")) {
                usu.setSessionId(atual.getValue());

                if(usu.checkSessionId()) {
                    ok = true;
                }
            }
        }
    }

    if(ok == false) {
        response.sendRedirect("/www.athenalocadora.com/index.jsp");
    }
%>