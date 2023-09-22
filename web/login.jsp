<%@page import="classes.Usuarios"%>
<%@page import="classes.Sessoes"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.security.SecureRandom"%>
    
<%
    Usuarios usu = new Usuarios();
    Sessoes  ses = new Sessoes();
    Calendar cal = Calendar.getInstance();

    String vLogin  = request.getParameter("login");
    String vSenha  = request.getParameter("senha");

    usu.setLogin(vLogin);
    usu.setSenha(vSenha);

    if (usu.checkLogin()){
        String    vLoginSessao = request.getParameter("login");
        String    vIp          = request.getRemoteAddr();
        Timestamp vDataInicio  = new Timestamp(cal.getTimeInMillis());
        
        cal.add(Calendar.DAY_OF_MONTH, 7);
        Timestamp vDataFim     = new Timestamp(cal.getTimeInMillis());
        
        final String chrs = "0123456789abcdefghijklmnopqrstuvwxyz-_ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        final SecureRandom secureRandom = SecureRandom.getInstanceStrong();
        final String chaveGerada = secureRandom
            .ints(64, 0, chrs.length())
            .mapToObj(i -> chrs.charAt(i))
            .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append)
            .toString();
        String vChaveSessao = chaveGerada;
        
        ses.setLogin(vLoginSessao);
        ses.setIp(vIp);
        ses.setDataInicio(vDataInicio);
        ses.setDataFim(vDataFim);
        ses.setChaveSessao(vChaveSessao);

        ses.novaSessao();
        
        Cookie sessaoCookie = new Cookie("chaveSessao", chaveGerada);
        sessaoCookie.setMaxAge(60*60*24*7);
        response.addCookie(sessaoCookie);

        response.sendRedirect("inicio.jsp");
    } else {
        response.sendRedirect("index.jsp?erroLoginSenha=LOGIN OU SENHA INCORRETOS");
    }
%>