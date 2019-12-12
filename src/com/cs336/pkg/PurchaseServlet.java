package com.cs336.pkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;  
/**
 * Servlet implementation class PurchaseServlet
 */
public class PurchaseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		String ticket = request.getParameter("ticket_num"); 
		String username = (String) session.getAttribute("username"); 
		try {
			purchaseTicket(ticket,username);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session.setAttribute("purchase_status", "success");
		response.sendRedirect("flightSearch.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}
	
	
	private boolean purchaseTicket(String ticket, String username) throws NumberFormatException, SQLException {
		//connection setup
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		ResultSet results = null; 
	
		// label sold ticket as purchased by setting purchase_time
		String query = "UPDATE tickets SET purchase_time = ? WHERE tid = ?"; 
		PreparedStatement ps = con.prepareStatement(query); 
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
		ps.setInt(2,Integer.parseInt(ticket));
		ps.executeUpdate(); 
		
		// update Reserve table with username and their purchased ticket's tid
		String reserveQuery = "INSERT INTO Reserves VALUES(?,?)"; 
		ps = con.prepareStatement(reserveQuery); 
		ps.setString(1,username);
		ps.setInt(2, Integer.parseInt(ticket));
		ps.executeUpdate(); 
		con.close(); 
		return true; 
	}

}
