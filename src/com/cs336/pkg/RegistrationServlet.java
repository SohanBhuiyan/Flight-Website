package com.cs336.pkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cs336.pkg.*;
/**
 * Servlet implementation class Registration
 */
public class RegistrationServlet extends HttpServlet {
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Util helper = new Util();
		HttpSession session = request.getSession(); 
		PrintWriter out = response.getWriter(); 
		
		String action = request.getParameter("action");
		String username = request.getParameter("username"); 
		String password = request.getParameter("password"); 
		String userType = request.getParameter("userType"); 
			
		if(action != null){
			
			if(helper.containsUsername(username)){
				out.print("Account Exist, try again");
				session.setAttribute("registration", "faild"); 

			}else{ // if no account exists, redirect back to login page
				createAccount(username,password,userType); 
				session.setAttribute("registration", "success"); 
			}
			response.sendRedirect("index.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	
	public void createAccount(String username, String password, String userType){
		try{
		//connection setup
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String insert = "INSERT INTO users(username,password,type)"
						+ "VALUES (?,?,?)";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, username);
		ps.setString(2, password); 
		ps.setString(3, userType);
		ps.executeUpdate();
		con.close();
		
	} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
		String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
		System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
	}
	}

}
