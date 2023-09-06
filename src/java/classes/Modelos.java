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
    
    public int auto_increment() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT MAX(idModelo) ";
               sql += "FROM modelos ";
               sql += "WHERE idMarca= ?";
               
               int maxIdModelo = 0;
               int newIdModelo = 0;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idMarca);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                maxIdModelo = rs.getInt(1);
                newIdModelo = maxIdModelo + 1;
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return newIdModelo;
        
    }

    public boolean incluirModelo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO modelos ";
               sql += "(idModelo, idMarca, nomeModelo, tipoModelo) ";
               sql += "VALUES (?, ?, ?, ?)";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt    (1, auto_increment());
            stm.setInt    (2, idMarca);
            stm.setString (3, nomeModelo);
            stm.setString (4, tipoModelo);
            
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

    public List<Modelos> consultarModelosId() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Modelos> listaModelos = new ArrayList<>();
        String sql  = "SELECT idModelo, idMarca, nomeModelo, tipoModelo ";
               sql += "FROM modelos ";
               sql += "WHERE idModelo= ? ";
               sql += "ORDER BY idMarca, idModelo";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idModelo);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Modelos mod = new Modelos();
                
                mod.setIdModelo   (getIdModelo());
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

    public List<Modelos> consultarModelosMarca() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Modelos> listaModelos = new ArrayList<>();
        String sql  = "SELECT idModelo, idMarca, nomeModelo, tipoModelo ";
               sql += "FROM modelos ";
               sql += "WHERE idMarca= ? ";
               sql += "ORDER BY idMarca, idModelo";
        
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
        String sql  = "SELECT idModelo, idMarca, nomeModelo, tipoModelo ";
               sql += "FROM modelos ";
               sql += "ORDER BY idMarca, idModelo";
        
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
    
    public Modelos consultarModelo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT idModelo, idMarca, nomeModelo, tipoModelo ";
               sql += "FROM modelos ";
               sql += "WHERE idModelo= ? AND idMarca= ? ";
               sql += "ORDER BY idMarca, idModelo";
               
        Modelos mod = null;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idModelo);
            stm.setInt(2, idMarca);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                mod = new Modelos();
                
                mod.setIdModelo   (rs.getInt("idModelo"));
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
    
    public List<Marcas> selectMarcas() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Marcas> listaMarcas = new ArrayList<>();
        String sql  = "SELECT idMarca, nomeMarca ";
               sql += "FROM marcas ";
               sql += "ORDER BY nomeMarca";
               
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
    
    public List<Modelos> selectExAltCon() throws SQLException {
        
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