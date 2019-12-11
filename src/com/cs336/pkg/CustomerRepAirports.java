package com.cs336.pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CustomerRepAirports
 */
public class CustomerRepAirports extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action"); 
		String ap_id = request.getParameter("ap_id"); 
		String new_ap_id = request.getParameter("new_ap_id"); 
		
		switch(action) {
		case "add": 
			add(ap_id);
			break; 
		case "edit":
			edit(ap_id, new_ap_id);
			break;
		case "delete":
			delete(ap_id);
			break;
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public boolean add(String ap_id) {
		
		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			//Make an insert statement for the Sells table:
					String insert = "INSERT INTO airports(ap_id)"
							+ "VALUES (?)";
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);
					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setString(1, ap_id);
			
					ps.executeUpdate();
					con.close();

		} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
			return false; 
		}
		
		return true; 
	}
	public boolean edit(String ap_id, String new_ap_id) {
		
		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			//Make an insert statement for the Sells table:
					String insert = "UPDATE airports set ap_id = ? WHERE ap_id = ?";
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);
					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setString(1, new_ap_id);
					ps.setString(2, ap_id); 
					ps.executeUpdate();
					con.close();

		} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
			return false; 
		}
		
		return true; 
	}

	public boolean delete(String ap_id) {
		
		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			//Make an insert statement for the Sells table:
			String insert = "DELETE FROM airports WHERE ap_id = ? ";
			
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);
					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setString(1, ap_id);
					
					ps.executeUpdate();
					con.close();

		} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
			return false; 
		}
		
		return true; 
	}
		
}
