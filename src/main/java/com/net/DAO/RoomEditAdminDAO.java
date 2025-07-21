package com.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.net.connect.Connect;
import com.net.bean.RoomEditAdminBean;

public class RoomEditAdminDAO {

    public static boolean updateRoom(RoomEditAdminBean room) {
        String sql = "UPDATE rooms SET title = ?, description = ?, type = ?, price = ?, imageUrl = ?, status = ? WHERE id = ?";
        try (Connection conn = Connect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            ps.setString(1, room.getTitle());
            ps.setString(2, room.getDescription());
            ps.setString(3, room.getType());
            ps.setDouble(4, room.getPrice());
            ps.setString(5, room.getImageUrl());
            ps.setString(6, room.getStatus());
            ps.setInt(7, room.getId());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static RoomEditAdminBean getRoomById(int id) {
        RoomEditAdminBean room = null;
        String sql = "SELECT * FROM rooms WHERE id = ?";
        
        try (Connection conn = Connect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                room = new RoomEditAdminBean();
                room.setId(rs.getInt("id"));
                room.setTitle(rs.getString("title"));
                room.setDescription(rs.getString("description"));
                room.setType(rs.getString("type"));
                room.setPrice(rs.getDouble("price"));
                room.setImageUrl(rs.getString("imageUrl"));
                room.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return room;
    }
}
