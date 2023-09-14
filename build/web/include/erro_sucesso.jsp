<div class="sucesso">
    <%
        if(request.getParameter("sucesso" + operacao) != null)         
            out.write(request.getParameter("sucesso" + operacao));
    %>
</div>

<div class="erro">
    <%
        if(request.getParameter("erro" + operacao) != null)         
            out.write(request.getParameter("erro" + operacao));
    %>
</div>