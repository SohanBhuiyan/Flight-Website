<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>

<<<<<<< Updated upstream
<form action="login.jsp" method="post">
=======
<h2>Please Register with a valid username and password</h2>
<form action="Registration" method="post">
>>>>>>> Stashed changes
Username: <input type="text"  name="username">
<br>
Password: <input type="password" name="password">
<br>
<<<<<<< Updated upstream
<input type="submit" name="action" value="create account">
</form>
=======

user type: 
<select name="userType">
  <option value="volvo">customer</option>
  <option value="saab">customer-rep</option>
  <option value="opel">admin</option>
</select>


<input type="submit" name="action" value="Create new account">
>>>>>>> Stashed changes




<%!
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