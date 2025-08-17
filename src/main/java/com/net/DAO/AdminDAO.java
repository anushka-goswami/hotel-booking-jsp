package com.net.DAO;

import java.sql.*;
import com.net.connect.Connect;

public class AdminDAO {
    public static boolean validate(String username, String password) {
        boolean status = false;
        try {
            Connection con = Connect.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}


