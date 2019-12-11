<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change information for flights here</title>
</head>
<body>
<form action="CustomerRepFlights" method="get">
flight_number <input type="text"  name="flight_number">
<br>
al_id <input type="text"  name="al_id">
<br>
ac_id <input type="text"  name="ac_id">
<br>
<input type="submit" name="action" value="add">
<input type="submit" name="action" value="edit">
<input type="submit" name="action" value="delete">
</form>
</body>
</html>