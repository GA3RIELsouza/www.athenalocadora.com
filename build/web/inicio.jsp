<%@include file="/include/check_login.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Início | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="images/favicon.ico?v=1">
        <link href="css/styles.css" rel="stylesheet">
        <%@include file="/include/theme.jsp"%>
        
    </head>
    
    <body>
        
        <%@include file="/include/header.html"%>
        
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        
        <div class="menu outer">
            
            <div class="title">
                <h1>
                    Seja bem-vindo(a)
                </h1>
            </div>
        
            <div class="menu-div">
                <a href="classes/cliente/cliente.jsp?incluir" class="menu-anchor" title="teste">
                    Clientes
                </a>
            </div>
            
            <div class="menu-div">
                <a href="classes/veiculo/veiculo.jsp?incluir" class="menu-anchor">
                    Veículos
                </a>
            </div>
            
            <div class="menu-div">
                <a href="classes/marca/marca.jsp?incluir" class="menu-anchor">
                    Marcas
                </a>
            </div>
            
            <div class="menu-div">
                <a href="classes/modelo/modelo.jsp?incluir" class="menu-anchor">
                    Modelos
                </a>
            </div>
            
            <div class="menu-div">
                <a href="classes/aluguel/aluguel.jsp?incluir" class="menu-anchor">
                    Aluguéis
                </a>
            </div>
            
            <div class="menu-div">
                <a href="classes/pagamento/pagamento.jsp?incluir" class="menu-anchor">
                    Pagamentos
                </a>
            </div>
            
        </div>
        
    </body>
    
</html>