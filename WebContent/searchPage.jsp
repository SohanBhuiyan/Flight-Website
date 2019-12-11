<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for a flight</title>
</head>
<body>
Search for flights:
<p>
          <label>Departure airport</label>
          <input type = "Departure airport:"
                 id = "dair"
                 value = "" />
        </p>
        
        <p>
          <label>Arrival airport</label>
          <input type = "Arrival airport:"
                 id = "aair"
                 value = "" />
        </p>
        
        <p>
          <label>Departure date</label>
          <input type = "Departure date"
                 id = "ddate"
                 value = "" />
        </p>
        
        <p>
          <label>Arrival date</label>
          <input type = "Arrival date:"
                 id = "adate"
                 value = "" />
        </p>
        
        <p>
          <label>Trip type (one way / round-trip)</label>
          <input type = "Type:"
                 id = "type"
                 value = "" />
        </p>
        
        <form action = "searchResults.jsp">
 <input type= "submit" value ="Submit" />
</form>


</body>
</html>