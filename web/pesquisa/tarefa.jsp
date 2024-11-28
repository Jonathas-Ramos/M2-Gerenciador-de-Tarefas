<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Tarefa"%>
<%@page import="model.dao.TarefaDAO"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pesquisa de Tarefa</title>
</head>
<body>
    <h1>Cadastro de Tarefa</h1>
    <%
        // Receber os parâmetros da requisição
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String dificuldade = request.getParameter("dificuldade");
        String responsavel = request.getParameter("responsavel");
        out.println(String.format("Nome: %s<br>Descrição: %s<br>Dificuldade: %s<br>Responsável: %s<br>",
                                 nome, descricao, dificuldade, responsavel));
        
        
        // Receber os parâmetros da requisição
        

        // Usando String.format para formatar a saída
        


        
        
     
            // Criar uma instância de Tarefa e atribuir os valores
            Tarefa tare = new Tarefa();
            tare.setNome(nome);
            tare.setDescricao(descricao);
            tare.setDificuldade(dificuldade);
            tare.setResponsavel(responsavel);

            // Criar uma instância do TarefaDAO
            TarefaDAO tareDAO = new TarefaDAO();

            // Tentar inserir a tarefa no banco de dados
            try {
                if (tareDAO.insTarefa(tare)) {
                    out.println("<p style='color:green;'>Registro inserido com sucesso!!!</p>");
                } else {
                    out.println("<p style='color:red;'>Erro ao cadastrar os dados!!!</p>");
                }
            } catch (Exception ex) {
                out.println("<p style='color:red;'>Erro ao processar a solicitação: " + ex.getMessage() + "</p>");
            }
        
    %>
</body>
</html>
