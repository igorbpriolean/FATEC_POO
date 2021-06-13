<%-- 
    Document   : disciplinas
    Created on : 13 de jun. de 2021, 18:39:16
    Author     : IGORBATISTAPRIOLEAN
--%>

<%@page import="db.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String requestError = null;
    if (request.getParameter("add")!= null){
        String nome = request.getParameter("nome");
        String diasemana = request.getParameter("diasemana");
        String horario = request.getParameter("horario");
        String qtdaulas = request.getParameter("qtdaulas");
        
        try{
            User.addDisciplina(nome, diasemana, horario, qtdaulas);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            requestError = "Falha na criação de disciplina";
        }
    }else if(request.getParameter("delete")!=null){
        String nome = request.getParameter("nome");
        try{
            User.removeDisciplina(nome);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            requestError = "Falha na remoção de disciplina";
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Disciplinas</h2>
        
        <form>
            Nome: <input type="text" name="nome"/>
            Dia da semana: <input type="text" name="diasemana"/>
            Horário: <input type="text" name="horario"/>
            Qtd. de aulas: <input type="text" name="qtdaulas"/>
            <input type="submit" name="add" value="Adicionar"/>
        </form>
        
        <%if(session.getAttribute("user.login")== null){%>
        <br><div>Página restrita a usuários logados</div>
        <%}else{%>
        <br><br>
        <table class="table table-bordered" style="width: auto;height: auto; margin: 50px; text-align: center">
            <tr>
                <th>Nome</th>
                <th>Dia da semana</th>
                <th>Horário</th>
                <th>Qtd. de aulas</th>
                <th>Exclusão</th>
            </tr>
            <%for(User disciplinas:User.getDisciplinas()){%>
            <tr>
                <td><%= disciplinas.getNome()%></td>
                <td><%= disciplinas.getDiasemana()%></td>
                <td><%= disciplinas.getHorario()%></td>
                <td><%= disciplinas.getQtdaulas()%></td>
                
            <td>    
                <form>
                    <input type="hidden" name="nome" value="<%= disciplinas.getNome()%>"/>
                    <input type="submit" name="delete" value="remover"/>
                </form>
            </td>
            </tr>
            <%}%>
        </table>
        <%}%>
    </body>
</html>
