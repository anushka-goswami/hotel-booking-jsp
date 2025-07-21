<%@ page import="java.sql.*, com.net.connect.Connect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Status</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #a18cd1, #fbc2eb); /* Purple gradient */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .message-box {
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }
        h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<%
    String username = (String) session.getAttribute("username");
    if (username == null || username.isEmpty()) {
        username = "Guest";
    }

    int roomId = Integer.parseInt(request.getParameter("roomId"));
    String checkin = request.getParameter("checkin");
    String checkout = request.getParameter("checkout");
    int adults = Integer.parseInt(request.getParameter("adults"));
    int children = Integer.parseInt(request.getParameter("children"));
    String payment = request.getParameter("payment");

    Connection con = null;
    PreparedStatement ps = null;
    PreparedStatement psUpdateRoom = null;

    try {
        con = Connect.getConnection();

        // Insert booking
        String insertSql = "INSERT INTO bookings (room_id, username, checkin, checkout, adults, children, payment_method, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'committed')";
        ps = con.prepareStatement(insertSql);
        ps.setInt(1, roomId);
        ps.setString(2, username);
        ps.setString(3, checkin);
        ps.setString(4, checkout);
        ps.setInt(5, adults);
        ps.setInt(6, children);
        ps.setString(7, payment);
        ps.executeUpdate();

        // Update room status
        String updateRoomSql = "UPDATE rooms SET status='booked' WHERE id=?";
        psUpdateRoom = con.prepareStatement(updateRoomSql);
        psUpdateRoom.setInt(1, roomId);
        psUpdateRoom.executeUpdate();
%>

    <div class="message-box">
        <h2 class="text-success">✅ Booking Successful!</h2>
        <p>Thank you, <b><%= username %></b>. Your room has been booked.</p>
        <a href="./UserDashBoard.jsp" class="btn btn-primary mt-3">Back to Dashboard</a>
    </div>

<%
    } catch (Exception e) {
        e.printStackTrace();
%>
    <div class="message-box">
        <h2 class="text-danger">❌ Booking Failed!</h2>
        <p>Error: <%= e.getMessage() %></p>
        <a href="./UserDashBoard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
    </div>
<%
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (psUpdateRoom != null) psUpdateRoom.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>

</body>
</html>
