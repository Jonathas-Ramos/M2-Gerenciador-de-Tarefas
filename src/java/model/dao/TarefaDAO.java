/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import model.Tarefa;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.ConectaDB;
/**
 *
 * @author alunocmc
 */
public class TarefaDAO {
    // Atrib.
    
    //Método
    public boolean insTarefa(Tarefa p_tar) throws ClassNotFoundException {
    Connection conexao = null;
    PreparedStatement pstmt = null;
    try {
        conexao = ConectaDB.conectar();
        String sql = "INSERT INTO tarefa(nome, descricao, dificuldade, responsavel) VALUES (?, ?, ?, ?)";
        pstmt = conexao.prepareStatement(sql);

        // Set parameters
        pstmt.setString(1, p_tar.getNome());
        pstmt.setString(2, p_tar.getDescricao());
        pstmt.setString(3, p_tar.getDificuldade());
        pstmt.setString(4, p_tar.getResponsavel());
        
        // Execute the update
        pstmt.executeUpdate();
        return true;
    } catch (SQLException ex) {
        System.out.println("Erro: " + ex.getMessage());
        return false;
    } finally {
        // Close resources in the reverse order of their creation
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        } catch (SQLException e) {
            System.out.println("Erro ao fechar recursos: " + e.getMessage());
        }
    }
}    
    
    public boolean delPesq(Tarefa p_tar) throws ClassNotFoundException {
        Connection conexao = null;
        PreparedStatement stmt = null;
        try {
            conexao = ConectaDB.conectar();
            // A consulta SQL com o parâmetro de substituição
            String sql = "DELETE FROM tarefa WHERE id = ?";

            // Criando o PreparedStatement e substituindo o valor do id
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, p_tar.getId()); // Supondo que o id seja do tipo inteiro

            // Executando a exclusão
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex);
            return false;
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conexao != null) conexao.close();
            } catch (SQLException ex) {
                System.out.println("Erro ao fechar recursos: " + ex);
            }
        }
    }   
        
    public Tarefa consTarefa(Tarefa p_tar) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();                                 
            String sql = "SELECT * FROM tarefa where nome = '" + p_tar.getNome() + "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                p_tar.setNome(rs.getString("nome"));  
                p_tar.setDescricao("descricao");
                p_tar.setDificuldade(rs.getString("dificuldade"));                
                p_tar.setResponsavel(rs.getString("responsavel"));                
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return p_tar;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }    

    public Tarefa consTarefaId(Tarefa p_tar) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();                                 
            String sql = "SELECT * FROM tarefa where id = '" + p_tar.getId()+ "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                p_tar.setNome(rs.getString("nome"));
                p_tar.setDescricao(rs.getString("descricao"));
                p_tar.setDificuldade(rs.getString("dificuldade"));                
                p_tar.setResponsavel(rs.getString("responsavel"));
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return p_tar;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }          
       
    public boolean altPesq(Tarefa p_tare) throws ClassNotFoundException {
    Connection conexao = null;
    PreparedStatement stmt = null;
    try {
        conexao = ConectaDB.conectar();
        // A consulta SQL com os parâmetros de substituição
        String sql = "UPDATE tarefa SET nome = ?, descricao = ?, dificuldade = ?, responsavel = ? WHERE id = ?";
        
        // Criando o PreparedStatement e substituindo os valores
        stmt = conexao.prepareStatement(sql);
        
        stmt.setString(1, p_tare.getNome());
        stmt.setString(2, p_tare.getDescricao());
        stmt.setString(3, p_tare.getDificuldade());
        stmt.setString(4, p_tare.getResponsavel());
        stmt.setInt(5, p_tare.getId()); // Supondo que o id seja inteiro
        
        // Executando a atualização
        stmt.executeUpdate();
        return true;
    } catch (SQLException ex) {
        System.out.println("Erro: " + ex);
        return false;
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conexao != null) conexao.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao fechar recursos: " + ex);
        }
    }
    }
}
