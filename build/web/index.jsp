<%@page import="classes.Sessoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <%
            Cookie[] cookies = request.getCookies();
            Sessoes  ses     = new Sessoes();

            if(cookies != null) {
                for(Cookie atual : cookies) {
                    if(atual.getName().equals("tokenSessao")) {
                        ses.setTokenSessao(atual.getValue());

                        if(ses.checkTokenSessao()) {
                            response.sendRedirect("/www.athenalocadora.com/inicio.jsp");
                            break;
                        }
                    }
                }
            }
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="images/favicon.ico?v=1">
        <link href="css/styles.css" rel="stylesheet">
        <%@include file="/include/theme.jsp"%>
        
    </head>
    
    <body>
        
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        
        <form action="login.jsp" method="post" class="outer">
            
            <h1 class="title">
                Login
            </h1>
            
            <%
                if(true) {
                    String operacao = "LoginSenha";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="login">Login</label><br>
                <input type="email" id="login" name="login" placeholder="Informe seu login" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" maxlength="50" required>
            </div>
            
            <div class="form-input">
                <label for="senha">Senha</label><br>
                <input type="password" id="senha" name="senha" placeholder="Informe sua senha" minlength="8" maxlength="50" required>
            </div>
            
            <div class="form-button" style="width: 40%; margin: auto;">
                <button type="submit">
                    Entrar
                </button>
            </div>
            
        </form>
        
    </body>
    
</html>