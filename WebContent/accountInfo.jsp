<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account</title>
</head>


<body>
<p> Account Flight History</p>
    <%
//     ApplicationDB db=new ApplicationDB();
//     Connection con=db.getConnection();
//     PreparedStatement ps=con.prepareStatement("Select * FROM users");
//     ResultSet result=ps.executeQuery();
    
    %>

<table width="100%" border="1">
    <%
    if(request.getSession().getAttribute("loginAccess")==null){
    	response.sendRedirect("index.jsp");
    }
    String username = (String) request.getSession().getAttribute("loggedinuser");
    ApplicationDB db=new ApplicationDB();
    Connection con=db.getConnection();
    PreparedStatement ps=con.prepareStatement("SELECT tid, arrival_airport, arrival_time, seat_number, depart_airport, depart_time  FROM departure NATURAL JOIN arrival NATURAL JOIN flights NATURAL JOIN associatedFlights NATURAL JOIN Reserves where username=? ORDER BY arrival_time DESC");
    ps.setString(1,username);
  
    ResultSet r=ps.executeQuery();
        ResultSetMetaData metaData = r.getMetaData();
        %>
        <tr>
        <td>
        Ticket Number
        </td>
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
</table>




</body>
</html>