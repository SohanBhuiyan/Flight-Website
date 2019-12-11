<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="CustomerServlet" method="get">
ac_id: <input type="text"  name="ac_id">
<br>
al_id: <input type="text" name="al_id">
<br>
<input type="submit" name="action" value="add">
<input type="submit" name="action" value="edit">
<input type="submit" name="action" value="delete">
</form>


</body>
</html>