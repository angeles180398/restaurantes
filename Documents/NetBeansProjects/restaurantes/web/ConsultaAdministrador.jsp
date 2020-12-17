<%-- 
    Document   : ConsultaMaestro
    Created on : 16-oct-2020, 8:59:59
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
     
       
    <a href="loginJefe.html">Einicio</a>
    <a href="ConsultaAdmin.jsp">ver Restaurante</a>
    <a href="ConsultaAdministrador.jsp">Ver Administrador</a>
    <a href="ConsultaJefes.jsp">Ver Jefes</a>
    <a href="index.html">Salir</a>
    
</nav>
        
    </header>
    
    
    
    
<h1>Restaurantes</h1>
<table width="25%">
    <tr>
        <td colspan="2" align="center">
          <form action="agregarA.html" method="get">
          <input type="submit" name="button" id="button" value="Agregar">
          </form>
      
      </td>
      <td colspan="2" align="center">
          <form action="editarA.html" method="get">
          <input type="submit" name="button" id="button" value="Editar">
          </form>
      
      </td>
      <td colspan="2" align="center">
          <form action="borrarA.html" method="get">
          <input type="submit" name="button" id="button" value="Borrar">
          </form>
      
      </td>
    </tr>
      
<%
try
{
   // Conexion con bd
  Class.forName("com.mysql.jdbc.Driver");
   java.sql.Connection miConexion=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurantes","root","");
            if (!miConexion.isClosed())
   {
      // La consulta
      Statement st = miConexion.createStatement();
      ResultSet rs = st.executeQuery("SELECT * FROM admin");
 

      // Ponemos los resultados en un table de html
      out.println("<table border=\"1\">"
              +"<tr><td><label>Clave</label</td>"
              +"<td><label>Encargado</label></td>"
               +"<td><label>Contraseña</label></td></tr>");
      while (rs.next())
      {
         out.println("<tr>");
         out.println("<td>"+rs.getObject("id")+"</td>");
         out.println("<td>"+rs.getObject("usuario")+"</td>");
         out.println("<td>"+rs.getObject("contrasena")+"</td>");
         
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