<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Flights here</title>
</head>
<body>
<form action="CustomerRepFlights" method="get">
flight_number: <input type="text"  name="flight_number">
<br>
al_id: <input type="text"  name="al_id">
<br>
ac_id: <input type="text"  name="ac_id">
<br>
new flight_number: <input type="text"  name="new_flight_number">
<br>
new al_id: <input type="text"  name="new_al_id">
<br>
new ac_id: <input type="text"  name="new_ac_id">
<input type="submit" name="action" value="edit">
</form>
</body>
</html>