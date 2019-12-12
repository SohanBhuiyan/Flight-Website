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
 * Servlet implementation class CustomerRepFlights
 */
public class CustomerRepFlights extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action"); 
		String flight_number = request.getParameter("flight_number"); 
		String al_id = request.getParameter("al_id"); 
		String ac_id = request.getParameter("ac_id"); 
		String new_flight_number = request.getParameter("new_flight_number"); 
		String new_al_id = request.getParameter("new_al_id"); 
		String new_ac_id = request.getParameter("new_ac_id"); 
		
		switch(action) {
		case "add": 
			add(flight_number,al_id, ac_id);
			break; 
		case "edit":
			edit(flight_number, al_id, ac_id, new_flight_number, new_al_id, new_ac_id);
			break;
		case "delete":
			delete(flight_number,al_id, ac_id);
			break;
		}
		
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
public boolean add(String flight_number, String al_id, String ac_id) {
		
		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			//Make an insert statement for the Sells table:
					String insert = "INSERT INTO flights values (?,?,?)";
							
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);
					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setInt(1, Integer.parseInt(flight_number));
					ps.setString(2, al_id);
					ps.setInt(3, Integer.parseInt(ac_id));
			
					ps.executeUpdate();
					con.close();

		} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
			return false; 
		}
		
		return true; 
	}
	public boolean edit(String flight_number, String al_id, String ac_id, String new_flight_number, String new_al_id , String new_ac_id  ) {
		
		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			String query = ""; 
			//Make an insert statement for the Sells table:
					query = "UPDATE flights set flight_number = ?, al_id =?, ac_id = ? WHERE flight_number = ? AND al_id = ? AND ac_id = ?";
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(query);
					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself

					ps.setInt(4, Integer.parseInt(flight_number)); 
					ps.setString(5, al_id); 
					ps.setInt(6, Integer.parseInt(ac_id)); 
					
					
					if(new_flight_number == null || new_flight_number.isEmpty()) {
						ps.setInt(1, Integer.parseInt(flight_number)); 
					}else {
						ps.setInt(1, Integer.parseInt(new_flight_number));
					}
					
					if(new_al_id == null || new_al_id.isEmpty()) {
						ps.setString(2, al_id);
					}else {
						ps.setString(2, new_al_id);
					}
					
					if(new_ac_id == null || new_ac_id.isEmpty()) {
						ps.setInt(3, Integer.parseInt(ac_id)); 
					}else {
						ps.setInt(3, Integer.parseInt(new_ac_id));
					}
					
					System.out.println(ps.toString());
					ps.executeUpdate();
					con.close();

		} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
			return false; 
		}
		
		return true; 
	}

	public boolean delete(String flight_number, String al_id, String ac_id) {
		
		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			//Make an insert statement for the Sells table:
			String insert = "DELETE FROM flights WHERE flight_number = ? AND al_id =? AND ac_id = ? ";
			
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);
					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setString(1, flight_number);
					ps.setString(2, al_id);
					ps.setString(3, ac_id);
					
					System.out.println(ps.toString());
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
