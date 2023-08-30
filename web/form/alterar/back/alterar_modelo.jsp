<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Modelos"%>
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
        int vIdModelo = Integer.parseInt(request.getParameter("idModelo"));
        int vIdMarca  = Integer.parseInt(request.getParameter("idMarca"));
        String vNomeModelo = request.getParameter("nomeModelo");
        String vTipoModelo = request.getParameter("tipoModelo");

        Modelos mod = new Modelos();
        mod.setIdModelo(vIdModelo);
        mod.setIdMarca(vIdMarca);
        mod.setNomeModelo(vNomeModelo);
        mod.setTipoModelo(vTipoModelo);
        if (mod.alterarModelo()){
            response.sendRedirect("../marca.jsp?sucesso=SUCESSO AO ALTERAR O MODELO");
        } else {
            response.sendRedirect("../marca.jsp?erro=PROBLEMAS AO ALTERAR O MODELO");
        }
   %>

</html>