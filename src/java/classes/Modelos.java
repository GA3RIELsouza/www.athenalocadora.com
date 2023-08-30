package classes;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Modelos {

    private int     idModelo;
    private int     idMarca;
    private String  nomeModelo;
    private String  tipoModelo;

    public boolean incluirModelo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO modelos ";
               sql += "(idMarca, nomeModelo, tipoModelo) ";
               sql += "VALUES (?, ?, ?)";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt    (1, idMarca);
            stm.setString (2, nomeModelo);
            stm.setString (3, tipoModelo);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean alterarModelo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "UPDATE modelos ";
               sql += "SET nomeModelo= ?, tipoModelo= ? ";
               sql += "WHERE idModelo= ? AND idMarca= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString (1,  nomeModelo);
            stm.setString (2,  tipoModelo);
            stm.setInt    (3,  idModelo);
            stm.setInt    (4,  idMarca);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean excluirModelo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "DELETE FROM modelos ";
               sql += "WHERE idModelo= ? AND idMarca= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt(1, idMarca);
            stm.setInt(2, idModelo);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public Modelos consultarModeloId() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT * ";
               sql += "FROM modelos ";
               sql += "WHERE idModelo= ? ";
               sql += "ORDER BY idModelo";
               
               Modelos mod = null;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idModelo);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                mod = new Modelos();
                
                mod.setIdModelo   (getIdModelo());
                mod.setIdMarca    (rs.getInt("idMarca"));
                mod.setNomeModelo (rs.getString("nomeModelo"));
                mod.setTipoModelo (rs.getString("tipoModelo"));
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return mod;
        
    }

    public List<Modelos> consultarModeloMarca() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Modelos> listaModelos = new ArrayList<>();
        String sql  = "SELECT * ";
               sql += "FROM modelos ";
               sql += "WHERE idMarca= ? ";
               sql += "ORDER BY idModelo";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idMarca);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Modelos mod = new Modelos();
                
                mod.setIdModelo   (rs.getInt("idModelo"));
                mod.setIdMarca    (getIdMarca());
                mod.setNomeModelo (rs.getString("nomeModelo"));
                mod.setTipoModelo (rs.getString("tipoModelo"));
                
                listaModelos.add(mod);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return listaModelos;
        
    }
    
    public List<Modelos> consultarModelos() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Modelos> listaModelos = new ArrayList<>();
        String sql  = "SELECT * ";
               sql += "FROM modelos ";
               sql += "ORDER BY idModelo, idMarca";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Modelos mod = new Modelos();
                
                mod.setIdModelo   (rs.getInt("idModelo"));
                mod.setIdMarca    (rs.getInt("idMarca"));
                mod.setNomeModelo (rs.getString("nomeModelo"));
                mod.setTipoModelo (rs.getString("tipoModelo"));
                
                listaModelos.add(mod);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return listaModelos;
        
    }
    
    public List<Modelos> consultarIncluirAlterar() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Modelos> listaModelos = new ArrayList<>();
        String sql  = "SELECT m.idModelo, m.idMarca, marca.nomeMarca, m.nomeModelo, m.tipoModelo ";
               sql += "FROM modelos AS m ";
               sql += "INNER JOIN marcas AS marca ON m.idMarca = marca.idMarca ";
               sql += "ORDER BY marca.nomeMarca, m.nomeModelo";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Modelos mod = new Modelos();
                
                mod.setIdModelo   (rs.getInt("idModelo"));
                mod.setIdMarca    (rs.getInt("idMarca"));
                mod.setNomeModelo (rs.getString("nomeModelo"));
                mod.setTipoModelo (rs.getString("tipoModelo"));
                
                listaModelos.add(mod);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return listaModelos;
        
    }
    
    public List<Modelos> consultarExcluirConsultar() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Modelos> listaModelos = new ArrayList<>();
        String sql  = "SELECT DISTINCT idModelo ";
               sql += "FROM modelos";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Modelos mod = new Modelos();
                
                mod.setIdModelo (rs.getInt("idModelo"));
                
                listaModelos.add(mod);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return listaModelos;
        
    }
    
    // Getters and Setters //

    public int getIdModelo() {
        return idModelo;
    }

    public void setIdModelo(int idModelo) {
        this.idModelo = idModelo;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getNomeModelo() {
        return nomeModelo;
    }

    public void setNomeModelo(String nomeModelo) {
        this.nomeModelo = nomeModelo;
    }

    public String getTipoModelo() {
        return tipoModelo;
    }

    public void setTipoModelo(String tipoModelo) {
        this.tipoModelo = tipoModelo;
    }

}