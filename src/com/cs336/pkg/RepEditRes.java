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
 * Servlet implementation class RepEditRes
 */
public class RepEditRes extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String username = request.getParameter("username"); 
		String tid = request.getParameter("tid"); 
		String new_username = request.getParameter("new_username"); 
		String new_tid = request.getParameter("new_tid"); 
		edit(username, tid, new_username, new_tid);
		response.sendRedirect("EditFlightRes.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void edit(String username, String tid, String new_username, String new_tid) {
		 try{
				//connection setup
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
				Statement stmt = con.createStatement();

				String reserveQuery = "UPDATE Reserves set username = ?, tid = ? WHERE username = ? AND tid =?"; 
				PreparedStatement ps = con.prepareStatement(reserveQuery); 
				ps = con.prepareStatement(reserveQuery); 
				if(new_username == null || new_username.isEmpty()) {
					ps.setString(1,username);
				}else {
					ps.setString(1,new_username);
				}
				
				if(new_tid == null || new_tid.isEmpty()) {
					ps.setInt(2, Integer.parseInt(tid));
				}else {
					ps.setInt(2, Integer.parseInt(new_tid));
				}
				ps.setString(3,username);
				ps.setInt(4, Integer.parseInt(tid));
				ps.executeUpdate(); 
				con.close();

			} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
				String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
				System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
		
			}
			
	 }
	}
