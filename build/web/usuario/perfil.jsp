<%@include file="/include/check_login.jsp"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil do usuário | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="../images/favicon.ico?v=1">
        <link href="../css/styles.css" rel="stylesheet">
        
        <script>
            function goBack() {
                if (document.referrer.includes('senha.jsp')) {
                    window.location.href = '/www.athenalocadora.com/inicio.jsp';
                } else {
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
        
        <div class="menu outer">
            
            <div class="title">
                <h1>
                    Perfil do usuário
                </h1>
            </div>
            
            <%
                usu = usu.consultarLoginSenha();
                
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
            %>
            
        </div>
        
        <div class="vertical-space"></div>
        
        <div class="home">
            <a onclick="goBack()" class="outer">
                <button class="home-button">
                    Voltar
                </button>
            </a>
        </div>
        
        <%@include file="/include/theme.html"%>
        
    </body>
    
</html>