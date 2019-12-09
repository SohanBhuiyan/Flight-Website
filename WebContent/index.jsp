<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>


									  
<br>

<!-- Checks for session info in order to notify user of their action -->
<%
Object registrationStatus = session.getAttribute("registration"); 
Object loginStatus = session.getAttribute("loginAccess");
session.invalidate();
if(loginStatus != null && loginStatus.equals("faild")){
	out.print("Incorrect username and/or password");
}

if(registrationStatus != null && registrationStatus.equals("success")) 
	out.print("Account creation successful");

if(registrationStatus != null && registrationStatus.equals("faild")) 
	out.print("Username taken. Try a different name. ");



%>
<!-- Show Login Interface with submit button -->
<form action="login.jsp" method="post">
Username: <input type="text"  name="username">
<br>
Password: <input type="password" name="password">
<br>
Type: <select name = "type">
  <option value="Customer">Customer</option>
  <option value="Customer-Representative">Customer Representative</option>
</select>
<br>
<input type="submit" name="action" value="login">
<input type="submit" name="action" value="Create new account">
</form>


</body>
</html>