package com.cs336.pkg;

import java.io.IOException;
import java.io.PrintWriter;

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
				helper.createAccount(username,password); 
				session.setAttribute("registration", "success"); 
			}
			response.sendRedirect("index.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
