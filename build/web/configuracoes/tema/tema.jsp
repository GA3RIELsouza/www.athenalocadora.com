<%@include file="/include/check_login.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tema | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="images/favicon.ico?v=1">
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
        
        <form action="alterar_tema.jsp" method="post" class="outer">
            
            <div class="title">
                <h1>
                    Tema
                </h1>
            </div>
            
            <%
                if(true) {
                    String operacao = "Alterar";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="tema">Modelo</label><br>
                <select name="tema" id="tema" required>
                    <option value="" disabled selected>Informe o tema</option>
                    <option value=0>Claro</option>
                    <option value=1>Escuro</option>
                    <option value=2>Azul</option>
                    <option value=3>Verde</option>
                    <option value=4>Laranja</option>
                </select>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Alterar
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