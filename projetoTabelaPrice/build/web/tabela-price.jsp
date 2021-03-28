<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.RoundingMode"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    double valor;
    double jrs;
    double parce;
    String erro = null;
    try {
        valor = Double.parseDouble(request.getParameter("n1"));
        jrs = Double.parseDouble(request.getParameter("n2"));
        parce = Double.parseDouble(request.getParameter("n3"));

    } catch (Exception ex) {
        valor = 0;
        jrs = 0;
        parce = 0;
        if (request.getParameter("n1") != null && request.getParameter("n2") != null
                && request.getParameter("n3") != null) {
            erro = "Não foi possível processar os dados, por favor tente novamente.";
        }

    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price- JSP</title>

    </head>
    <body>    

        <div class="text-left" style="margin-left: 50px; margin-right: 50px">
            <%@include file="WEB-INF/jspf/menu.jspf" %>
            <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
            <h1>Tabela Price</h1>
                <form>
                    <h6>Valor da Parcela<br><input type="number" name="n1" placeholder="valor em R$"></h6>
                    <h6>Juros<br><input type="number" name="n2" placeholder="valor em %"></h6>
                    <h6>Quantidade de Prestações<br><input type="number" name="n3"></h6>
                    <div><input type="submit" value="Calcular"</div>
                </form>
                <%if (request.getParameter("n1") == null || request.getParameter("n2") == null
                            || request.getParameter("n3") == null) {%>
                <%} else if (erro != null) {%>
                <div style="color:red"><%=erro%></div>
                <%} else {%>
                <%DecimalFormat df = new DecimalFormat("#,##0.00");%>

                <table class="table table-bordered" style="width: auto;height: auto">
                    <tr>
                        <th>Mês</th>
                        <th>Prestação</th>
                        <th>Amortização</th>
                        <th>Juros</th>
                        <th>Saldo Devedor</th>
                    </tr>
                    <%
                        jrs = jrs / 100;
                        double amort = 0;
                        double juros = 0;
                        double parcela = valor * (Math.pow((1 + jrs), parce) * jrs) / (Math.pow((1 + jrs), parce) - 1);
                        for (int i = 0; i <= parce; i++) {%>
                    <%if (i == 0) {%>
                    <th><%=i%></th>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td><%=valor%></td>
                    <%} else if (i > 0) {%>
                    <%
                        juros = valor * jrs;
                        amort = parcela - juros;
                        valor = valor - amort;
                    %>
                    <tr>
                        <th><%=i%>ª</th>
                        <td><%=df.format(parcela)%></td>
                        <td><%=df.format(amort)%></td>
                        <td><%=df.format(juros)%></td>
                        <td><%=df.format(valor)%></td>
                    </tr>
                    <%};%>
                    <%};%>
                </table>
                <%}%>
                <%@include file="WEB-INF/jspf/rodape.jspf"  %>              
        </div>
    </body>
</html>
