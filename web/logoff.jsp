<%@page import="classes.Sessoes"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.PrintWriter"%>

<%
    Cookie[] cookies = request.getCookies();
    Sessoes  ses     = new Sessoes();
    Calendar cal     = Calendar.getInstance();

    if(cookies != null) {
       for(Cookie atual : cookies) {
            if(atual.getName().equals("tokenSessao")) {
                atual.setMaxAge(0);
                
                ses.setTokenSessao(atual.getValue());
                
                ses.encerrarSessao();

                response.addCookie(atual);
                break;
            }
        }
    }

    String alterarSenha = request.getParameter("sucessoAlterar");

    if(alterarSenha != null) {
        response.sendRedirect("/www.athenalocadora.com/index.jsp?sucessoLoginSenha=" + alterarSenha);
    }else {
        response.sendRedirect("/www.athenalocadora.com/index.jsp");
    }
%>