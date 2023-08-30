<%@include file="/include/check_login.jsp"%>
<%@page import="classes.Marcas"%>
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
        int vIdMarca = Integer.parseInt(request.getParameter("idMarca"));

        Marcas mar = new Marcas();
        mar.setIdMarca(vIdMarca);
        if (mar.excluirMarca()){
            response.sendRedirect("../marca.jsp?sucesso=SUCESSO AO EXCLUIR A MARCA");
        } else {
            response.sendRedirect("../marca.jsp?erro=PROBLEMAS AO EXCLUIR A MARCA");
        }
   %>

</html>