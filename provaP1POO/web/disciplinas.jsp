<%-- 
    Document   : disciplinas
    Created on : 11 de abr. de 2021, 19:05:19
    Author     : IGORBATISTAPRIOLEAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("enviarNotas")!=null){
        session.setAttribute("SeTP1", request.getParameter("SeTP1"));
        session.setAttribute("SeTP2", request.getParameter("SeTP2"));
        session.setAttribute("BDP1", request.getParameter("BDP1"));
        session.setAttribute("BDP2", request.getParameter("BDP2"));
        session.setAttribute("ESTP1", request.getParameter("ESTP1"));
        session.setAttribute("ESTP2", request.getParameter("ESTP2"));
        session.setAttribute("ESP1", request.getParameter("ESP1"));
        session.setAttribute("ESP2", request.getParameter("ESP2"));
        session.setAttribute("POOP1", request.getParameter("POOP1"));
        session.setAttribute("POOP2", request.getParameter("POOP2"));
        session.setAttribute("LPP1", request.getParameter("LPP1"));
        session.setAttribute("LPP2", request.getParameter("LPP2"));
        session.setAttribute("SOP1", request.getParameter("SOP1"));
        session.setAttribute("SOP2", request.getParameter("SOP2"));
        session.setAttribute("METP1", request.getParameter("METP2"));
        session.setAttribute("METP2", request.getParameter("METP2"));
        session.setAttribute("COMP1", request.getParameter("COMP1"));
        session.setAttribute("COMP2", request.getParameter("COMP2"));
        //response.sendRedirect(request.getRequestURI());
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <form>
        <table class="table table-bordered" style="width: auto;height: auto; margin: 50px; text-align: center">
            <tr>
                <th>Disciplina</th>
                <th>Dia da semana</th>
                <th>Horário</th>
                <th>Semestre</th>
                <th>Nota P1</th>
                <th>Nota P2</th>
            </tr> 

            <tr>
                <td>Sociedade e Tecnologia</td>
                <td>Sexta-feira</td>
                <td>13:10-14:00</td>
                <td>3</td>
                <td><%= session.getAttribute("SeTP1")%><br><input type="text" name="SeTP1"></td>
                <td><%= session.getAttribute("SeTP2")%><br><input type="text" name="SeTP2"></td>
            </tr>

            <tr>
                <td>Banco de Dados</td>
                <td>Terça-feira</td>
                <td>13:10-16:40</td>
                <td>4</td>
                <td><%= session.getAttribute("BDP1")%><br><input type="text" name="BDP1"></td>
                <td><%= session.getAttribute("BDP2")%><br><input type="text" name="BDP2"></td>
            </tr>

            <tr>
                <td>Estruturas de Dados</td>
                <td>Terça-feira</td>
                <td>13:10-16:40</td>
                <td>3</td>
                <td><%= session.getAttribute("ESTP1")%><br><input type="text" name="ESTP1"></td>
                <td><%= session.getAttribute("ESTP2")%><br><input type="text" name="ESTP2"></td>
            </tr>

            <tr>
                <td>Engenharia de Software III</td>
                <td>Quarta-feira</td>
                <td>15:00-18:30</td>
                <td>4</td>
                <td><%= session.getAttribute("ESP1")%><br><input type="text" name="ESP1"></td>
                <td><%= session.getAttribute("ESP2")%><br><input type="text" name="ESP2"></td>
            </tr>
            <td>Programação Orientada a Objetos</td>
            <td>Segunda-feira</td>
            <td>15:00-18:30</td>
            <td>4</td>
            <td><%= session.getAttribute("POOP1")%><br><input type="text" name="POOP1"></td>
            <td><%= session.getAttribute("POOP2")%><br><input type="text" name="POOP2"></td>
            </tr>

            <tr>
                <td>Linguagem de Programação IV</td>
                <td>Sexta-feira</td>
                <td>13:10-16:40</td>
                <td>4</td>
                <td><%= session.getAttribute("LPP1")%><br><input type="text" name="LPP1"></td>
                <td><%= session.getAttribute("LPP2")%><br><input type="text" name="LPP2"></td>
            </tr>
            <td>Sistemas Operacionais II</td>
            <td>Quarta-feira</td>
            <td>13:10-14:50</td>
            <td>4</td>
            <td><%= session.getAttribute("SOP1")%><br><input type="text" name="SOP1"></td>
            <td><%= session.getAttribute("SOP2")%><br><input type="text" name="SOP2"></td>
            </tr>

            <tr>
                <td>Metodologia da Pesquisa Científico-Tecnológica</td>
                <td>Quinta-feira</td>
                <td>16:40-16:30</td>
                <td>4</td>
                <td><%= session.getAttribute("METP1")%><br><input type="text" name="METP1"></td>
                <td><%= session.getAttribute("METP2")%><br><input type="text" name="METP2"></td>
            </tr>

            <tr>
                <td>Comunicação e Expressão</td>
                <td>Terça-feira</td>
                <td>19:00-22:30</td>
                <td>2</td>
                <td><%= session.getAttribute("COMP1")%><br><input type="text" name="COMP1"></td>
                <td><%= session.getAttribute("COMP2")%><br><input type="text" name="COMP2"></td>
                <td><input type="submit" name="enviarNotas" value="Enviar"></td>
            </tr>
        </table>
        </form>    
    </body>
</html>
