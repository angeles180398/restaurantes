<%-- 
    Document   : recoje_datos
    Created on : 12-oct-2020, 12:36:11
    Author     : Angeles Gaona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="prueba.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table width="25%">
        <%
             String nombreR=request.getParameter("nombreR");
            String nombreP=request.getParameter("nombreP");
            String ingredientes=request.getParameter("ingredientes");
              String precio=request.getParameter("precio");
               String usuario=request.getParameter("usuario");
        
           
           
             
            Class.forName("com.mysql.jdbc.Driver");
            
            java.sql.Connection miConexion=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurantes","root","");
            java.sql.Statement miStatement=miConexion.createStatement();
            String instriccionSql="INSERT INTO menus (nombreNegocio, nombrePlatillo, ingredientes, precio, usuario) values ('"+nombreR+"','"+nombreP+"','"+ingredientes+"','"+precio+"','"+usuario+"')";
            miStatement.executeUpdate(instriccionSql);
             response.sendRedirect("consultaMenu.html");
        %>
         
        </table>
    
    </body>
</html>
