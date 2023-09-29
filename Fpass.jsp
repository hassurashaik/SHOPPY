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
		String newpassword=request.getParameter("newpassword");
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
		    Connection c =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","12345678"); 
		
		    HttpSession s = request.getSession();
		    int check=0;

		    Statement st=c.createStatement();
		    ResultSet rs=st.executeQuery("select * from user where name like '%"+name+"' and email like '%"+email+"' and mobilenumber like '%"+mobilenumber+"' and securityquestion like '%"+securityquestion+"' and answer like '%"+answer+"' ");
		    while(rs.next()){
		    	check=1;
		    	st.executeUpdate("update user set password='"+newpassword+"' where name like '%"+name+"' and email like '%"+email+"' and mobilenumber like '%"+mobilenumber+"' and securityquestion like '%"+securityquestion+"'");
		    	response.sendRedirect("index.html");

		    }
		    if(check==0){
		    	%><h1>hloo</h1><% 
		    }
	
		    

		}
		catch(Exception e) {
			System.out.print(e);
			}%>

</body>
</html>