<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit user flight reservation here</title>
</head>
<body>
<form action="RepEditRes" method="get">
username: <input type="text"  name="username">
<br>
tid : <input type="text"  name="tid">
<br>
new username: <input type="text"  name="new_username">
<br>
new tid : <input type="text"  name="new_tid">
<br>
<input type="submit" name="action" value="edit">
</form>
</body>
</html>