<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Usuarios"%>
<%@page import="classes.Sessoes"%>
<%@page import="java.io.PrintWriter"%>

<%
    String vNovaSenha  = request.getParameter("novaSenha");
    String vSenhaAtual = request.getParameter("senhaAtual");

    Usuarios usu = new Usuarios();

    usu = usu.checkLoginSenha();

    if(usu != null) {
        if(usu.getSenha().equals(vSenhaAtual)) {
            Sessoes ses2 = new Sessoes();

            if(cookies != null) {
                for(Cookie atual : cookies) {
                     if(atual.getName().equals("chaveSessao")) {
                        ses2.setChaveSessao(atual.getValue());
                    }
                }
            }

            ses2 = ses2.checkLoginChave();

            if(ses2 != null) {
                usu.setSenha(vNovaSenha);
                usu.setLogin(ses2.getLogin());

                if(usu.alterarSenha()){
                    response.sendRedirect("/www.athenalocadora.com/logoff.jsp?sucessoAlterar=SUCESSO AO ALTERAR A SENHA");
                } else {
                    response.sendRedirect("../senha.jsp?erroLoginSenha=PROBLEMAS AO ALTERAR A SENHA");
                }
            }
        }else {
            response.sendRedirect("../senha.jsp?erroLoginSenha=SENHA ATUAL INCORRETA");
        }
    }
%>