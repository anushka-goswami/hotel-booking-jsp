package com.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.net.model.Booking;
import com.net.connect.Connect;

public class BookingDAO {

    public static boolean saveBooking(Booking booking) {
        boolean status = false;

        try {
            Connection con = Connect.getConnection();
            String sql = "INSERT INTO bookings (room_id, username, room_type, checkin, checkout, guests, amount) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, booking.getRoomId()); // ✅ Now this will work
            ps.setString(2, booking.getUsername());
            ps.setString(3, booking.getRoomType());
            ps.setString(4, booking.getCheckin());
            ps.setString(5, booking.getCheckout());
            ps.setInt(6, booking.getGuests());
            ps.setDouble(7, booking.getAmount());

            int i = ps.executeUpdate();
            if (i > 0) status = true;

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}
