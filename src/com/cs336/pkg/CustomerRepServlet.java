package com.cs336.pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
/**
 * Servlet implementation class CustomerRepServlet
 */
public class CustomerRepServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action"); 
		String ac_id = request.getParameter("ac_id"); 
		String al_id = request.getParameter("al_id"); 
		String new_ac_id = request.getParameter("newac_id");
		String new_al_id = request.getParameter("newal_id");
		switch(action) {
		case "add": 
			add(ac_id,al_id);
			break; 
		case "edit":
			edit(ac_id,al_id,new_ac_id, new_al_id);
			break;
		case "delete":
			delete(ac_id,al_id);
			break;
			
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	
	public boolean add(String ac_id, String al_id) {
		
		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			//Make an insert statement for the Sells table:
					String insert = "INSERT INTO aircrafts(ac_id,al_id)"
							+ "VALUES (?,?)";
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);
					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setString(1, ac_id);
					ps.setString(2, al_id); 
					ps.executeUpdate();
					con.close();

		} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
			return false; 
		}
		
		return true; 
	}
	
public boolean edit(String ac_id, String al_id, String new_ac_id, String new_al_id ) {
		
		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			//Make an insert statement for the Sells table:
					String insert = "UPDATE aircrafts set ac_id = ?, al_id =? WHERE ac_id = ? AND al_id = ?";
					
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);
					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setInt(1, Integer.parseInt(ac_id));
					ps.setString(2, al_id); 
					ps.setInt(3, Integer.parseInt(new_ac_id));
					ps.setString(4, new_al_id); 
					ps.executeUpdate();
					con.close();

		} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
			return false; 
		}
		
		return true; 
	}

public boolean delete(String ac_id, String al_id) {
	
	try{
		//connection setup
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();

		//Make an insert statement for the Sells table:
				String insert = "DELETE FROM aircrafts WHERE ac_id = ? AND al_id = ? ";

				PreparedStatement ps = con.prepareStatement(insert);
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, ac_id);
				ps.setString(2, al_id); 
				ps.executeUpdate();

				stmt.executeUpdate(insert); 

				con.close();

	} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
		String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
		System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
		return false; 
	}
	
	return true; 
}

}
