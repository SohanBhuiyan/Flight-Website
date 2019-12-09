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

//this is redirecting to the adminlogin.jsp page (added by abbas)
	}
	if((username.equals("abbas") && password.equals("abbasadmin"))) {
		//String redirectURL = "adminlogin.jsp";
		response.sendRedirect("adminlogin.jsp");
	} else{ //wrong admin user or password
		String redirectURL = "index.jsp";
		session.setAttribute("loginAccess", "faild"); 
		response.sendRedirect(redirectURL);
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
public boolean containsUsername(String username){
	
	try{
		//connection setup
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String query = "SELECT * FROM users  WHERE username = \'" + username + "\'" ; 
		
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
private void createAccount(String username, String password){
	try{
	//connection setup
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	
	/** String query = "INSERT INTO users  VALUES(" + "\'" + username  + "\'"  + "," + "\'" + password + "\'" + ")";  
	System.out.println(query);
	//Array of instances retrivied by the query
	ResultSet result = stmt.executeQuery(query); **/
	
	//Make an insert statement for the Sells table:
			String insert = "INSERT INTO users(username,password)"
					+ "VALUES (?,?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, username);
			ps.setString(2, password); 
			ps.executeUpdate();
			con.close();
	
} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
	String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
	System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
}
}
%>



</body>
</html>