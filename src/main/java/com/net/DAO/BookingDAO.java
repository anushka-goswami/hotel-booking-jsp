package com.net.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.net.model.Booking;
import com.net.connect.Connect;

public class BookingDAO {

    public static boolean saveBooking(Booking booking) {
        boolean status = false;

        try {
            Connection con = Connect.getConnection();
            String sql = "INSERT INTO bookings (room_id, username, checkin, checkout, adults, children, payment_method, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, booking.getRoomId());
            ps.setString(2, booking.getUsername());
            ps.setString(3, booking.getCheckin());
            ps.setString(4, booking.getCheckout());
            ps.setInt(5, booking.getAdults());
            ps.setInt(6, booking.getChildren());
            ps.setString(7, booking.getPaymentMethod());
            ps.setString(8, booking.getStatus());

            int i = ps.executeUpdate();
            if (i > 0) status = true;

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static List<Booking> getAllBookings() {
        List<Booking> list = new ArrayList<>();

        try {
            Connection con = Connect.getConnection();
            String sql = "SELECT * FROM bookings";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking b = new Booking();
                b.setId(rs.getInt("id"));
                b.setRoomId(rs.getInt("room_id"));
                b.setUsername(rs.getString("username"));
                b.setCheckin(rs.getString("checkin"));
                b.setCheckout(rs.getString("checkout"));
                b.setAdults(rs.getInt("adults"));
                b.setChildren(rs.getInt("children"));
                b.setPaymentMethod(rs.getString("payment_method"));
                b.setStatus(rs.getString("status"));

                list.add(b);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }public static List<Booking> getBookingsByUsername(String username) {
        List<Booking> list = new ArrayList<>();
        try {
            Connection con = Connect.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setId(rs.getInt("id"));
                b.setRoomId(rs.getInt("room_id"));
                b.setUsername(rs.getString("username"));

                // ✅ Convert java.sql.Date to String
                b.setCheckin(rs.getDate("checkin").toString());
                b.setCheckout(rs.getDate("checkout").toString());

                b.setAdults(rs.getInt("adults"));
                b.setChildren(rs.getInt("children"));
                b.setPaymentMethod(rs.getString("payment_method"));
                b.setStatus(rs.getString("status"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
  
        public static boolean cancelBooking(int bookingId, int roomId) {
            boolean result = false;
            try {
                Connection con = Connect.getConnection();

                // 1. Delete booking
                PreparedStatement ps1 = con.prepareStatement("DELETE FROM bookings WHERE id = ?");
                ps1.setInt(1, bookingId);
                int i = ps1.executeUpdate();

                // 2. Update room status to Available
                PreparedStatement ps2 = con.prepareStatement("UPDATE rooms SET status = 'Available' WHERE id = ?");
                ps2.setInt(1, roomId);
                int j = ps2.executeUpdate();

                if (i > 0 && j > 0) result = true;

                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;
        }
        
    
}
