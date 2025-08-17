package com.net.DAO;

import com.net.bean.UserBean;
import com.net.connect.Connect;
import java.sql.*;

public class UserDAO {

    static Connection con = null;
    static int status = 0;
    static PreparedStatement ps = null;
    static Statement st = null;
    static ResultSet rs = null;

    public static int Register(UserBean ub) {
        int status = 0;
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
        } catch (SQLException e) {
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
            if (rs.next())
                status = 1;
            else
                status = 0;
        } catch (Exception e) {
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
        } catch (Exception e) {
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }


    public static int UpdateUser(UserBean ub) {
        int status = 0;
        try {
            con = Connect.getConnection();
            String sql = "UPDATE user_tb SET username=?, password=?, name=?, email=?, phone=?, gender=?, age=? WHERE uid=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, ub.getUsername());
            ps.setString(2, ub.getPassword());
            ps.setString(3, ub.getName());
            ps.setString(4, ub.getEmail());
            ps.setString(5, ub.getPhone());
            ps.setString(6, ub.getGender());
            ps.setInt(7, ub.getAge());
            ps.setInt(8, ub.getUid());
            status = ps.executeUpdate();
        } catch (Exception e) {
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // ✅ NEW METHOD TO GET NAME BASED ON USERNAME
    public static UserBean getUserByUsername(String username) {
        UserBean ub = new UserBean();
        try {
            Connection con = Connect.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user_tb WHERE username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ub.setUid(rs.getInt("uid"));
                ub.setUsername(rs.getString("username"));  // ✅ important
                ub.setPassword(rs.getString("password"));  // ✅ important
                ub.setName(rs.getString("name"));
                ub.setEmail(rs.getString("email"));
                ub.setPhone(rs.getString("phone"));
                ub.setGender(rs.getString("gender"));
                ub.setAge(rs.getInt("age"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ub;
    }

    
}
