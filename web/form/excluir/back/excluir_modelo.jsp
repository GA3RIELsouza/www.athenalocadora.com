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
        int vIdModelo = Integer.parseInt(request.getParameter("idModelo"));
        int vIdMarca  = Integer.parseInt(request.getParameter("idMarca"));

        Modelos mod = new Modelos();
        mod.setIdModelo(vIdModelo);
        mod.setIdMarca(vIdMarca);
        if (mod.excluirModelo()){
            response.sendRedirect("../marca.jsp?sucesso=SUCESSO AO EXCLUIR O MODELO");
        } else {
            response.sendRedirect("../marca.jsp?erro=PROBLEMAS AO EXCLUIR O MODELO");
        }
   %>

</html>