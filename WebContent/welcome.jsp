<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Homepage</title>
</head>
<body>

<%
// check to see if the user is logged in correctly before accessing this page 
Object loginStatus = session.getAttribute("loginAccess");

if(loginStatus == null || !loginStatus.equals("success")  ){
	response.sendRedirect("index.jsp");
}
%>


Welcome to our website
<form action = "logout.jsp">
 <input type= "submit" value ="Logout" />
</form>

<form action = "flightSearch.jsp">
 <input type= "submit" value ="Search Flight" />
</form>
  
<form action = "accountInfo.jsp">     
 <input type= "submit" value ="Account History" />
</form>



</body>
</html>