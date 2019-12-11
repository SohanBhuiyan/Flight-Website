<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your search</title>
</head>
<body>
Available flights:
<form method="post">

<table border="2">
   <tr>
        <td>Departure airport</td>
        <td>Arrival airport</td>
        <td>Departure time</td>
        <td>Arrival time</td>
        <td>Type</td>
   </tr>
<%
try{
List<String> list = new ArrayList<String>();

ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();

//Create a SQL statement
Statement stmt = con.createStatement();

//Get parameters from the HTML form at the index.jsp
String newBar = request.getParameter("dair");
String newBeer = request.getParameter("aair");
float price = Float.valueOf(request.getParameter("ddate"));


//Make an insert statement for the Sells table:
String query = "SELECT * FROM flight";
//Create a Prepared SQL statement allowing you to introduce the parameters of the query
PreparedStatement ps = con.prepareStatement(query);

//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
//ps.setString(1, newBar);
//ps.executeUpdate();
con.close();
out.print("Success");

} catch (Exception ex) {
out.print(ex);
out.print("Fail");
}
%>


</form>
</html> 

</body>
</html>