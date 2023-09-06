<%@include file="/include/check_login.jsp"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Início | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="images/favicon.ico?v=1">
        <link href="css/styles.css" rel="stylesheet">
        
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
                <a href="incluir/cliente.jsp" class="menu-anchor">
                    Clientes
                </a>
            </div>
            
            <div class="menu-div">
                <a href="incluir/veiculo.jsp" class="menu-anchor">
                    Veículos
                </a>
            </div>
            
            <div class="menu-div">
                <a href="incluir/marca.jsp" class="menu-anchor">
                    Marcas
                </a>
            </div>
            
            <div class="menu-div">
                <a href="incluir/modelo.jsp" class="menu-anchor">
                    Modelos
                </a>
            </div>
            
            <div class="menu-div">
                <a href="incluir/aluguel.jsp" class="menu-anchor">
                    Aluguéis
                </a>
            </div>
            
            <div class="menu-div">
                <a href="incluir/pagamento.jsp" class="menu-anchor">
                    Pagamentos
                </a>
            </div>
            
        </div>
        
        <%@include file="/include/theme.html"%>
        
    </body>
    
</html>