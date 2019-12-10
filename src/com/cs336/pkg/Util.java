package com.cs336.pkg;

import javax.servlet.http.*;
import javax.servlet.*; 
import java.sql.*;

public class Util {

	public void createAccount(String username, String password, String type){
		try{
		//connection setup
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();

		/** String query = "INSERT INTO users  VALUES(" + "\'" + username  + "\'"  + "," + "\'" + password + "\'" + ")";  
		System.out.println(query);
		//Array of instances retrivied by the query
		ResultSet result = stmt.executeQuery(query); **/

		//Make an insert statement for the Sells table:
				String insert = "INSERT INTO users(username,password,type)"
						+ "VALUES (?,?,?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(insert);
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, username);
				ps.setString(2, password); 
				ps.setString(3, type);
				ps.executeUpdate();
				con.close();

	} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
		String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
		System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
	}
	}



	public boolean containsUsername(String username){

		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			String query = "SELECT * FROM users  WHERE username = \'" + username + "\'" ; 

			//Array of instances retrivied by the query
			ResultSet result = stmt.executeQuery(query); 

			if(result.next()){ // we have an entry in our ResultSet
				con.close();
				return true;
			}else{ // no such username::password exists in users table
				con.close();
				return false; 
			}

		} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
		}

		return false; 
	}


	public boolean hasAccount(String username, String password){

		try{
			//connection setup
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			String query = "SELECT * FROM users  WHERE username = \'" + username + "\'"  
					+ " AND "
					+ "password = \'" + password + "\'"; 

			//Array of instances retrivied by the query
			ResultSet result = stmt.executeQuery(query); 

			if(result.next()){ // we have an entry in our ResultSet
				con.close();
				return true;
			}else{ // no such username::password exists in users table
				con.close();
				return false; 
			}

		} catch(Exception ex){ // tells the classname::methodname when a method fails. Easier for debugging
			String currMethodName = new Object() {}.getClass().getEnclosingMethod().getName(); 
			System.out.println(this.getClass().getSimpleName() +"::" + currMethodName  + "  faild"); 
		}

		return false; 

	}




}