<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Clientes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">
    
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clientes | Athena Locadora</title>
        
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        
        <script src="/www.athenalocadora.com/js/jquery-1.2.6.pack.js"></script>
        <script src="/www.athenalocadora.com/js/jquery.maskedinput-1.1.4.pack.js"></script>
        <script>
            $(document).ready(function(){
                $("#foneCliente").mask("(99)99999-9999");
            });
            
            $(document).ready(function(){
                $("#nrCartaoDebCred").mask("9999 9999 9999 9999");
            });
        </script>
        
    </head>
    
    <body>
        
        <%@include file="/include/header.html"%>
        
        <div class="vertical-space"></div>
        <div class="vertical-space"></div>
        
        <span class="outer">
            <div class="title-form">
                <h1>
                    Clientes
                </h1>
            </div>

            <div class="operation-selector">

                <a href="../incluir/cliente.jsp" class="operation">
                    Incluir
                </a>

                <a href="../excluir/cliente.jsp" class="operation">
                    Excluir
                </a>

                <a class="operation selected">
                    Alterar
                </a>

                <a href="../consultar/cliente.jsp" class="operation">
                    Consultar
                </a>

            </div>
        </span>
        
        <div class="vertical-space"></div>
        
        <form action="back/alterar_cliente.jsp" method="post" class="outer">
            
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
                <label for="cpfCliente">CPF <small class="no-select">(buscar por)</small></label><br>
                <select name="cpfCliente" id="cpfCliente" required>
                    <option value="" disabled selected>Insira o CPF</option>
                    <%
                        Clientes cli = new Clientes();
                        List<Clientes> listaClientes = new ArrayList<>();
                        listaClientes = cli.consultarClientes();
                        
                        String cpfConsulta = request.getParameter("cpf") != null ? request.getParameter("cpf") : "";

                        for(Clientes c : listaClientes) {
                            String fCpfCliente = c.getCpfCliente();
                            String selectedAttribute = fCpfCliente.equals(cpfConsulta) ? "selected" : "";
                    %>
                    <option value="<%= fCpfCliente%>" <%= selectedAttribute %>><%= fCpfCliente%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-input">
                <label for="nomeCliente">Nome</label><br>
                <input type="text" id="nomeCliente" name="nomeCliente" placeholder="Insira o nome" maxlength="40" value="<%=request.getParameter("nome") != null ? request.getParameter("nome") : ""%>" required>
            </div>
            
            <div class="form-input">
                <label for="foneCliente">Telefone</label><br>
                <input type="tel" id="foneCliente" name="foneCliente" placeholder="Insira o número de telefone" minlength="15" maxlength="15" value="<%=request.getParameter("fone") != null ? request.getParameter("fone") : ""%>" required>
            </div>
            
            <div class="form-input">
                <label for="emailCliente">E-mail</label><br>
                <input type="email" id="emailCliente" name="emailCliente" placeholder="Insira o e-mail" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" maxlength="50" value="<%=request.getParameter("email") != null ? request.getParameter("email") : ""%>" required>
            </div>
            
            <div class="form-input">
                <label for="nrCartaoDebCred">Nº cartão débito/crédito</label><br>
                <input type="text" id="nrCartaoDebCred" name="nrCartaoDebCred" placeholder="Insira o número do cartão" minlength="19" maxlength="19" value="<%=request.getParameter("cartao") != null ? request.getParameter("cartao") : ""%>">
            </div>
            
            <div class="form-input">
                <label for="chavePix">Chave PIX</label><br>
                <input type="text" id="chavePix" name="chavePix" placeholder="Insira a chave PIX" maxlength="60" value="<%=request.getParameter("pix") != null ? request.getParameter("pix") : ""%>">
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
            
        <%@include file="/include/theme.html"%>
        
    </body>
    
</html>