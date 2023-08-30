package classes;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Alugueis {

    private int       idAluguel;
    private int       idVeiculo;
    private String    cpfCliente;
    private Timestamp dataAluguel;
    private Timestamp dataDevolucao;
    private Timestamp dataEstimadaDevolucao;
    private boolean    pagamento;

    public boolean locarVeiculo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO alugueis ";
               sql += "(idVeiculo, cpfCliente, dataAluguel, dataDevolucao, dataEstimadaDevolucao, pagamento) ";
               sql += "VALUES (?, ?, ?, ?, ?, ?)";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt       (1, idVeiculo);
            stm.setString    (2, cpfCliente);
            stm.setTimestamp (3, dataAluguel);
            stm.setTimestamp (4, dataDevolucao);
            stm.setTimestamp (5, dataEstimadaDevolucao);
            stm.setBoolean   (6, pagamento);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean devolverVeiculo() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "UPDATE alugueis ";
               sql += "SET dataDevolucao= ? " ;
               sql += "WHERE idAluguel= ? AND cpfCliente= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt       (1, idAluguel);
            stm.setString    (2, cpfCliente);
            stm.setTimestamp (3, dataDevolucao);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean cancelarLocacao() throws SQLException{
        
        Connection con = Conexao.conectar();
        String sql  = "DELETE FROM alugueis ";
               sql += "WHERE idAluguel= ? AND cpfCliente= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt    (1, idAluguel);
            stm.setString (2, cpfCliente);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public List<Alugueis> consultarLocacaoCliente() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Alugueis> listaAlugueis = new ArrayList<>();
        String sql  = "SELECT * ";
               sql += "FROM alugueis ";
               sql += "WHERE cpfCliente= ? ";
               sql += "ORDER BY idAluguel, cpfCliente;";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, cpfCliente);
            
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Alugueis alu = new Alugueis();
                
                alu.setIdAluguel             (rs.getInt("idAluguel"));
                alu.setIdVeiculo             (rs.getInt("idVeiculo"));
                alu.setCpfCliente            (getCpfCliente());
                alu.setDataAluguel           (rs.getTimestamp("dataAluguel"));
                alu.setDataDevolucao         (rs.getTimestamp("dataDevolucao"));
                alu.setDataEstimadaDevolucao (rs.getTimestamp("dataEstimadaDevolucao"));
                alu.setPagamento             (rs.getBoolean("pagamento"));
                
                listaAlugueis.add(alu);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return listaAlugueis;
        
    }

    public List<Alugueis> consultarLocacaoVeiculo() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Alugueis> listaAlugueis = new ArrayList<>();
        String sql  = "SELECT * ";
               sql += "FROM alugueis ";
               sql += "WHERE idVeiculo= ? ";
               sql += "ORDER BY idAluguel, cpfCliente;";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idVeiculo);
            
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Alugueis alu = new Alugueis();
                
                alu.setIdAluguel             (rs.getInt("idAluguel"));
                alu.setIdVeiculo             (getIdVeiculo());
                alu.setCpfCliente            (rs.getString("cpfCliente"));
                alu.setDataAluguel           (rs.getTimestamp("dataAluguel"));
                alu.setDataDevolucao         (rs.getTimestamp("dataDevolucao"));
                alu.setDataEstimadaDevolucao (rs.getTimestamp("dataEstimadaDevolucao"));
                alu.setPagamento             (rs.getBoolean("pagamento"));
                
                listaAlugueis.add(alu);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return listaAlugueis;
        
    }
    
    public List<Alugueis> consultarAlugueis() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Alugueis> listaAlugueis = new ArrayList<>();
        String sql  = "SELECT * ";
               sql += "FROM alugueis ";
               sql += "ORDER BY cpfCliente, idAluguel;";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Alugueis alu = new Alugueis();
                
                alu.setIdAluguel             (rs.getInt("idAluguel"));
                alu.setIdVeiculo             (rs.getInt("idVeiculo"));
                alu.setCpfCliente            (rs.getString("cpfCliente"));
                alu.setDataAluguel           (rs.getTimestamp("dataAluguel"));
                alu.setDataDevolucao         (rs.getTimestamp("dataDevolucao"));
                alu.setDataEstimadaDevolucao (rs.getTimestamp("dataEstimadaDevolucao"));
                alu.setPagamento             (rs.getBoolean("pagamento"));
                
                listaAlugueis.add(alu);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return listaAlugueis;
        
    }
    
    // Getters and Setters //

    public int getIdAluguel() {
        return idAluguel;
    }

    public void setIdAluguel(int idAluguel) {
        this.idAluguel = idAluguel;
    }

    public int getIdVeiculo() {
        return idVeiculo;
    }

    public void setIdVeiculo(int idVeiculo) {
        this.idVeiculo = idVeiculo;
    }

    public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }

    public Timestamp getDataAluguel() {
        return dataAluguel;
    }

    public void setDataAluguel(Timestamp dataAluguel) {
        this.dataAluguel = dataAluguel;
    }

    public Timestamp getDataDevolucao() {
        return dataDevolucao;
    }

    public void setDataDevolucao(Timestamp dataDevolucao) {
        this.dataDevolucao = dataDevolucao;
    }

    public Timestamp getDataEstimadaDevolucao() {
        return dataEstimadaDevolucao;
    }

    public void setDataEstimadaDevolucao(Timestamp dataEstimadaDevolucao) {
        this.dataEstimadaDevolucao = dataEstimadaDevolucao;
    }

    public boolean isPagamento() {
        return pagamento;
    }

    public void setPagamento(boolean pagamento) {
        this.pagamento = pagamento;
    }

}