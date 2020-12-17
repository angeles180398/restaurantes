<%-- 
    Document   : entrar
    Created on : 15-oct-2020, 12:39:44
    Author     : Angeles Gaona
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="prueba.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <table width="25%">
                       <%
            String usuario=request.getParameter("usuario");
            String contra=request.getParameter("contra");
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection miConexion=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurantes","root","");
            PreparedStatement c_preparada=miConexion.prepareStatement("SELECT * FROM jefe WHERE usuario=? AND CONTRASENA=?");
            c_preparada.setString(1,usuario);
            c_preparada.setString(2,contra);
            ResultSet miResultSet =c_preparada.executeQuery();
           if(miResultSet.next())  response.sendRedirect("consultaMenu.html");
              
            else out.println("Intentalo de Nuevo");
%>

     
        </table>
    </body>
</html>
