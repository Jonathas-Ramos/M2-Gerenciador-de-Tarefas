<%-- 
    Document   : pesquisa
    Created on : 24 de out. de 2024, 21:03:29
    Author     : alunocmc
--%>

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
        <h1>Exclusão</h1>
        <%
        //Entrada/Receber
         int id = Integer.parseInt(request.getParameter("id"));
            
            // Instância e atrib de valor
        Tarefa tare = new Tarefa();
        tare.setId(id); 
       
        //Apagar
        TarefaDAO tareDAO = new TarefaDAO();
        if(tareDAO.delPesq(tare)){
            out.println("Registro excluído com sucesso!");
        }else{
           out.println("Erro! Registro não excluído!!!");
        }
        %>
    </body>
</html>
