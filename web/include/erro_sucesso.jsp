<script defer>
    document.addEventListener("DOMContentLoaded", function() {
        if(window.location.href.indexOf("sucesso<%= operacao%>") > -1) {
            document.getElementById("sucesso<%= operacao%>").style.display = "";
        }else if(window.location.href.indexOf("erro<%= operacao%>") > -1) {
            document.getElementById("erro<%= operacao%>").style.display = "";
        }
    });
</script>

<div class="sucesso" id="sucesso<%= operacao%>" style="display: none;">
    <%
        if(request.getParameter("sucesso" + operacao) != null)         
            out.write(request.getParameter("sucesso" + operacao));
    %>
</div>

<div class="erro" id="erro<%= operacao%>" style="display: none;">
    <%
        if(request.getParameter("erro" + operacao) != null)         
            out.write(request.getParameter("erro" + operacao));
    %>
</div>