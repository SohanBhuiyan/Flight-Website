<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change information for airports here</title>
</head>
<body>
<form action="CustomerRepAirports" method="get">
ap_id <input type="text"  name="ap_id">
<br>
<input type="submit" name="action" value="add">
<input type="submit" name="action" value="edit">
<input type="submit" name="action" value="delete">
</form>

</body>
</html>