package com.net.DAO;

import com.net.bean.RoomAdminBean;
import com.net.connect.Connect;

import java.sql.*;
import java.util.*;

public class RoomAdminDAO {

    public static boolean addRoom(RoomAdminBean room) {
        boolean status = false;
        try {
            Connection con = Connect.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO rooms (title, description, type, price, imageUrl, status) VALUES (?, ?, ?, ?, ?, ?)"
            );
            ps.setString(1, room.getTitle());
            ps.setString(2, room.getDescription());
            ps.setString(3, room.getType());
            ps.setDouble(4, room.getPrice());
            ps.setString(5, room.getImageUrl());
            ps.setString(6, room.getStatus());

            int i = ps.executeUpdate();
            if (i > 0) status = true;

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static List<RoomAdminBean> getAllRooms() {
        List<RoomAdminBean> list = new ArrayList<>();
        try {
            Connection con = Connect.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM rooms");

            while (rs.next()) {
                RoomAdminBean room = new RoomAdminBean();
                room.setId(rs.getInt("id"));
                room.setTitle(rs.getString("title"));
                room.setDescription(rs.getString("description"));
                room.setType(rs.getString("type"));
                room.setPrice(rs.getDouble("price"));
                room.setImageUrl(rs.getString("imageUrl"));
                room.setStatus(rs.getString("status"));
                list.add(room);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateStatus(int roomId, String newStatus) {
        boolean status = false;
        try {
            Connection con = Connect.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE rooms SET status=? WHERE id=?");
            ps.setString(1, newStatus);
            ps.setInt(2, roomId);
            int i = ps.executeUpdate();
            if (i > 0) status = true;
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}

