<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Veiculos"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
        String  marcaModeloString = request.getParameter("marcaModelo");
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
        
        String  vTipoPlacaVeiculo  = request.getParameter("tipoPlacaVeiculo");
        String  vPlacaVeiculo      = request.getParameter("placaVeiculo").toUpperCase();
        String  vCorPredominante   = request.getParameter("corPredominante");
        int     vAnoFabricacao     = Integer.parseInt(request.getParameter("anoFabricacao"));
        boolean vDisponivel        = Boolean.parseBoolean(request.getParameter("disponivel"));
        boolean vTemArCondicionado = Boolean.parseBoolean(request.getParameter("temArCondicionado"));
        boolean vTemDirHidraulica  = Boolean.parseBoolean(request.getParameter("temDirHidraulica"));
        boolean vRevisado          = Boolean.parseBoolean(request.getParameter("revisado"));

        Veiculos vei = new Veiculos();
        vei.setIdMarca(vIdMarca);
        vei.setIdModelo(vIdModelo);
        vei.setTipoPlacaVeiculo(vTipoPlacaVeiculo);
        vei.setPlacaVeiculo(vPlacaVeiculo);
        vei.setCorPredominante(vCorPredominante);
        vei.setAnoFabricacao(vAnoFabricacao);
        vei.setDisponivel(vDisponivel);
        vei.setTemArCondicionado(vTemArCondicionado);
        vei.setTemDirHidraulica(vTemDirHidraulica);
        vei.setRevisado(vRevisado);
        if (vei.incluirVeiculo()){
            response.sendRedirect("veiculo.jsp?sucessoIncluir=SUCESSO AO INCLUIR O VEICULO");
        } else {
            response.sendRedirect("veiculo.jsp?erroIncluir=PROBLEMAS AO INCLUIR O VEICULO");
        }
   %>

</html>