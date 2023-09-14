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
        
        <link href="/www.athenalocadora.com/css/styles.css" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="/www.athenalocadora.com/images/favicon.ico?v=1">
        
        <script src="/www.athenalocadora.com/js/jquery-1.2.6.pack.js"></script>
        <script src="/www.athenalocadora.com/js/jquery.maskedinput-1.1.4.pack.js"></script>
        <script>
            $(document).ready(function(){
                $("#cpfCliente1").mask("999.999.999-99");
                $("#foneCliente1").mask("(99)99999-9999");
                $("#nrCartaoDebCred1").mask("9999 9999 9999 9999");
                $("#foneCliente3").mask("(99)99999-9999");
                $("#nrCartaoDebCred3").mask("9999 9999 9999 9999");
            });
            
            function scriptModoConsulta() {
                var campoCpf        = document.getElementById("campoCpf");
                var selectCpf       = document.getElementById("cpfCliente4");
                var modoSelecionado = document.getElementById("modoConsulta").value;
                
                if(modoSelecionado === "0") {
                    campoCpf.style.display = "";
                    selectCpf.setAttribute("required", "");
                }else {
                    campoCpf.style.display = "none";
                    selectCpf.removeAttribute("required");
                    selectCpf.value = "";
                }
            }
            
            function limpaForm() {
                //É necessário uma função ao invés
                //do reset convencional nesse caso
                //por conta do campo "modoConsulta"
                event.preventDefault();
                document.getElementById("cpfCliente4").value = "";
            }
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

            <%@include file="/include/operation_selector.html"%>
            
        </span>
        
        <div class="vertical-space"></div>
        
        <form action="incluir_cliente.jsp" method="post" class="outer" id="form_incluir">
            
            <div class="sucesso">
                <%
                    if(request.getParameter("sucessoIncluir") != null)         
                        out.write(request.getParameter("sucessoIncluir"));
                %>
            </div>
            
            <div class="erro">
                <%
                    if(request.getParameter("erroIncluir") != null)         
                        out.write(request.getParameter("erroIncluir"));
                %>
            </div>
            
            <div class="form-input">
                <label for="cpfCliente1">CPF</label><br>
                <input type="text" id="cpfCliente1" name="cpfCliente" placeholder="Insira o CPF" minlength="14" maxlength="14" required>
            </div>
            
            <div class="form-input">
                <label for="nomeCliente1">Nome</label><br>
                <input type="text" id="nomeCliente1" name="nomeCliente" placeholder="Insira o nome" maxlength="40" required>
            </div>
            
            <div class="form-input">
                <label for="foneCliente1">Telefone</label><br>
                <input type="tel" id="foneCliente1" name="foneCliente" placeholder="Insira o número de telefone" minlength="15" maxlength="15" required>
            </div>
            
            <div class="form-input">
                <label for="emailCliente1">E-mail</label><br>
                <input type="email" id="emailCliente1" name="emailCliente" placeholder="Insira o e-mail" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" maxlength="50" required>
            </div>
            
            <div class="form-input">
                <label for="nrCartaoDebCred1">Nº cartão débito/crédito</label><br>
                <input type="text" id="nrCartaoDebCred1" name="nrCartaoDebCred" placeholder="Insira o número do cartão" minlength="19" maxlength="19">
            </div>
            
            <div class="form-input">
                <label for="chavePix1">Chave PIX</label><br>
                <input type="text" id="chavePix1" name="chavePix" placeholder="Insira a chave PIX" maxlength="60">
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
            
        <form action="alterar_cliente.jsp" method="post" class="outer" id="form_alterar">
            
            <div class="sucesso">
                <%
                    if(request.getParameter("sucessoAlterar") != null)         
                        out.write(request.getParameter("sucessoAlterar"));
                %>
            </div>
            
            <div class="erro">
                <%
                    if(request.getParameter("erroAlterar") != null)         
                        out.write(request.getParameter("erroAlterar"));
                %>
            </div>
            
            <div class="form-input">
                <label for="cpfCliente3">CPF <small class="no-select">(buscar por)</small></label><br>
                <select name="cpfCliente" id="cpfCliente3" required>
                    <option value="" disabled selected>Insira o CPF</option>
                    <%
                        Clientes cli = new Clientes();
                        List<Clientes> listaClientes = new ArrayList<>();
                        listaClientes = cli.consultarClientes();
                        
                        String cpfConsulta = request.getParameter("cpfAlterar") != null ? request.getParameter("cpfAlterar") : "";

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
                <label for="nomeCliente3">Nome</label><br>
                <input type="text" id="nomeCliente3" name="nomeCliente" placeholder="Insira o nome" maxlength="40" value="<%=request.getParameter("nome") != null ? request.getParameter("nome") : ""%>" required>
            </div>
            
            <div class="form-input">
                <label for="foneCliente3">Telefone</label><br>
                <input type="tel" id="foneCliente3" name="foneCliente" placeholder="Insira o número de telefone" minlength="15" maxlength="15" value="<%=request.getParameter("fone") != null ? request.getParameter("fone") : ""%>" required>
            </div>
            
            <div class="form-input">
                <label for="emailClient3e">E-mail</label><br>
                <input type="email" id="emailCliente3" name="emailCliente" placeholder="Insira o e-mail" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" maxlength="50" value="<%=request.getParameter("email") != null ? request.getParameter("email") : ""%>" required>
            </div>
            
            <div class="form-input">
                <label for="nrCartaoDebCred3">Nº cartão débito/crédito</label><br>
                <input type="text" id="nrCartaoDebCred3" name="nrCartaoDebCred" placeholder="Insira o número do cartão" minlength="19" maxlength="19" value="<%=request.getParameter("cartao") != null ? request.getParameter("cartao") : ""%>">
            </div>
            
            <div class="form-input">
                <label for="chavePix3">Chave PIX</label><br>
                <input type="text" id="chavePix3" name="chavePix" placeholder="Insira a chave PIX" maxlength="60" value="<%=request.getParameter("pix") != null ? request.getParameter("pix") : ""%>">
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
            
        <form action="excluir_cliente.jsp" method="post" class="outer" id="form_excluir">
            
            <div class="sucesso">
                <%
                    if(request.getParameter("sucessoExcluir") != null)         
                        out.write(request.getParameter("sucessoExcluir"));
                %>
            </div>
            
            <div class="erro">
                <%
                    if(request.getParameter("erroExcluir") != null)         
                        out.write(request.getParameter("erroExcluir"));
                %>
            </div>
            
            <div class="form-input">
                <label for="cpfCliente2">CPF <small class="no-select">(buscar por)</small></label><br>
                <select name="cpfCliente" id="cpfCliente2" required>
                    <option value="" disabled selected>Insira o CPF</option>
                    <%
                        List<Clientes> listaClientes3 = new ArrayList<>();
                        listaClientes3 = cli.consultarClientes();
                        
                        String cpfConsulta3 = request.getParameter("cpfExcluir") != null ? request.getParameter("cpfExcluir") : "";

                        for(Clientes c : listaClientes3) {
                            String fCpfCliente = c.getCpfCliente();
                            String selectedAttribute = fCpfCliente.equals(cpfConsulta3) ? "selected" : "";
                    %>
                    <option value="<%= fCpfCliente%>" <%= selectedAttribute %>><%= fCpfCliente%></option>
                    <%
                        }
                    %>
                </select>
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
            
        <form action="consultar_cliente.jsp" method="post" class="outer" id="form_consultar">
            
            <div class="form-input">
                <label for="modoConsulta">Modo de consulta</label><br>
                <select name="modoConsulta" id="modoConsulta" onchange="scriptModoConsulta()" required>
                    <option value="0">Por CPF</option>
                    <option value="1">Todos</option>
                </select>
            </div>
            
            <div class="form-input" id="campoCpf">
                <label for="cpfCliente4">CPF <small class="no-select">(buscar por)</small></label><br>
                <select name="cpfCliente" id="cpfCliente4" required>
                    <option value="" disabled selected>Insira o CPF</option>
                    <%
                        List<Clientes> listaClientes4 = new ArrayList<>();
                        listaClientes4 = cli.consultarClientes();

                        for(Clientes c : listaClientes4) {
                            String fCpfCliente = c.getCpfCliente();
                    %>
                    <option value="<%= fCpfCliente%>"><%= fCpfCliente%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="form-button">
                <button type="submit">
                    Confirmar
                </button>
                
                <button type="reset" onclick="limpaForm()">
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