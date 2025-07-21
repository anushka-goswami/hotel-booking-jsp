package com.net.DAO;

import com.net.bean.UserBean;
import com.net.connect.Connect;
import java.sql.*;

public class UserDAO {
 
  static Connection con=null;
  static int status = 0;
  static PreparedStatement ps = null;
  static Statement st = null;
  static ResultSet rs = null;
  
  public static int Register(UserBean ub) {
	    try {
	        con = Connect.getConnection();
	        String sql = "INSERT INTO user_tb (name, email, phone, gender, age, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";

	        ps = con.prepareStatement(sql);
	        ps.setString(1, ub.getName());
	        ps.setString(2, ub.getEmail());
	        ps.setString(3, ub.getPhone());
	        ps.setString(4, ub.getGender());
	        ps.setInt(5, ub.getAge());
	        ps.setString(6, ub.getUsername());
	        ps.setString(7, ub.getPassword());

	        status = ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}

  
  public static int Login(UserBean ub) {
		 try {
			  con = Connect.getConnection();
	
			  
   String sql = "select * from user_tb where username=? and password=?";  
			  ps = con.prepareStatement(sql);
			  ps.setString(1, ub.getUsername());
			  ps.setString(2, ub.getPassword());
			  
		     rs = ps.executeQuery();
		     
		     if(rs.next())
		    	 status =1;
		     else
		    	 status = 0;
			 }
			 catch(Exception e) {
				 e.printStackTrace();
			 }
			  return status;
		  }

  public static ResultSet Show() {
		 try {
			  con = Connect.getConnection();
			  
   String sql = "select * from user_tb";  
			  ps = con.prepareStatement(sql);
			  
		     rs = ps.executeQuery();
		     
			 }
			 catch(Exception e) {
				 e.printStackTrace();
			 }
			  return rs;
		  }

  public static ResultSet ShowRecord(int uid) {
		 try {
			  con = Connect.getConnection();
			  
String sql = "select * from user_tb where uid=?";  
			  ps = con.prepareStatement(sql);
			  
			  ps.setInt(1, uid);
		     rs = ps.executeQuery();
			 }
			 catch(Exception e) {
				 e.printStackTrace();
			 }
			  return rs;
		  }
  
  public static int UpdateUser(UserBean ub) {
	 try {
	  con = Connect.getConnection();
	  
	  String sql = "update user_tb set username=?, password=?, name=?, email=?, dob=?, city=? where uid=?";
	  
	  ps = con.prepareStatement(sql);
      ps.setString(1, ub.getName());
      ps.setString(2, ub.getEmail());
      ps.setString(3, ub.getPhone());
      ps.setString(4, ub.getGender());
      ps.setInt(5, ub.getAge());
      ps.setString(6, ub.getUsername());
      ps.setString(7, ub.getPassword());

	  ps.setInt(8, ub.getUid()); 

	  
	  status = ps.executeUpdate();
	 }
	 catch(Exception e) {
		 e.printStackTrace();
	 }
	  return status;
  }   

  public static int DeleteUser(int uid) {
	 try {
	  con = Connect.getConnection();
	  
	  String sql = "delete from user_tb where uid=?";
	  
	  ps = con.prepareStatement(sql);
	  ps.setInt(1, uid); 

	  status = ps.executeUpdate();
	 }
	 catch(Exception e) {
		 e.printStackTrace();
	 }
	  return status;
  }   

}
