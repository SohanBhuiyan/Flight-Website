<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
</head>
<body>
Register Form
<form action=RegistrationServlet method="post">
Username: <input type="text"  name="username">
<br>
Password: <input type="password" name="password">
<br>
Type: <select name = "type">
  <option value="Customer">Customer</option>
  <option value="Customer-Representative">Customer Representative</option>
</select>
<br>
<input type="submit" name="action" value="Create new account">


</form>
</body>
</html> 