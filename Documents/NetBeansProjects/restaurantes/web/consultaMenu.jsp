<%-- 
    Document   : consultaMenu
    Created on : 15-dic-2020, 13:36:22
    Author     : Angeles Gaona
--%>


<!-- Los import -->
<%@ page language="java" %>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%> 
<html>
    <head>
       <meta charset="utf-8">
<link href="style.css" rel="stylesheet" type="text/css">
<title>Documento sin título</title>

</head>
<body>
    
    <header>
      <!--barra de navegacion-->
      <nav
       
        style="background-color: #D6EAF8;">
     
       
    <a href="loginJefe.html">Inicio</a>
    <a href="crearMenu.html">Agregar platillo</a>
    <a href="index.html">Salir</a>
    
</nav>
        
    </header>
    
    
    
    
<h1>Menús</h1>
<table width="25%">
  
      
<%
try
{
    String usuario=request.getParameter("usuario");
   // Conexion con bd
  Class.forName("com.mysql.jdbc.Driver");
   java.sql.Connection miConexion=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurantes","root","");
            if (!miConexion.isClosed())
   {
      // La consulta
      Statement st = miConexion.createStatement();
      ResultSet rs = st.executeQuery("SELECT * FROM MENUS where Usuario="+"'"+usuario+"'");
 

      // Ponemos los resultados en un table de html
      out.println("<table border=\"1\">"
              +"<tr><td><label>Nombre Restaurant</label</td>"
              +"<td><label>Platillo</label></td>"
              +"<td><label>Ingredientes</label></td>"
              +"<td><label>Precio</label></td>"
              +"<td><label>Encargado</label></td></tr>");
      while (rs.next())
      {
         out.println("<tr>");
         out.println("<td>"+rs.getObject("nombreNegocio")+"</td>");
         out.println("<td>"+rs.getObject("nombrePlatillo")+"</td>");
         out.println("<td>"+rs.getObject("ingredientes")+"</td>");
         out.println("<td>"+rs.getObject("precio")+"</td>");
         out.println("<td>"+rs.getObject("Usuario")+"</td>");
         
         out.println("</tr>");
      }
      out.println("</table>");

      // cierre de la conexion
      miConexion.close();
   }
   else
      // Error en la conexion
      out.println("fallo");
}
catch (Exception e)
{
   // Error en algun momento.
   out.println("Excepcion "+e);
   e.printStackTrace();
}
%>

</table>
</body>
</html>