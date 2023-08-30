package classes;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Veiculos {

    private int     idVeiculo;
    private int     idModelo;
    private String  placaVeiculo;
    private String  corPredominante;
    private int     anoFabricacao;
    private boolean disponivel;
    private boolean temArCondicionado;
    private boolean temDirHidraulica;
    private boolean revisado;

    public boolean incluirVeiculo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO veiculos ";
               sql += "(idModelo, placaVeiculo, corPredominante, ";
               sql += "anoFabricacao, disponivel, temArCondicionado, temDirHidraulica, revisado) ";
               sql += "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt     (1, idModelo);
            stm.setString  (2, placaVeiculo);
            stm.setString  (3, corPredominante);
            stm.setInt     (4, anoFabricacao);
            stm.setBoolean (5, disponivel);
            stm.setBoolean (6, temArCondicionado);
            stm.setBoolean (7, temDirHidraulica);
            stm.setBoolean (8, revisado);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean alterarVeiculo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "UPDATE veiculos ";
               sql += "SET idModelo= ?, placaVeiculo= ?, corPredominante= ?, anoFabricacao= ?, ";
               sql += "disponivel= ?, temArCondicionado= ?, temDirHidraulica= ?, revisado = ? ";
               sql += "WHERE idVeiculo= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt     (1,  idModelo);
            stm.setString  (2,  placaVeiculo);
            stm.setString  (3,  corPredominante);
            stm.setInt     (4,  anoFabricacao);
            stm.setBoolean (5,  disponivel);
            stm.setBoolean (6,  temArCondicionado);
            stm.setBoolean (7,  temDirHidraulica);
            stm.setBoolean (8,  revisado);
            stm.setInt     (10, idVeiculo);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean excluirVeiculo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "DELETE FROM veiculos ";
               sql += "WHERE idVeiculo= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt(1, idVeiculo);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public Veiculos consultarVeiculo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT idVeiculo, idModelo, placaVeiculo, corPredominante, ";
               sql += "anoFabricacao, disponivel, temArCondicionado, temDirHidraulica, revisado ";
               sql += "FROM veiculos ";
               sql += "WHERE idVeiculo= ?";
               
        Veiculos vei = null;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idVeiculo);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                vei = new Veiculos();
                
                vei.setIdVeiculo         (getIdVeiculo());
                vei.setIdModelo          (rs.getInt("idModelo"));
                vei.setPlacaVeiculo      (rs.getString("placaVeiculo"));
                vei.setCorPredominante   (rs.getString("corPredominante"));
                vei.setAnoFabricacao     (rs.getInt("anoFabricacao"));
                vei.setDisponivel        (rs.getBoolean("disponivel"));
                vei.setTemArCondicionado (rs.getBoolean("temArCondicionado"));
                vei.setTemDirHidraulica  (rs.getBoolean("temDirHidraulica"));
                vei.setRevisado          (rs.getBoolean("revisado"));
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return vei;
        
    }

    public List<Veiculos> consultarVeiculos() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Veiculos> listaVeiculos = new ArrayList<>();
        String sql  = "SELECT * ";
               sql += "FROM veiculos ";
               sql += "ORDER BY idVeiculo;";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Veiculos vei = new Veiculos();
                
                vei.setIdVeiculo         (rs.getInt("idVeiculo"));
                vei.setIdModelo          (rs.getInt("idModelo"));
                vei.setPlacaVeiculo      (rs.getString("placaVeiculo"));
                vei.setCorPredominante   (rs.getString("corPredominante"));
                vei.setAnoFabricacao     (rs.getInt("anoFabricacao"));
                vei.setDisponivel        (rs.getBoolean("disponivel"));
                vei.setTemArCondicionado (rs.getBoolean("temArCondicionado"));
                vei.setTemDirHidraulica  (rs.getBoolean("temDirHidraulica"));
                vei.setRevisado          (rs.getBoolean("revisado"));
                
                listaVeiculos.add(vei);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return listaVeiculos;
        
    }
    
    // Getters and Setters //

    public int getIdVeiculo() {
        return idVeiculo;
    }

    public void setIdVeiculo(int idVeiculo) {
        this.idVeiculo = idVeiculo;
    }

    public int getIdModelo() {
        return idModelo;
    }

    public void setIdModelo(int idModelo) {
        this.idModelo = idModelo;
    }

    public String getPlacaVeiculo() {
        return placaVeiculo;
    }

    public void setPlacaVeiculo(String placaVeiculo) {
        this.placaVeiculo = placaVeiculo;
    }

    public String getCorPredominante() {
        return corPredominante;
    }

    public void setCorPredominante(String corPredominante) {
        this.corPredominante = corPredominante;
    }

    public int getAnoFabricacao() {
        return anoFabricacao;
    }

    public void setAnoFabricacao(int anoFabricacao) {
        this.anoFabricacao = anoFabricacao;
    }

    public boolean isDisponivel() {
        return disponivel;
    }

    public void setDisponivel(boolean disponivel) {
        this.disponivel = disponivel;
    }

    public boolean isTemArCondicionado() {
        return temArCondicionado;
    }

    public void setTemArCondicionado(boolean temArCondicionado) {
        this.temArCondicionado = temArCondicionado;
    }

    public boolean isTemDirHidraulica() {
        return temDirHidraulica;
    }

    public void setTemDirHidraulica(boolean temDirHidraulica) {
        this.temDirHidraulica = temDirHidraulica;
    }

    public boolean isRevisado() {
        return revisado;
    }

    public void setRevisado(boolean revisado) {
        this.revisado = revisado;
    }

}