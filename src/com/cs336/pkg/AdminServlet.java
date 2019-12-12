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
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getParameter("action"); 
		String username = request.getParameter("username"); 
		String password = request.getParameter("password"); 
		
		switch(action) {
		case "add": 
			add(username,password);
			break; 
		case "edit":
//			edit(ac_id,al_id,newac_id, newal_id);
			break;
		case "delete":
			//delete(username,password);
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
	
	
public boolean add(String username, String password) {
		
		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			//Make an insert statement for the users table:
					String insert = "INSERT INTO users(username,password)"
							+ "VALUES (?,?)";
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);
					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setString(1, username);
					ps.setString(2, password); 
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
