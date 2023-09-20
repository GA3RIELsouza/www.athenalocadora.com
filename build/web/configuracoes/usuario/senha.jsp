<%@include file="/include/check_login.jsp"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alterar senha | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="../images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        <%@include file="/include/theme.jsp"%>
        
        <script>
            function checkNovaSenha() {
                senha         = document.getElementById("novaSenha").value;
                confirmaSenha = document.getElementById("confirmaNovaSenha").value;
                message       = document.getElementById("message");
                
                if(senha === confirmaSenha) {
                    document.getElementById('message').innerHTML = '';
                    return true;
                } else if(senha !== "" && confirmaSenha !== ""){
                    document.getElementById('message').innerHTML = '(SENHA NÃO CONFERE)';
                    return false;
                }
                
                return false;
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
        
        <form onsubmit="return checkNovaSenha();" action="alterar_senha.jsp" method="post" class="outer">
            
            <div class="title">
                <h1>
                    Alterar senha
                </h1>
            </div>
            
            <%
                if(true) {
                    String operacao = "LoginSenha";
            %>
            <%@include file="/include/erro_sucesso.jsp"%>
            <%
                }
            %>
            
            <div class="form-input">
                <label for="cpfCliente">Senha atual</label><br>
                <input type="text" id="senhaAtual" name="senhaAtual" placeholder="Informe a senha atual" minlength="8" maxlength="50" required>
            </div>
            
            <div class="form-input">
                <label for="nomeCliente">Nova senha</label><br>
                <input type="password" id="novaSenha" name="novaSenha" placeholder="Informe a nova senha" minlength="8" maxlength="50" onchange="checkNovaSenha()" required>
            </div>
            
            <div class="form-input">
                <label for="foneCliente">Confirmar nova senha <span id="message" style="color: var(--falseColor); font-weight: bold;"></span></label><br>
                <input type="password" id="confirmaNovaSenha" name="confirmaNovaSenha" placeholder="Informe a nova senha" minlength="8" maxlength="50" onchange="checkNovaSenha()" required>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Alterar
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
        </form>
        
        <div class="vertical-space"></div>
        
        <div class="home">
            <a href="usuario.jsp" class="outer">
                <button class="home-button">
                    Voltar
                </button>
            </a>
        </div>
        
    </body>
    
</html>