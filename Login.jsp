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
    String name=request.getParameter("name");
		String password=request.getParameter("password");
		try{

			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection c =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","12345678");
			     	    	
			Statement st=c.createStatement();
			HttpSession s = request.getSession();


			    
			  
			    ResultSet rs=st.executeQuery("select * from user where name like '%"+name+"' and password like '%"+password+"'");
			    if(name.equals("hassura") && password.equals("786")){
			    	response.sendRedirect("admin.html");
			    	
			    	
			    }
			    else{
			    if(rs.next()){
			    	response.sendRedirect("home.html");
			    	session.setAttribute("name",name);
			    }
			    else{
			    	%>
					  <h1>hloo</h><%
			    	response.sendRedirect("index.html");
			    }}
		}
		catch(Exception e){
			System.out.print(e);
		}
		
			    %>
</body>
</html>