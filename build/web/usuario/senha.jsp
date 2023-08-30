<%@include file="/include/check_login.jsp"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alterar senha | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="../images/favicon.ico?v=1">
        <link href="../css/styles.css" rel="stylesheet">
        
        <script>
            function checkNovaSenha() {
                senha         = document.getElementById("novaSenha").value;
                confirmaSenha = document.getElementById("confirmaNovaSenha").value;
                message       = document.getElementById("message");
                
                if(senha === confirmaSenha) {
                    document.getElementById('message').innerHTML = '';
                    return true;
                } else if(senha !== "" && confirmaSenha !== ""){
                    document.getElementById('message').innerHTML = '(SENHA N�O CONFERE)';
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
        
        <form onsubmit="return checkNovaSenha();" action="back/alterar_senha.jsp" method="post" class="outer">
            
            <div class="title">
                <h1>
                    Alterar senha
                </h1>
            </div>
            
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
                <label for="cpfCliente">Senha atual</label><br>
                <input type="text" id="senhaAtual" name="senhaAtual" placeholder="Insira a senha atual" minlength="8" maxlength="50" required>
            </div>
            
            <div class="form-input">
                <label for="nomeCliente">Nova senha</label><br>
                <input type="password" id="novaSenha" name="novaSenha" placeholder="Insira a nova senha" minlength="8" maxlength="50" onchange="checkNovaSenha()" required>
            </div>
            
            <div class="form-input">
                <label for="foneCliente">Confirmar nova senha <span id="message" style="color: var(--falseColor); font-weight: bold;"></span></label><br>
                <input type="password" id="confirmaNovaSenha" name="confirmaNovaSenha" placeholder="Insira a nova senha" minlength="8" maxlength="50" onchange="checkNovaSenha()" required>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Confirmar
                </button>
                
                <button type="reset">
                    Limpar
                </button>
            </div>
        </form>
        
        <div class="vertical-space"></div>
        
        <div class="home">
            <a href="perfil.jsp" class="outer">
                <button class="home-button">
                    Voltar
                </button>
            </a>
        </div>
        
        <%@include file="/include/theme.html"%>
        
    </body>
    
</html>