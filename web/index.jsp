<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="images/favicon.ico?v=1">
        <link href="css/styles.css" rel="stylesheet">
        
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
            
            <div class="sucesso" id="sucesso">
                <%
                    if(request.getParameter("sucesso") != null)         
                        out.write(request.getParameter("sucesso"));
                %>
            </div>
            
            <div class="erro" id="erro">
                <%
                    if(request.getParameter("erro") != null)         
                        out.write(request.getParameter("erro"));
                %>
            </div>
            
            <div class="form-input">
                <label for="login">Login</label><br>
                <input type="email" id="login" name="login" placeholder="Insira seu login" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" maxlength="50" required>
            </div>
            
            <div class="form-input">
                <label for="senha">Senha</label><br>
                <input type="password" id="senha" name="senha" placeholder="Insira sua senha" minlength="8" maxlength="50" required>
            </div>
            
            <div class="form-button" style="width: 40%; margin: auto;">
                <button type="submit">
                    Entrar
                </button>
            </div>
            
        </form>
            
        <%@include file="/include/theme.html"%>
        
    </body>
    
</html>