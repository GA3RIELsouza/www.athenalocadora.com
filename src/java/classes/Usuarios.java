package classes;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.Conexao;

public class Usuarios {
    
    private String login;
    private String senha;
    
    public boolean checkLogin() throws SQLException {
        
        Connection con = Conexao.conectar();
        
        String sql  = "SELECT COUNT(*) ";
               sql += "FROM usuarios ";
               sql += "WHERE login= ? and senha= ?";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString (1, login);
            stm.setString (2, senha);
            
            ResultSet resultado = stm.executeQuery();
            resultado.next();
            int check = resultado.getInt(1);
            
            con.close();
            return check != 0;
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
    }
    
    public Usuarios checkLoginSenha() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT login, senha ";
               sql += "FROM usuarios ";
               sql += "WHERE login= ?";
               
        Usuarios usu = null;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, login);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                usu = new Usuarios();
                
                usu.setLogin(rs.getString("login"));
                usu.setSenha(rs.getString("senha"));
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return usu;
        
    }
    
    public boolean alterarSenha() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "UPDATE usuarios ";
               sql += "SET senha= ? " ;
               sql += "WHERE login= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString (1, senha);
            stm.setString (2, login);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getLogin() {
        return login;
    }

    public String getSenha() {
        return senha;
    }
    
}