<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Flight</title>

<style>
table, th, td {
  border: 1px solid black;
}
</style>
</head>

<body>

<!--below java code will run when a transaction has been made -->
<%
Object purchase_status = session.getAttribute("purchase_status");
if(purchase_status != null && purchase_status.equals("success")){
	out.print("purchase success"); 
}
%>

<form action="FlightSearchServlet" method="get">

Depart Airport: <input type="text"  name="d_port">
<br>
Arrival Airport: <input type="text"  name="a_port">
<br>
Departure Date <input type="date"  name="d_date">
<br>
<input type="submit" name="action" value="search">
<br>
<br>
</form>
<!-- check if we got the results from the form above -->
<%
	ResultSet results = null; 
	
	if (request.getSession().getAttribute("results") != null) {
		out.print("<br>");
		out.print("<br>");
	    results = (ResultSet ) request.getSession().getAttribute("results");
			//Make an HTML table to show the results in:
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make column headers
			out.print("<th> ticket </th>");
			out.print("<th> airline </th>");
			out.print("<th> depart date</th>");
			out.print("<th> depart time</th>");
			out.print("<th> landing date </th>");
			out.print("<th> landing time </th>");
			out.print("<th> class </th>");
			out.print("<th> aircraft </th>");
			out.print("<th> price </th>");
			
			out.print("</tr>"); 
			while (results.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print(results.getString("tid"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(results.getString("al_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(results.getDate("depart_time"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(results.getTime("depart_time"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(results.getDate("arrival_time"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(results.getTime("arrival_time"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(results.getString("class"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(results.getString("ac_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(results.getDouble("total_fare"));
				out.print("</td>");
				
				out.print("</tr>"); // close row
			}
			out.print("</table>");
			out.print("<br>");
	}	
%>			
		<form action="PurchaseServlet" method="get">
		Enter ticket number to purchase it
		<br>
		Ticket Number: <input type="text" placeholder="wait for tickets" name="ticket_num">
		<br>
		<input type="submit" name="action" value="purchase">
		</form>
		
	




</body>
</html>