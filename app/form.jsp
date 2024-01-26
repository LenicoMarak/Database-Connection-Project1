<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
  <head>
    <meta name="author" content="Aex Software's"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
  </head>
  <body>
  <%!Connection conn;%>
  <%
    String host="jdbc:mysql://localhost:3306/School";
    String usr="root";
    String pass="";
    if(request.getParameter("submit")!=null){
      int rollno=Integer.parseInt(request.getParameter("Rollno"));
      String name=request.getParameter("Name");
      String result=request.getParameter("Result");          
      try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn=DriverManager.getConnection(host,usr,pass);
        session.putValue("connection",conn);
        String query="insert into Student(Roll_no,Name,Result) values(?,?,?);";    
        PreparedStatement statement=conn.prepareStatement(query);
        statement.setInt(1,rollno);
        statement.setString(2,name);
        statement.setString(3,result);
        int row=statement.executeUpdate();
        if(row!=0){%>
          <h2><%= "Form successfully submitted"%></h2>
      <%}
        else{%>
          <h2><%= "Failed while submitting your form"%></h2>
          <% return;
        }
        statement.close();
      }
      catch(Exception e){
        e.printStackTrace();
      }
    }
   %>
  <p><a href="infoDb.jsp">Click here</a> to see data store in a database</p>
 </body>
</html>
