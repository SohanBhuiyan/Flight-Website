<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<body>

<h3>Retrieve data from database in jsp</h3>

<%
try{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();

	
	String sql ="SELECT username FROM Reserves";
	ResultSet resultSet = stmt.executeQuery(sql);




while(resultSet.next()){

%>
 <td>
 	<% 
	out.print(resultSet.getString("username")); 	 
	%> 
 	</td>

<%




 
}

con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
