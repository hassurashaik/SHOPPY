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
		String email=request.getParameter("email");
		String mobilenumber=request.getParameter("mobilenumber");
		String securityquestion=request.getParameter("securityquestion");
		String answer=request.getParameter("answer");
		String password=request.getParameter("password");
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
		    Connection c =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","12345678"); 
		
		    HttpSession s = request.getSession();

		   
		    String q="insert into user(name,email,mobilenumber,securityquestion,answer,password)values(?,?,?,?,?,?)";
			
		  
		    PreparedStatement p=c.prepareStatement(q);
		    p.setString(1,name);
		    p.setString(2,email);
		    p.setString(3,mobilenumber);
		    p.setString(4,securityquestion);
		    p.setString(5,answer);
		    p.setString(6,password);
		   
		int i=p.executeUpdate();
		    if(i>0) {
		    
		    	
		   	 
		     
			response.sendRedirect("login.html");

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
		
    