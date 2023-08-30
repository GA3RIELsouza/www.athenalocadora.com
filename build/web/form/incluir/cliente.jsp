<%@page import="classes.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clientes | Athena Locadora</title>
        
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        
        <script src="/www.athenalocadora.com/js/jquery-1.2.6.pack.js"></script>
        <script src="/www.athenalocadora.com/js/jquery.maskedinput-1.1.4.pack.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#cpfCliente").mask("999.999.999-99");
            });
            
            $(document).ready(function(){
                $("#foneCliente").mask("(99)99999-9999");
            });
            
            $(document).ready(function(){
                $("#nrCartaoDebCred").mask("9999 9999 9999 9999");
            });
            
            if (localStorage.getItem("tema")) {
                var elementos  = document.getElementsByTagName("*");
                
                for (var i = 0; i < elementos.length; i++) {
                    elementos[i].classList.remove("tema-azul", "tema-verde", "tema-laranja", "tema-cinza");
                    elementos[i].classList.add(localStorage.getItem("tema"));
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
        
        <span class="outer">
            <div class="title-form">
                <h1>
                    Clientes
                </h1>
            </div>

            <div class="operation-selector">
                
                <a class="operation selected">
                    Incluir
                </a>
                
                <a href="../excluir/cliente.jsp" class="operation">
                    Excluir
                </a>

                <a href="../alterar/cliente.jsp" class="operation">
                    Alterar
                </a>
                
                <a href="../consultar/cliente.jsp" class="operation">
                    Consultar
                </a>
                
            </div>
        </span>
        
        <div class="vertical-space"></div>
        
        <form action="back/incluir_cliente.jsp" method="post" class="outer">
            
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
                <label for="cpfCliente">CPF</label><br>
                <input type="text" id="cpfCliente" name="cpfCliente" placeholder="Insira o CPF" minlength="14" maxlength="14" required>
            </div>
            
            <div class="form-input">
                <label for="nomeCliente">Nome</label><br>
                <input type="text" id="nomeCliente" name="nomeCliente" placeholder="Insira o nome" maxlength="40" required>
            </div>
            
            <div class="form-input">
                <label for="foneCliente">Telefone</label><br>
                <input type="tel" id="foneCliente" name="foneCliente" placeholder="Insira o número de telefone" minlength="15" maxlength="15" required>
            </div>
            
            <div class="form-input">
                <label for="emailCliente">E-mail</label><br>
                <input type="email" id="emailCliente" name="emailCliente" placeholder="Insira o e-mail" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" maxlength="50" required>
            </div>
            
            <div class="form-input">
                <label for="nrCartaoDebCred">Nº cartão débito/crédito</label><br>
                <input type="text" id="nrCartaoDebCred" name="nrCartaoDebCred" placeholder="Insira o número do cartão" minlength="19" maxlength="19">
            </div>
            
            <div class="form-input">
                <label for="chavePix">Chave PIX</label><br>
                <input type="text" id="chavePix" name="chavePix" placeholder="Insira a chave PIX" maxlength="60">
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Confirmar
                </button>
                
                <button type="reset">
                    Reiniciar
                </button>
            </div>
            
        </form>
            
        <div class="vertical-space"></div>
        
        <div class="home">
            <a href="/www.athenalocadora.com/inicio.jsp" class="home-button outer">
                Voltar
            </a>
        </div>
        
        <div class="vertical-space"></div>
        
        <%@include file="/include/theme.jsp"%>
            
    </body>
    
</html>