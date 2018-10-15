

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Extrato</title>
    </head>
    <body>
        <%
          try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c =  DriverManager.getConnection("jdbc:mysql://localhost/contabancaria","root","");
            PreparedStatement  p =  c.prepareStatement("select * from conta");
            ResultSet r =  p.executeQuery() ; %>
            <table border="1" > 
                <tr> 
                    <td> Nome </td>
                    <td> Cpf  </td>
                    <td> Rg </td>
					<td> Data de Nascimento </td>
					</tr>
           <% while (r.next()){ %>
            <tr> 
                
                <td><%=r.getString("Nome")%>  </td>
               <td> <%=r.getString("Cpf")%> </td>
			   <td> <%=r.getString("Rg")%> </td>
			   <td> <%=r.getString("Data de Nascimento")%> </td>
            </tr>
            <%}
        } catch (Exception ex) {
          response.getWriter().print("Erro: " + ex.getMessage());
        }
        %>
            </table>
    </body>
</html>
