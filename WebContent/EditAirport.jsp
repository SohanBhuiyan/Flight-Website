<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airport Info Edit</title>
</head>
<body>
Edit aircrafts here
<form action="CustomerRepAirports" method="get">
ap_id: <input type="text"  name="ap_id">
<br>
new ap_id: <input type="text"  name="new_ap_id">
<br>
<input type="submit" name="action" value="edit">
</form>
</body>
</html>