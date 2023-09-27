<%@include file="/include/check_login.jsp"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.PrintWriter"%>

<%
    String vNovaSenha  = request.getParameter("novaSenha");
    String vSenhaAtual = request.getParameter("senhaAtual");
    
    Sessoes ses2 = new Sessoes();
    Calendar cal = Calendar.getInstance();
    
    if(cookies != null) {
        for(Cookie atual : cookies) {
             if(atual.getName().equals("tokenSessao")) {
                atual.setMaxAge(60*60*24*7);
                atual.setPath("/www.athenalocadora.com");
                
                response.addCookie(atual);
                 
                ses2.setTokenSessao(atual.getValue());
            }
        }
    }

    ses2 = ses2.checkLoginChave();

    if(ses2 != null) {
        
        cal.add(Calendar.DAY_OF_MONTH, 7);
        Timestamp vDataFim = new Timestamp(cal.getTimeInMillis());
        
        ses2.setDataFim(vDataFim);
        ses2.setLogin(ses2.getLogin());
        
        if(ses2.atualizarTokenSessao()) {
            response.sendRedirect("usuario.jsp?sucessoAtualizarToken=SUCESSO AO ATUALIZAR O TOKEN");
        } else {
            response.sendRedirect("usuario.jsp?erroAtualizarToken=PROBLEMAS AO ATUALIZAR O TOKEN");
        }
    }
%>