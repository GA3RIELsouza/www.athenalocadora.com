<%@page import="classes.Sessoes"%>

<%
    Cookie[] cookies = request.getCookies();
    Sessoes  ses     = new Sessoes();
    boolean  cookieEncontrado = false;

    if(cookies != null) {
       for(Cookie atual : cookies) {
            if(atual.getName().equals("chaveSessao")) {
                cookieEncontrado = true;
                ses.setChaveSessao(atual.getValue());

                if(!ses.checkChaveSessao()) {
                    response.sendRedirect("/www.athenalocadora.com/index.jsp");
                    break;
                }
            }
        }
    }
    
    if(!cookieEncontrado) {
        response.sendRedirect("/www.athenalocadora.com/index.jsp?aa");
    }
%>