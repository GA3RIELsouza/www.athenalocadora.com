<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Veiculos"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        int     vIdVeiculo         = Integer.parseInt(request.getParameter("idVeiculo"));
        
        String  marcaModeloString       = request.getParameter("marcaModelo");
        int vIdMarca  = 0;
        int vIdModelo = 0;
        
        int contador = 1;
        for(String value : marcaModeloString.split("-")) {
            if(contador == 1) {
                vIdModelo = Integer.parseInt(value);
            }else if(contador == 3) {
                vIdMarca = Integer.parseInt(value);
            }
            contador++;
        }
        
        String  vPlacaVeiculo      = request.getParameter("placaVeiculo");
        String  vCorPredominante   = request.getParameter("corPredominante");
        int     vAnoFabricacao     = Integer.parseInt(request.getParameter("anoFabricacao"));
        boolean vDisponivel        = Boolean.parseBoolean(request.getParameter("disponivel"));
        boolean vTemArCondicionado = Boolean.parseBoolean(request.getParameter("temArCondicionado"));
        boolean vTemDirHidraulica  = Boolean.parseBoolean(request.getParameter("temDirHidraulica"));
        boolean vRevisado          = Boolean.parseBoolean(request.getParameter("revisado"));

        Veiculos vei = new Veiculos();
        vei.setIdVeiculo(vIdVeiculo);
        vei.setIdMarca(vIdMarca);
        vei.setIdModelo(vIdModelo);
        vei.setPlacaVeiculo(vPlacaVeiculo);
        vei.setCorPredominante(vCorPredominante);
        vei.setAnoFabricacao(vAnoFabricacao);
        vei.setDisponivel(vDisponivel);
        vei.setTemArCondicionado(vTemArCondicionado);
        vei.setTemDirHidraulica(vTemDirHidraulica);
        vei.setRevisado(vRevisado);
        if (vei.alterarVeiculo()){
            response.sendRedirect("../veiculo.jsp?sucesso=SUCESSO AO ALTERAR O VEICULO");
        } else {
            response.sendRedirect("../veiculo.jsp?erro=PROBLEMAS AO ALTERAR O VEICULO");
        }
   %>

</html>