<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aircraft Info Edit</title>
</head>
<body>
Edit aircrafts here
<form action="CustomerServlet" method="get">
ac_id: <input type="text"  name="ac_id">
<br>
al_id: <input type="text" name="al_id">
<br>
new ac_id: <input type="text"  name="new_ac_id">
<br>
new al_id: <input type="text"  name="new_al_id">
<br>
<input type="submit" name="action" value="edit">
</form>
</body>
</html>