<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Elenco giudici XFactor</title>
    </head>
    <body>
    
        <% 
            try{
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=fulga.cristian;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
            
            String nome = request.getParameter("Nome");
            String cognome = request.getParameter("Cognome");
            String luogo = request.getParameter("luogo");
            
            
            //String sqlId = "Select Max(ID) as MaxId from Giudice";
                   
                    //PreparedStatement stmt4 = connection.prepareStatement(sqlId);
                   
                    //ResultSet rs4 = stmt4.executeQuery();
                    //rs4.next();
                    
                    // calcolo nuovo ID
                    //int newId = rs4.getInt("MaxId") + 1;
                    
                    // inserimento del nuovo giudice
                    String sql4 = "INSERT INTO Giudice (Nome, Cognome, LuogoDiNascita) VALUES (?, ?, ?)";
                    PreparedStatement prepStmt = connection.prepareStatement(sql4);
                    prepStmt.setString(1, nome);
                    prepStmt.setString(2, cognome);
                    prepStmt.setString(3, luogo);
                    prepStmt.executeUpdate();
                    out.println("Giudice inserito");
                    
            connection.close();
      }catch(Exception e){
          out.println(e);
      }

        %>
    </body>
</html>