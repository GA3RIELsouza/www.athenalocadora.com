package classes;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import util.Conexao;

public class Sessoes {
    
    private String    login;
    private String    ip;
    private Timestamp dataInicio;
    private Timestamp dataFim;
    private String    tokenSessao;
    
    public boolean novaSessao() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO sessoes ";
               sql += "(login, ip, dataInicio, dataFim, tokenSessao) ";
               sql += "VALUES (?, ?, ?, ?, ?)";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString    (1, login);
            stm.setString    (2, ip);
            stm.setTimestamp (3, dataInicio);
            stm.setTimestamp (4, dataFim);
            stm.setString    (5, tokenSessao);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }
    
    public boolean encerrarSessao() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "DELETE FROM sessoes ";
               sql += "WHERE tokenSessao= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString(1, tokenSessao);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }
    
    public boolean checkTokenSessao() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT COUNT(tokenSessao) ";
               sql += "FROM sessoes ";
               sql += "WHERE tokenSessao= ?";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, tokenSessao);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                int qtd = rs.getInt(1);
                return (qtd == 1);
                
            }
            
            return false;
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return false;
        
    }
    
    public Sessoes checkLoginChave() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT login ";
               sql += "FROM sessoes ";
               sql += "WHERE tokenSessao= ?";
               
        Sessoes ses = null;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, tokenSessao);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                ses = new Sessoes();
                
                ses.setLogin(rs.getString("login"));
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return ses;
        
    }
    
    public boolean atualizarTokenSessao() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "UPDATE sessoes ";
               sql += "SET dataFim= ? ";
               sql += "WHERE login= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setTimestamp(1, dataFim);
            stm.setString(2, login);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Timestamp getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Timestamp dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Timestamp getDataFim() {
        return dataFim;
    }

    public void setDataFim(Timestamp dataFim) {
        this.dataFim = dataFim;
    }

    public String getTokenSessao() {
        return tokenSessao;
    }

    public void setTokenSessao(String tokenSessao) {
        this.tokenSessao = tokenSessao;
    }
    
}