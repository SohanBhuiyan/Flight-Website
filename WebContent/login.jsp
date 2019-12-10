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
	
	Util helper = new Util();
	String action = request.getParameter("action");
	
	String username = request.getParameter("username"); 
	String password = request.getParameter("password");
	String type = request.getParameter("type");
	
	// depending on whether the user wants login or register, different segment of the code will run. 
	if (action.equals("login")) {
		
		
		
		if(helper.hasAccount(username,password)){
			String user_type = helper.getType(username); 
			// customer page
			if(user_type.equals("customer")){
				//to send to welcome page 
				session.setAttribute("loginAccess", "success"); 
				response.sendRedirect("welcome.jsp");
			// customer-rep page
			}else if(user_type.equals("customer-rep")){
				session.setAttribute("loginAccess", "success"); 
				response.sendRedirect("customerRepDashboard.jsp");
			//
			}else{
				String redirectURL = "adminlogin.jsp";
				response.sendRedirect("adminlogin.jsp");
			}
		
	
		}else{ // if no account exists, redirect back to login page
			String redirectURL = "index.jsp";
			session.setAttribute("loginAccess", "faild"); 
			response.sendRedirect(redirectURL);
		}
	} else if (action.equals("Create new account")) {
				// user clicked create new acccount
				String redirectURL = "Registration.jsp";
				response.sendRedirect(redirectURL);
	} 

/**	//this is redirecting to the adminlogin.jsp page (added by abbas)
	
	if((username.equals("abbas") && password.equals("abbasadmin"))) {
		//String redirectURL = "adminlogin.jsp";
		response.sendRedirect("adminlogin.jsp");
	} else{ //wrong admin user or password
		String redirectURL = "index.jsp";
		session.setAttribute("loginAccess", "faild"); 
		response.sendRedirect(redirectURL);
	}
*/ 
	%>



</body>
</html>