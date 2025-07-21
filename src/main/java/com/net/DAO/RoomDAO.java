package com.net.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.net.bean.Room;
import com.net.connect.Connect;

public class RoomDAO {

    // ✅ Get rooms by type, but only if they are 'available' or 'booked' (not 'inactive')
    public static List<Room> getRoomsByType(String type) {
        List<Room> rooms = new ArrayList<>();

        String sql = "SELECT * FROM rooms WHERE type = ? AND (status = 'available' OR status = 'booked')";

        try (Connection con = Connect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, type);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setTitle(rs.getString("title"));
                room.setDescription(rs.getString("description"));
                room.setType(rs.getString("type"));
                room.setPrice(rs.getDouble("price"));
                room.setImageUrl(rs.getString("imageUrl"));
                room.setStatus(rs.getString("status"));

                rooms.add(room);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rooms;
    }

    // ✅ Get Room by ID
    public static Room getRoomById(int id) {
        Room room = null;

        String sql = "SELECT * FROM rooms WHERE id = ?";

        try (Connection con = Connect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                room = new Room();
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

    // ✅ Mark Room as Booked
    public static boolean markRoomAsBooked(int roomId) {
        String sql = "UPDATE rooms SET status='booked' WHERE id = ?";

        try (Connection con = Connect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, roomId);
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // ✅ Get all booked rooms
    public static List<Room> getBookedRooms() {
        List<Room> rooms = new ArrayList<>();

        String sql = "SELECT * FROM rooms WHERE status = 'booked'";

        try (Connection con = Connect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("id"));
                room.setTitle(rs.getString("title"));
                room.setDescription(rs.getString("description"));
                room.setType(rs.getString("type"));
                room.setPrice(rs.getDouble("price"));
                room.setImageUrl(rs.getString("imageUrl"));
                room.setStatus(rs.getString("status"));

                rooms.add(room);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rooms;
    }
}
