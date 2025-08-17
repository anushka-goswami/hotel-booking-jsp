<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.Date, java.text.SimpleDateFormat" %>
<%@ page import="com.net.model.Booking" %>
<%@ page import="com.net.DAO.BookingDAO" %>
<%@ page session="true" %>

<%
    String uname = (String) session.getAttribute("uname");
    if (uname == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    List<Booking> bookings = BookingDAO.getBookingsByUsername(uname);
    Date today = new Date(System.currentTimeMillis());

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Match your DB format
%>

<html>
<head>
    <title>Booking History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center text-primary">Your Booking History</h2>

    <!-- UPCOMING BOOKINGS -->
    <h4 class="mt-4">Upcoming Bookings</h4>
    <div class="row">
    <% 
        for (Booking b : bookings) {
            Date checkinDate = null;
            try {
                checkinDate = Date.valueOf(b.getCheckin()); // assuming b.getCheckin() is "yyyy-MM-dd"
            } catch (Exception e) {
                continue; // skip bad entries
            }

            if (!b.getStatus().equalsIgnoreCase("Cancelled") && checkinDate.compareTo(today) > 0) {
    %>
        <div class="col-md-6 col-lg-4">
            <div class="card mb-3">
                <div class="card-header">Booking ID: <%= b.getId() %></div>
                <div class="card-body">
                    <p><strong>Room ID:</strong> <%= b.getRoomId() %></p>
                    <p><strong>Check-in:</strong> <%= b.getCheckin() %></p>
                    <p><strong>Check-out:</strong> <%= b.getCheckout() %></p>
                    <p><strong>Status:</strong> <%= b.getStatus() %></p>
                </div>
            </div>
        </div>
    <%  }} %>
    </div>

    <!-- PAST BOOKINGS -->
    <h4 class="mt-4">Past Bookings</h4>
    <div class="row">
    <% 
        for (Booking b : bookings) {
            Date checkinDate = null;
            try {
                checkinDate = Date.valueOf(b.getCheckin());
            } catch (Exception e) {
                continue;
            }

            if (!b.getStatus().equalsIgnoreCase("Cancelled") && checkinDate.compareTo(today) <= 0) {
    %>
        <div class="col-md-6 col-lg-4">
            <div class="card mb-3 bg-light">
                <div class="card-header">Booking ID: <%= b.getId() %></div>
                <div class="card-body">
                    <p><strong>Room ID:</strong> <%= b.getRoomId() %></p>
                    <p><strong>Check-in:</strong> <%= b.getCheckin() %></p>
                    <p><strong>Check-out:</strong> <%= b.getCheckout() %></p>
                    <p><strong>Status:</strong> <%= b.getStatus() %></p>
                </div>
            </div>
        </div>
    <%  }} %>
    </div>
</div>
</body>
</html>
