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
    <%  String message = null;%>
     
        <% 
            try{
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=wu.chong;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
            
            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            String DataDiNascita = request.getParameter("date");
            
            
            String sql = "Update Giudice set DataDiNascita =? where Nome = ? and Cognome = ?";
                   
                    // calcolo nuovo ID
                    
                    PreparedStatement prepStmt = connection.prepareStatement(sql);
                    prepStmt.setDate(1, java.sql.Date.valueOf(DataDiNascita));
                    prepStmt.setString(2, nome);
                    prepStmt.setString(3, cognome);
                    prepStmt.executeUpdate();
                    message = "Data Modificata";
 
   
            connection.close();
      }catch(Exception e){
          message = "ERRORE";
      }

        %>
    </body>
</html>