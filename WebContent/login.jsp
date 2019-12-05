<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Check</title>
</head>
<body>
	<%
	
	String action = request.getParameter("action");
	
	String username = request.getParameter("username"); 
	String password = request.getParameter("password"); 
	
	// depending on whether the user wants login or register, different segment of the code will run. 
	if ("login".equals(action)) {
		
		if(hasAccount(username,password)){
			out.print("Successfully Signed in");
			//to send to welcome page 
			
			response.sendRedirect("welcome.jsp");
	
		}else{ // if no account exists, redirect back to login page
			String redirectURL = "index.jsp";
			session.setAttribute("loginAccess", "faild"); 
			response.sendRedirect(redirectURL);
		}
	} else if ("Create new account".equals(action)) {
		String redirectURL = "index.jsp";
		
		if(containsUsername(username)){
			out.print("Account Exist, try again");
			session.setAttribute("registration", "faild"); 
			response.sendRedirect(redirectURL);
	
		}else{ // if no account exists, redirect back to login page
			createAccount(username,password); 
			session.setAttribute("registration", "success"); 
			response.sendRedirect(redirectURL);
		}
	}
		
	%>



</body>
</html>