<%@page import="classes.Usuarios"%>
<%@page import="classes.Veiculos"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt">

    <%
            Cookie[] cookies = request.getCookies();
            Usuarios usu     = new Usuarios();
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

    <%
        int     vMarcaVeiculo      = Integer.parseInt(request.getParameter("idMarca"));
        int     vModeloVeiculo     = Integer.parseInt(request.getParameter("idModelo"));
        String  vPlacaVeiculo      = request.getParameter("placaVeiculo");
        String  vCorPredominante   = request.getParameter("corPredominante");
        int     vAnoFabricacao     = Integer.parseInt(request.getParameter("anoFabricacao"));
        boolean vDisponivel        = Boolean.parseBoolean(request.getParameter("disponivel"));
        boolean vTemArCondicionado = Boolean.parseBoolean(request.getParameter("temArCondicionado"));
        boolean vTemDirHidraulica  = Boolean.parseBoolean(request.getParameter("temDirHidraulica"));
        boolean vRevisado          = Boolean.parseBoolean(request.getParameter("revisado"));

        Veiculos vei = new Veiculos();
        vei.setIdMarca(vMarcaVeiculo);
        vei.setIdModelo(vModeloVeiculo);
        vei.setPlacaVeiculo(vPlacaVeiculo);
        vei.setCorPredominante(vCorPredominante);
        vei.setAnoFabricacao(vAnoFabricacao);
        vei.setDisponivel(vDisponivel);
        vei.setTemArCondicionado(vTemArCondicionado);
        vei.setTemDirHidraulica(vTemDirHidraulica);
        vei.setRevisado(vRevisado);
        if (vei.incluirVeiculo()){
            response.sendRedirect("../veiculo.jsp?sucesso=SUCESSO AO INCLUIR O VEICULO");
        } else {
            response.sendRedirect("../veiculo.jsp?erro=PROBLEMAS AO INCLUIR O VEICULO");
        }
   %>

</html>