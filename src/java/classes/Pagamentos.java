package classes;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Pagamentos {

    private int       idAluguel;
    private int       idPagamento;
    private Timestamp dataPagamento;
    private String    tipoPagamento;
    private double    vlrPagamento;

    public boolean incluirPagamento() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO pagamentos ";
               sql += "(idAluguel, dataPagamento, tipoPagamento, vlrPagamento )";
               sql += "VALUES (?, ?, ?, ?)";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt       (1, idAluguel);
            stm.setTimestamp (2, dataPagamento);
            stm.setString    (3, tipoPagamento);
            stm.setDouble    (4, vlrPagamento);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean alterarPagamento() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "UPDATE pagamentos ";
               sql += "SET dataPagamento= ?, tipoPagamento= ?, vlrPagamento= ? " ;
               sql += "WHERE idPagamento= ? AND idAluguel= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setTimestamp (1, dataPagamento);
            stm.setString    (2, tipoPagamento);
            stm.setDouble    (3, vlrPagamento);
            stm.setInt       (4, idPagamento);
            stm.setInt       (5, idAluguel);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public boolean excluirPagamento() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "DELETE FROM pagamentos ";
               sql += "WHERE idPagamento= ? AND idAluguel= ?";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt(1, idPagamento);
            stm.setInt(2, idAluguel);
            
            stm.execute();
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
            return false;
            
        }
        
        con.close();
        return true;
        
    }

    public Pagamentos consultarPagamento() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT idAluguel, idPagamento, dataPagamento, tipoPagamento, vlrPagamento ";
               sql += "FROM pagamentos ";
               sql += "WHERE idPagamento= ? AND idAluguel= ?;";
               
        Pagamentos pag = null;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idPagamento);
            stm.setInt(2, idAluguel);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                pag = new Pagamentos();
                
                pag.setIdPagamento   (getIdPagamento());
                pag.setIdAluguel     (getIdAluguel());
                pag.setDataPagamento (rs.getTimestamp("dataPagamento"));
                pag.setTipoPagamento (rs.getString("tipoPagamento"));
                pag.setVlrPagamento  (rs.getDouble("vlrPagamento"));
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
        }
        
        con.close();
        return pag;
        
    }

    public List<Pagamentos> consultarPagamentos() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Pagamentos> listaPagamentos = new ArrayList<>();
        String sql  = "SELECT * ";
               sql += "FROM pagamentos ";
               sql += "ORDER BY idPagamento AND idAluguel;";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Pagamentos pag = new Pagamentos();
                
                pag.setIdPagamento   (rs.getInt("idPagamento"));
                pag.setIdAluguel     (rs.getInt("idAluguel"));
                pag.setDataPagamento (rs.getTimestamp("dataPagamento"));
                pag.setTipoPagamento (rs.getString("tipoPagamento"));
                pag.setVlrPagamento  (rs.getDouble("vlrPagamento"));
                
                listaPagamentos.add(pag);
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            
            con.close();
        }
        
        con.close();
        return listaPagamentos;
        
    }
    
    // Getters and Setters //

    public int getIdAluguel() {
        return idAluguel;
    }

    public void setIdAluguel(int idAluguel) {
        this.idAluguel = idAluguel;
    }

    public int getIdPagamento() {
        return idPagamento;
    }

    public void setIdPagamento(int idPagamento) {
        this.idPagamento = idPagamento;
    }

    public Timestamp getDataPagamento() {
        return dataPagamento;
    }

    public void setDataPagamento(Timestamp dataPagamento) {
        this.dataPagamento = dataPagamento;
    }

    public String getTipoPagamento() {
        return tipoPagamento;
    }

    public void setTipoPagamento(String tipoPagamento) {
        this.tipoPagamento = tipoPagamento;
    }

    public double getVlrPagamento() {
        return vlrPagamento;
    }

    public void setVlrPagamento(double vlrPagamento) {
        this.vlrPagamento = vlrPagamento;
    }

}