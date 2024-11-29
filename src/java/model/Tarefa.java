/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author alunocmc
 */
public class Tarefa {
    //Atrib
    private int  id;
    private String nome;
    private String descricao;
    private String dificuldade;
    private String responsavel; 
    
    //Métodos

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setDificuldade(String dificuldade) {
        this.dificuldade = dificuldade;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getDescricao() {
        return descricao;
    }
    
    public String getDificuldade() {
        return dificuldade;
    }
    
    public String getResponsavel() {
        return responsavel;
    }
}
