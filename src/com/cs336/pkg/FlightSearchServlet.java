package com.cs336.pkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FlightSearchServlet
 */
public class FlightSearchServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String depart_airport = request.getParameter("d_port"); 
		String arrival_airport = request.getParameter("a_port"); 
		String depart_date = request.getParameter("d_date"); 
		ResultSet res = getFlightsByDeparture(depart_airport,arrival_airport,depart_date); 
		
		request.getSession().setAttribute("results", res);
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/flightSearch.jsp");
		requestDispatcher.forward(request,response);
		
	}
	
	
	private ResultSet getFlightsByDeparture(String depart_airport,String arrival_airport,String depart_date){
		
		try {
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			ResultSet results = null; 
			
			Statement stmt = con.createStatement();
			String query = "SELECT * from flights NATURAL JOIN departure NATURAL JOIN arrival WHERE "
					+ "depart_time BETWEEN ? AND ?  "
					+ "AND depart_airport=? " 
					+ "AND arrival_airport=?";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query); 
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, depart_date+" 00:00:00");
			ps.setString(2, depart_date+" 23:59:59");
			ps.setString(3, depart_airport);
			ps.setString(4, arrival_airport);
			

			results = ps.executeQuery(); 
			return results; 
		} catch (SQLException e) {
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
			return null; 
		}
		
	}

}
