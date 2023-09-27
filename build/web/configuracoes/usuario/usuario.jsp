<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Usuarios"%>
<%@page import="classes.Sessoes"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil do usuário | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        <%@include file="/include/theme.jsp"%>
        
    </head>
    
    <body>
        
        <%@include file="/include/header.html"%>
        
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        
        <form action="atualizar_token.jsp" method="post" class="outer">
            
            <%
                if(true) {
                    String operacao = "AtualizarToken";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="title">
                <h1>
                    Perfil do usuário
                </h1>
            </div>
            
            <%
                Sessoes  ses2 = new Sessoes();
                
                if(cookies != null) {
                    for(Cookie atual : cookies) {
                         if(atual.getName().equals("tokenSessao")) {
                            ses2.setTokenSessao(atual.getValue());
                        }
                    }
                }
                
                ses2 = ses2.checkLoginChave();
                
                if(ses2 != null) {
                    Usuarios usu  = new Usuarios();
                    
                    usu.setLogin(ses2.getLogin());
                    
                    usu = usu.checkLoginSenha();

                    if(usu != null) {
            %>
        
            <div class="profile-field">
                <label>
                    Login
                </label>
                
                <br><br>
                
                <span class="info no-select">
                    <tt>
                        <%
                            out.print(usu.getLogin());
                        %>
                    </tt>
                </span>
            </div>
            
            <div class="profile-field">
                <label>
                    Senha
                </label>
                
                <br><br>
                
                <span class="info no-select">
                    <tt>
                        <%
                            String asterisks = new String(new char[usu.getSenha().length()]).replace('\0', '*');
                            if(asterisks.length() > 25) {
                                out.print("*************************...");
                            }else {
                                out.print(asterisks);
                            }
                        %>
                    </tt>
                </span>
                    
                <a href="senha.jsp" class="alterar-senha">
                    Alterar
                </a>
            </div>
            
            <%
                    }
                }
            %>
                
                <div class="form-button">
                    <button type="submit" style="visibility: visible;">
                        Atualizar token da sessão
                    </button>
                </div>
            
        </form>
        
        <div class="vertical-space"></div>
        
        <div class="home">
            <a href="../configuracoes.jsp" class="home-button outer">
                Voltar
            </a>
        </div>
        
    </body>
    
</html>