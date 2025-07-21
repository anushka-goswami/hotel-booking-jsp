package com.net.adminDAO;

import java.sql.*;
import com.net.connect.Connect;

public class AdminDAO {

    public static boolean isValidAdmin(String username, String password) {
        boolean status = false;
        try {
            Connection con = Connect.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin_tb WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = true;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
