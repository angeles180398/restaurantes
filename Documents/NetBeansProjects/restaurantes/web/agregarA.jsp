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
            <h1>AGREGA ADMINISTRADOR</h1>
        <%
             String nombre=request.getParameter("nombre");
            String contrasena=request.getParameter("contrasena");
           
           
           
             
            Class.forName("com.mysql.jdbc.Driver");
            
            java.sql.Connection miConexion=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurantes","root","");
            java.sql.Statement miStatement=miConexion.createStatement();
            String instriccionSql="INSERT INTO admin (usuario, contrasena) values ('"+nombre+"','"+contrasena+"')";
            miStatement.executeUpdate(instriccionSql);
             response.sendRedirect("ConsultaAdministrador.jsp");
        %>
         
        </table>
    
    </body>
</html>
