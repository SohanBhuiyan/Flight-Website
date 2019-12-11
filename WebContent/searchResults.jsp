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

 <table width="100%" border="1">
    <%
    if(request.getSession().getAttribute("loginAccess")==null){
    	response.sendRedirect("index.jsp");
    }
    String username = (String) request.getSession().getAttribute("loggedinuser");
    ApplicationDB db=new ApplicationDB();
    Connection con=db.getConnection();
   // String dAirport = request.getParameter("dair");
	//String aAirport = request.getParameter("aair");
	//String depTime = request.getParameter("ddate");
	//String arrTime = request.getParameter("adate");
	//String type = request.getParameter("type");
    PreparedStatement ps=con.prepareStatement("SELECT * FROM flights INNER JOIN departure"); 
	//PreparedStatement ps=con.prepareStatement("SELECT  arrival_airport, arrival_time, seat_number, depart_airport, depart_time  FROM departure NATURAL JOIN arrival NATURAL JOIN flights NATURAL JOIN associatedFlights NATURAL JOIN Reserves where username=? ORDER BY arrival_time DESC");
  //  ps.setString(1,username);
  
    ResultSet r=ps.executeQuery();
        ResultSetMetaData metaData = r.getMetaData();
        %>
        <tr>
        <td>
        Arrival Airport
        </td>
         <td>
        Arrival Time
        </td>
         <td>
        Seat Number
        </td>
         <td>
        Departing Airport
        </td>
         <td>
        Departure Time
        </td>	
        </tr>
        <% 
        while(r.next())
        {
            %>
                <tr>
                 <%
                 for(int i = 1; i<=metaData.getColumnCount();i++)
                    { %>
                     <td>
                     <%= r.getString(i)%>
                     </td>
                <% 
                    }
                %>                   
                </tr>
            <% 
        }
    %>


</form>
</html> 

</body>
</html>