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
    
    public int auto_increment() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "SELECT MAX(idPagamento) ";
               sql += "FROM pagamentos ";
               sql += "WHERE idAluguel= ?";
               
               int maxIdPagamento = 0;
               int newIdPagamento = 0;
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idAluguel);
            ResultSet rs = stm.executeQuery();
            
            if(rs.next()) {
                
                maxIdPagamento = rs.getInt(1);
                newIdPagamento = maxIdPagamento + 1;
                
            }
            
        }catch(SQLException ex) {
            
            System.out.println("Erro: " + ex.getMessage());
            con.close();
            
        }
        
        con.close();
        return newIdPagamento;
        
    }

    public boolean incluirPagamento() throws SQLException {
        
        Connection con = Conexao.conectar();
        String sql  = "INSERT INTO pagamentos ";
               sql += "(idPagamento, idAluguel, dataPagamento, tipoPagamento, vlrPagamento )";
               sql += "VALUES (?, ?, ?, ?, ?)";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setInt       (1, auto_increment());
            stm.setInt       (2, idAluguel);
            stm.setTimestamp (3, dataPagamento);
            stm.setString    (4, tipoPagamento);
            stm.setDouble    (5, vlrPagamento);
            
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

    public List<Pagamentos> consultarPagamentosId() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Pagamentos> listaPagamentos = new ArrayList<>();
        String sql  = "SELECT idPagamento, idAluguel, dataPagamento, tipoPagamento, vlrPagamento ";
               sql += "FROM pagamentos ";
               sql += "WHERE idPagamento= ? ";
               sql += "ORDER BY idPagamento AND idAluguel;";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idPagamento);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Pagamentos pag = new Pagamentos();
                
                pag.setIdPagamento   (getIdPagamento());
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
    
    public List<Pagamentos> consultarPagamentosAluguel() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Pagamentos> listaPagamentos = new ArrayList<>();
        String sql  = "SELECT idPagamento, idAluguel, dataPagamento, tipoPagamento, vlrPagamento ";
               sql += "FROM pagamentos ";
               sql += "WHERE idAluguel= ? ";
               sql += "ORDER BY idPagamento AND idAluguel;";
        
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idAluguel);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Pagamentos pag = new Pagamentos();
                
                pag.setIdPagamento   (rs.getInt("idPagamento"));
                pag.setIdAluguel     (getIdAluguel());
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

    public List<Pagamentos> consultarPagamentos() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Pagamentos> listaPagamentos = new ArrayList<>();
        String sql  = "SELECT idPagamento, idAluguel, dataPagamento, tipoPagamento, vlrPagamento ";
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
    
    public List<Pagamentos> selectExcluirAlterarConsultar() throws SQLException {
        
        Connection con = Conexao.conectar();
        List<Pagamentos> listaPagamentos = new ArrayList<>();
        String sql  = "SELECT DISTINCT idPagamento ";
               sql += "FROM pagamentos";
               
        try {
            
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                
                Pagamentos pag = new Pagamentos();
                
                pag.setIdPagamento (rs.getInt("idPagamento"));
                
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