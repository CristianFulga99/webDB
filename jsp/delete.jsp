<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Elenco giudici XFactor</title>
    </head>
    <body>
    
     
        <% 
            try{
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=wu.chong;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
            
            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            
            

            String sql4 = "Delete from Giudice Where  Cognome = ? and Nome = ?";
            PreparedStatement prepStmt = connection.prepareStatement(sql4);
            prepStmt.setString(1, cognome);
            prepStmt.setString(2, nome);
            prepStmt.executeUpdate();
            out.println("Giudice Cancellato");
            
            
            connection.close();
      }catch(Exception e){
          out.println(e);
      }

        %>
    </body>
</html>