<%@include file="/include/check_login.jsp"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        String vNovaSenha  = request.getParameter("novaSenha");
        String vSenhaAtual = request.getParameter("senhaAtual");
        
        usu = usu.consultarLoginSenha();
        
        if(usu != null) {
            if(usu.getSenha().equals(vSenhaAtual)) {
                usu = new Usuarios();
                
                String vSessionId = "";
                
                for(Cookie atual : cookies) {
                    if(atual.getName().equals("sessionId")) {
                        vSessionId = atual.getValue();
                    }
                }
                
                usu.setSenha(vNovaSenha);
                usu.setSessionId(vSessionId);
                
                if(usu.alterarSenha()){
                    response.sendRedirect("/www.athenalocadora.com/logoff.jsp?sucesso=SUCESSO AO ALTERAR A SENHA");
                } else {
                    response.sendRedirect("../senha.jsp?erro=PROBLEMAS AO ALTERAR A SENHA");
                }
            }else {
                response.sendRedirect("../senha.jsp?erro=SENHA ATUAL INCORRETA");
            }
        }
   %>

</html>