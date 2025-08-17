package com.net.connect;

import com.net.provider.Provider;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class Connect implements Provider {

	static Connection con = null;
	
	 public static Connection getConnection() {
	
		try {
			Class.forName(dclass);
	con = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 return con;
	 }
}
