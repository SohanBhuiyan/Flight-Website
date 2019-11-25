<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="Registration" method="post">
Username: <input type="text"  name="username">
<br>
Password: <input type="password" name="password">
<br>
<input type="submit" name="action" value="Create new account">

User-Type
<select name="userType">
  <option value="volvo">customer</option>
  <option value="saab">customer-rep</option>
  <option value="opel">admin</option>
</select>


</form>
</body>
</html>