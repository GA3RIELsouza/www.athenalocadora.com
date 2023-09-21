<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Usuarios"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil do usuário | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="../images/favicon.ico?v=1">
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
        
        <div class="menu outer">
            
            <div class="title">
                <h1>
                    Perfil do usuário
                </h1>
            </div>
            
            <%
                Usuarios usu = new Usuarios();
                usu = usu.checkSenha();
                
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
            <a href="../configuracoes.jsp" class="home-button outer">
                Voltar
            </a>
        </div>
        
    </body>
    
</html>