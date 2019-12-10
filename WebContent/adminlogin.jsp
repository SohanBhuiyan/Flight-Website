<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administration Login page</title>
</head>
<body>
<h1 align="center">Welcome Admin</h1>

<ul>
	<li><a href="Edit_info.jsp">Edit user info</a></li>
	<li><a href="salesreport.jsp">sales report for a particular month</a></li>
	<li><a href="reservations.jsp">List of Reservation</a></li>
	<li><a href="Sum_revenue.jsp">Summary of revenue generated</a></li>
	<li><a href="Cus_revenue.jsp">Customer generating most revenue</a></li>
	<li><a href="active_flights.jsp">Most active flights</a></li>
	<li><a href="flights_airports.jsp">List of all Flights</a></li>
</ul>


<form action = "logout.jsp">
 <input type= "submit" value ="Logout" />
</form>

</body>
</html>