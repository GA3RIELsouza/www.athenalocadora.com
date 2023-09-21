package classes;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import util.Conexao;

public class Sessoes {
    
    private String    login;
    private int       idSessao;
    private String    ip;
    private Timestamp dataInicio;
    private Timestamp dataFim;
    private String    chaveSessao;
    
    public int auto_increment() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT MAX(idSessao) ";
               sql += "FROM sessoes ";
               sql += "WHERE login= ?";
               
               int maxIdSessao = 0;
               int newIdSessao = 0;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, login);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                maxIdSessao = rs.getInt(1);
                newIdSessao = maxIdSessao + 1;
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return newIdSessao;
        
    }
    
    public boolean novaSessao() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO sessoes ";
               sql += "(login, idSessao, ip, dataInicio, dataFim, chaveSessao) ";
               sql += "VALUES (?, ?, ?, ?, ?, ?)";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString    (1, login);
            stm.setInt       (2, auto_increment());
            stm.setString    (3, ip);
            stm.setTimestamp (4, dataInicio);
            stm.setTimestamp (5, dataFim);
            stm.setString    (6, chaveSessao);
            
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
               sql += "WHERE chaveSessao= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString(1, chaveSessao);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }
    
    public boolean checkChaveSessao() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT COUNT(chaveSessao) ";
               sql += "FROM sessoes ";
               sql += "WHERE chaveSessao= ?";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, chaveSessao);
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

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getIdSessao() {
        return idSessao;
    }

    public void setIdSessao(int idSessao) {
        this.idSessao = idSessao;
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

    public String getChaveSessao() {
        return chaveSessao;
    }

    public void setChaveSessao(String chaveSessao) {
        this.chaveSessao = chaveSessao;
    }
    
}