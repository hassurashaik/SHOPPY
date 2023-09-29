<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%

		String proname=request.getParameter("proname");
		String cat=request.getParameter("cat");
		String price=request.getParameter("price");
		String active=request.getParameter("active");
	
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
		    Connection c =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","12345678"); 
		
		    HttpSession s = request.getSession();

		   
		    String q="insert into product(name,cat,price,active)values(?,?,?,?)";
			
		  
		    PreparedStatement p=c.prepareStatement(q);
		    p.setString(1,proname);
		    p.setString(2,cat);
		    p.setString(3,price);
	
		    p.setString(4,active);
		   
		int i=p.executeUpdate();
		    if(i>0) {
		    
		    	
		   	 
		     
			response.sendRedirect("admin.html");

	}
		    else{
		    	%>
				  <h1>hloo</h><%
		    	
		    }

		}
		catch(Exception e) {
			System.out.print(e);
			}%>


</body>
</html>