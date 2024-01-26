<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
  <head>
    <meta name="author" content="Aex Software's"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="style.css" type="text/css">
  </head>
  <body>
   <%! Connection con;%>
   <% 
   try{  
       con=(Connection)session.getAttribute("connection");
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("select* from Student;");
   %>  
   <table border="1">
      <tr>
         <th>Roll_no</th>
         <th>Name</th>
         <th>Result</th>
      </tr>
   <% while(rs.next()){%>
      <tr>
         <td><%=rs.getInt("Roll_no")%></td>
         <td><%=rs.getString("Name")%></td>
         <td><%=rs.getString("Result")%></td>
      </tr>
   <%}%>
   </table>
   <% 
      st.close();
      rs.close();
      con.close();
     }
     catch(SQLException e){
       e.printStackTrace();
     }
    %>
  </body>
</html>