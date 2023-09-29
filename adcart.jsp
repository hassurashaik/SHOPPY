<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
  border: 0.5px solid white;
}
    body{
background: rgb(1,0,36);
    background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 35%, rgba(0,212,255,1) 100%);
      min-height:600px;
      margin:0;
      padding:0;
      color:white

    }
</style>
</head>
<body>
<table width="100%">


<tr>

<th><h3>NAME</h3></th>
<th><h3>PRO_NAME</h3></th>
<th><h3>CATEGORY</h3></th>
<th><h3>PRICE</h3></th>
<th><h3>ACTIVE</h3></th>

</tr>
<h1>YOUR CART:</h1>
<% 

try{

Class.forName("com.mysql.cj.jdbc.Driver");  
Connection c =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","12345678");
    
    Statement st=c.createStatement();
   

    String name = (String)request.getSession().getAttribute("name");


    ResultSet rs=st.executeQuery("select * from cart where  name like '%"+name+"'");
    while(rs.next()){%>
    
<tr>

<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>



</tr>
<%
    }
    }catch(Exception e){
System.out.println(e);}%>


</table>

</body>
</html>