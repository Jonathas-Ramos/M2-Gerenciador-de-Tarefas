<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Tarefa"%>
<%@page import="model.dao.TarefaDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresa - Consulta</title>
    </head>
    <body>
        <h1>Pesquisa - Registro</h1>
        <%           
        //Entrada/Receber
            int id = Integer.parseInt(request.getParameter("id"));
            
            // Instância e atrib de valor
            Tarefa tare = new Tarefa();
            tare.setId(id);
        
            //Select
            TarefaDAO tareDAO = new TarefaDAO();
            if(tareDAO.consTarefaId(tare) != null){
                out.println("<br> <b>Pesquisa de Satisfação</b> <br>");
                //out.println("<br> Data: " + tare.getDt_pesq());
                out.println("<br> Nome: " + tare.getNome());
                out.println("<br> Descrição: " + tare.getDescricao());
                out.println("<br> Dificuldade: " + tare.getDificuldade());
                out.println("<br> Responsavel: " + tare.getResponsavel());                             
                                            
            }else{
               out.println("Registro não encontrado!!!");
            }

        %>
    </body>
</html>
