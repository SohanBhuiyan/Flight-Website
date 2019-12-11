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



<form action="FlightSearchServlet" method="get">

Depart Airport: <input type="text"  name="d_port">
<br>
Arrival Airport: <input type="text"  name="a_port">
<br>
Departure Date <input type="date"  name="d_date">
<br>
<input type="submit" name="action" value="login as Admin">

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
			out.print("<th> flight_number </th>");
			out.print("<th> al_id </th>");
			out.print("<th> ac_id </th>");
			
			out.print("</tr>"); 
			while (results.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print(results.getString("flight_number"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(results.getString("al_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(results.getString("ac_id"));
				out.print("</td>");
				
				out.print("</tr>"); // close row
			}
			out.print("</table>");
			// some extra space
			out.print("<br>");
			out.print("<br>");
			
			out.print("<form action=\"login.jsp\" method=\"get\">");
			out.print("<br>"); 
			out.print("Flight Number: "); 
			out.print("<input type=\"text\"  name=\"flight_num\">"); 
			out.print("<input type=\"submit\" name=\"action\" value=\"purchase\">"); 
		
	}	
	
	
%>

</form>




</body>
</html>