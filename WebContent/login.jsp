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

	
	// depending on whether the user wants login or register, different segment of the code will run. 
	if ("login".equals(action)) {
		String username = request.getParameter("username"); 
		String password = request.getParameter("password"); 
		 
		if(hasAccount(username,password)){
			out.print("Successfully Signed in");
	
		}else{ // if no account exists, redirect back to login page
			String redirectURL = "index.jsp";
			session.setAttribute("loginAccess", "faild"); 
			response.sendRedirect(redirectURL);
		}
	} else if ("Create new account".equals(action)) {
		
	}
		
			
		
		
	
		
		
		
	
	%>
	


<%! 
	public boolean hasAccount(String username, String password){
		
		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "SELECT * FROM users  WHERE username = \'" + username + "\'"  
					+ " AND "
					+ "password = \'" + password + "\'"; 
			
			//Array of instances retrivied by the query
			ResultSet result = stmt.executeQuery(query); 
			
			if(result.next()){ // we have an entry in our ResultSet
				con.close();
				return true;
			}else{ // no such username::password exists in users table
				con.close();
				return false; 
			}
			
		} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
		}
		
		return false; 
		
	}
%>



</body>
</html>