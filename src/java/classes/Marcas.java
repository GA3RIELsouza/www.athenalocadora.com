package classes;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Marcas {

    private int     idMarca;
    private String  nomeMarca;

    public boolean incluirMarca() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO marcas ";
               sql += "(nomeMarca) ";
               sql += "VALUES (?)";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString (1, nomeMarca);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean alterarMarca() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "UPDATE marcas ";
               sql += "SET nomeMarca= ? ";
               sql += "WHERE idMarca= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString (1,  nomeMarca);
            stm.setInt    (2,  idMarca);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean excluirMarca() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "DELETE FROM marcas ";
               sql += "WHERE idMarca= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt(1, idMarca);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public Marcas consultarMarca() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT idMarca, nomeMarca ";
               sql += "FROM marcas ";
               sql += "WHERE idMarca= ?";
               
        Marcas mar = null;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idMarca);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                mar = new Marcas();
                
                mar.setIdMarca   (getIdMarca());
                mar.setNomeMarca (rs.getString("nomeMarca"));
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return mar;
        
    }

    public List<Marcas> consultarMarcas() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Marcas> listaMarcas = new ArrayList<>();
        String sql  = "SELECT * ";
               sql += "FROM marcas ";
               sql += "ORDER BY idMarca;";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Marcas mar = new Marcas();
                
                mar.setIdMarca   (rs.getInt("idMarca"));
                mar.setNomeMarca (rs.getString("nomeMarca"));
                
                listaMarcas.add(mar);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return listaMarcas;
        
    }
    
    // Getters and Setters //

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getNomeMarca() {
        return nomeMarca;
    }

    public void setNomeMarca(String nomeMarca) {
        this.nomeMarca = nomeMarca;
    }

}