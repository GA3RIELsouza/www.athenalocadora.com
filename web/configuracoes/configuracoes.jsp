<%@include file="/include/check_login.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Configurações | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        <%@include file="/include/theme.jsp"%>
        
        <script>
            function goBack() {
                if(document.referrer.includes("usuario.jsp") || document.referrer.includes("senha.jsp") || document.referrer.includes("tema.jsp")) {
                    window.location.href = "/www.athenalocadora.com/inicio.jsp";
                }else {
                    window.history.back();
                }
            }
        </script>
        
    </head>
    
    <body>
        
        <%@include file="/include/header.html"%>
        
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        
        <div class="menu outer">
            
            <div class="title">
                <h1>
                    Configurações
                </h1>
            </div>
            
            <div class="menu-div">
                <a href="usuario/usuario.jsp" class="menu-anchor">
                    Perfil do usuário
                </a>
            </div>
            
            
            <div class="menu-div">
                <a href="tema/tema.jsp" class="menu-anchor">
                    Tema
                </a>
            </div>
            
        </div>
        
        <div class="vertical-space"></div>
        
        <div class="home">
            <a onclick="goBack()" class="outer">
                <button class="home-button">
                    Voltar
                </button>
            </a>
        </div>
        
    </body>
    
</html>