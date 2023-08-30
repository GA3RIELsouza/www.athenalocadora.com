<%@page import="classes.Usuarios"%>
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
                    window.location.href = '/www.athenalocadora.com/index.jsp';
                } else {
                    window.history.back();
                }
            }
        </script>
        
    </head>
    
    <body>
        
        <%
            Cookie[] cookies = request.getCookies();
            Usuarios  usu     = new Usuarios();
            boolean  ok       = false;
            
            if(cookies != null) {
               for(Cookie atual : cookies) {
                    if(atual.getName().equals("sessionId")) {
                        usu.setSessionId(atual.getValue());
                        
                        if(usu.checkSessionId()) {
                            ok = true;
                        }
                    }
                }
            }

            if(ok == false) {
                response.sendRedirect("/www.athenalocadora.com/index.jsp");
            }
        %>
        
        <%@include file="/include/header.jsp"%>
        
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        
        <div class="menu outer">
            
            <div class="title">
                <h1>
                    Perfil do usuï¿½rio
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
        
        <%@include file="/include/theme.jsp"%>
        
    </body>
    
</html>