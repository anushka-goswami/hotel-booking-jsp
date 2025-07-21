package com.net.connect;

import com.net.provider.Provider;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class Connect implements Provider {

    static Connection con = null;

    public static Connection getConnection() {
        try {
            Class.forName(DCLASS);

            // Fetch DB credentials from environment variables
            String user = System.getenv("DB_USER");
            String pass = System.getenv("DB_PASS");

            if (user == null || pass == null) {
                throw new RuntimeException("Database credentials not set in environment variables!");
            }

            con = DriverManager.getConnection(URL, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return con;
    }
}
