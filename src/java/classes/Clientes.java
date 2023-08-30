package classes;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Clientes {

    private String cpfCliente;
    private String nomeCliente;
    private String foneCliente;
    private String emailCliente;
    private String nrCartaoDebCred;
    private String chavePix;

    public boolean incluirCliente() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO clientes ";
               sql += "(cpfCliente, nomeCliente, foneCliente, emailCliente, nrCartaoDebCred, chavePix) ";
               sql += "VALUES (?, ?, ?, ?, ?, ?)";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString (1, cpfCliente);
            stm.setString (2, nomeCliente);
            stm.setString (3, foneCliente);
            stm.setString (4, emailCliente);
            stm.setString (5, nrCartaoDebCred);
            stm.setString (6, chavePix);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean alterarCliente() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "UPDATE clientes ";
               sql += "SET nomeCliente= ?, foneCliente= ?, emailCliente= ?, nrCartaoDebCred= ?, chavePix= ? " ;
               sql += "WHERE cpfCliente= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString (1, nomeCliente);
            stm.setString (2, foneCliente);
            stm.setString (3, emailCliente);
            stm.setString (4, nrCartaoDebCred);
            stm.setString (5, chavePix);
            stm.setString (6, cpfCliente);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean excluirCliente() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "DELETE FROM clientes ";
               sql += "WHERE cpfCliente= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString(1, cpfCliente);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public Clientes consultarCliente() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT cpfCliente, nomeCliente, foneCliente, emailCliente, nrCartaoDebCred, chavePix ";
               sql += "FROM clientes ";
               sql += "WHERE cpfCliente= ?;";
               
        Clientes cli = null;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, cpfCliente);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                cli = new Clientes();
                
                cli.setCpfCliente      (getCpfCliente());
                cli.setNomeCliente     (rs.getString("nomeCliente"));
                cli.setFoneCliente     (rs.getString("foneCliente"));
                cli.setEmailCliente    (rs.getString("emailCliente"));
                cli.setNrCartaoDebCred (rs.getString("nrCartaoDebCred"));
                cli.setChavePix        (rs.getString("chavePix"));
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return cli;
        
    }

    public List<Clientes> consultarClientes() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Clientes> listaClientes = new ArrayList<>();
        String sql  = "SELECT * ";
               sql += "FROM clientes ";
               sql += "ORDER BY cpfCliente;";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Clientes cli = new Clientes();
                
                cli.setCpfCliente      (rs.getString("cpfCliente"));
                cli.setNomeCliente     (rs.getString("nomeCliente"));
                cli.setFoneCliente     (rs.getString("foneCliente"));
                cli.setEmailCliente    (rs.getString("emailCliente"));
                cli.setNrCartaoDebCred (rs.getString("nrCartaoDebCred"));
                cli.setChavePix        (rs.getString("chavePix"));
                
                listaClientes.add(cli);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return listaClientes;
        
    }
    
    // Getters and Setters //

    public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public String getFoneCliente() {
        return foneCliente;
    }

    public void setFoneCliente(String foneCliente) {
        this.foneCliente = foneCliente;
    }

    public String getEmailCliente() {
        return emailCliente;
    }

    public void setEmailCliente(String emailCliente) {
        this.emailCliente = emailCliente;
    }

    public String getNrCartaoDebCred() {
        return nrCartaoDebCred;
    }

    public void setNrCartaoDebCred(String nrCartaoDebCred) {
        this.nrCartaoDebCred = nrCartaoDebCred;
    }

    public String getChavePix() {
        return chavePix;
    }

    public void setChavePix(String chavePix) {
        this.chavePix = chavePix;
    }

}