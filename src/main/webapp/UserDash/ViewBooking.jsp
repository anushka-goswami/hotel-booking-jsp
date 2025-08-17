<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.net.model.Booking" %>
<%@ page import="com.net.DAO.BookingDAO" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f4f0fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background-color: white;
            padding: 1rem 1.5rem;
            border-bottom: 2px solid #d2b4de;
        }
        .navbar-brand {
            font-weight: bold;
            color: #8e44ad;
        }
        .card {
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(155, 89, 182, 0.2);
            margin-bottom: 20px;
        }
        .card-header {
            background-color: #e8daef;
            font-weight: bold;
            color: #6c3483;
        }
    </style>
</head>
<body>

<%
    String uname = (String) session.getAttribute("uname");
    if (uname == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    List<Booking> bookings = BookingDAO.getBookingsByUsername(uname);
%>

<!-- Navbar -->
<nav class="navbar">
    <div class="container-fluid">
        <span class="navbar-brand">InnoStay 💜 - Your Bookings</span>
        <a href="UserInfo.jsp" class="btn btn-sm btn-outline-secondary">Back to Profile</a>
    </div>
</nav>

<div class="container mt-4">
    <h3 class="text-center mb-4 text-purple">Your Booked Rooms</h3>

    <div class="row">
        <% if (bookings != null && !bookings.isEmpty()) {
            for (Booking b : bookings) {
                if (!b.getStatus().equalsIgnoreCase("Cancelled")) {
        %>
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-header">Booking ID: <%= b.getId() %></div>
                    <div class="card-body">
                        <p><strong>Room ID:</strong> <%= b.getRoomId() %></p>
                        <p><strong>Check-in:</strong> <%= b.getCheckin() %></p>
                        <p><strong>Check-out:</strong> <%= b.getCheckout() %></p>
                        <p><strong>Adults:</strong> <%= b.getAdults() %></p>
                        <p><strong>Children:</strong> <%= b.getChildren() %></p>
                        <p><strong>Payment Method:</strong> <%= b.getPaymentMethod() %></p>
                        <p><strong>Status:</strong> <%= b.getStatus() %></p>

                        <form action="cancelBooking.jsp" method="post" onsubmit="return confirm('Cancel this booking?');">
                            <input type="hidden" name="bookingId" value="<%= b.getId() %>">
                            <input type="hidden" name="roomId" value="<%= b.getRoomId() %>">
                            <button type="submit" class="btn btn-sm btn-danger mt-2">Cancel Booking</button>
                        </form>
                    </div>
                </div>
            </div>
        <%  } } // loop end
        } else { %>
            <div class="col-12 text-center">
                <p class="text-muted">No bookings available.</p>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>
