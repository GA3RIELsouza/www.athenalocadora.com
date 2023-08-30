<%@page import="classes.Usuarios"%>
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
        int    vIdMarca    = Integer.parseInt(request.getParameter("idMarca"));
        String vNomeModelo = request.getParameter("nomeModelo");
        String vTipoModelo = request.getParameter("tipoModelo");

        Modelos mod = new Modelos();
        mod.setIdMarca(vIdMarca);
        mod.setNomeModelo(vNomeModelo);
        mod.setTipoModelo(vTipoModelo);
        if (mod.incluirModelo()){
            response.sendRedirect("../modelo.jsp?sucesso=SUCESSO AO INCLUIR O MODELO");
        } else {
            response.sendRedirect("../modelo.jsp?erro=PROBLEMAS AO INCLUIR O MODELO");
        }
   %>

</html>