<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Tarefa"%>
<%@page import="model.dao.TarefaDAO"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>

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
            %>
                <b>Pesquisa de Satisfação</b> <br>
                <form method="post" action="updatePesquisa.jsp">
                Identificação: <input type="text" name="ident" value="<%= tare.getId()%>" readonly="true"> <p>                    
                Nome: <input type="text" name="nome" value="<%= tare.getNome()%>" minlength="5" maxlength="30" > <p>
                Descrição: <input type="text" name="descricao" value ="<%= tare.getDescricao() %>" > <p>           
                Dificuldade: <input type="text" name="dificuldade" value ="<%= tare.getDificuldade() %>" > <p> 
                Responsavel: <input type="text" name="responsavel" value ="<%= tare.getResponsavel() %>" > <p> 
                Data da Pesquisa <br>
                <%--<input type="date" name="dt_pesq" value="<%= tare.getDt_pesq() %>"> #Data caso quereira colocar#--%>
                <input type="submit" value="Salvar!"> 
                </form>
                <br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>
                               
            <%    
            }else{
               out.println("Registro não encontrado!!!");
            }

        %>
    </body>
</html>
