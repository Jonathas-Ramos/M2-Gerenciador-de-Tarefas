<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Tarefa"%>
<%@page import="model.dao.TarefaDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tarefa</h1>
        <%
        //Entrada/Receber      
        int id = Integer.parseInt( request.getParameter("ident") );
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String dificuldade = request.getParameter("dificuldade");
        String responsavel = request.getParameter("responsavel"); 
        //String dt_pesq = request.getParameter("dt_pesq");

        // Instância e atrib de valor
        Tarefa tare = new Tarefa();
        tare.setId(id);
        tare.setNome(nome);
        tare.setDescricao(descricao);
        tare.setDificuldade(dificuldade);
        tare.setResponsavel(responsavel);       
        //tare.setDt_pesq(dt_pesq);
        
        //Insert
        TarefaDAO tareDAO = new TarefaDAO();
        if(tareDAO.altPesq(tare)){
            out.println("Registro ALTERADO com sucesso!");
        }else{
           out.println("Erro! Registro não ALTERADO!!!");
        }
        %>
    </body>
</html>
