package com.cs336.pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveReservationServlet
 */
public class RemoveReservationServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			HttpSession session = request.getSession(); 
			ResultSet results = null; 
			
			
		
			
			String tid = request.getParameter("tid"); 
			String username = (String) session.getAttribute("username"); 
			String ticket_class = ""; 
			
			//get class of that ticket
			String getClassQuery = "SELECT class FROM tickets NATURAL JOIN Reserves WHERE username = ? AND tid = ?"; 
			PreparedStatement ps = con.prepareStatement(getClassQuery); 
			ps.setString(1,username);
			ps.setInt(2,Integer.parseInt(tid));
			results = ps.executeQuery(); 
			while(results.next()) {
				ticket_class = results.getString("class"); 
			}
			
			// should not continue if the ticket in question is economy
			if(ticket_class.equals("business") || ticket_class.equals("first-class")) {
				// make ticket purchase_date back to null
				String query = "UPDATE (tickets NATURAL JOIN Reserves) SET purchase_time = null WHERE tid = ? AND username = ?"; 
				ps = con.prepareStatement(query); 
				ps.setInt(1,Integer.parseInt(tid));
				ps.setString(2,username);
				ps.executeUpdate(); 
							
							
				// remove ticket from reserve: 
				query = "DELETE FROM Reserves WHERE tid = ? AND username= ?"; 
				ps = con.prepareStatement(query); 
				ps.setInt(1,Integer.parseInt(tid));
				ps.setString(2,username);
				ps.executeUpdate(); 
				
			}
			response.sendRedirect("welcome.jsp");
			con.close(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
