<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.net.bean.UserBean" %>
<%@ page import="com.net.model.Booking" %>
<%@ page import="com.net.DAO.UserDAO" %>
<%@ page import="com.net.DAO.BookingDAO" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Info</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f8f6ff, #e0d4f7);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background-color: white;
            border-bottom: 2px solid #c9b6e4;
            padding: 0.8rem 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .brand-heart {
            font-size: 1.8rem;
            font-weight: bold;
            color: #8e44ad;
            animation: beat 1s infinite;
        }
        @keyframes beat {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }
        .nav-links a {
            margin-left: 15px;
            color: #6c3483;
            text-decoration: none;
            font-weight: 500;
        }
        .nav-links a:hover {
            color: #bb8fce;
        }
        .card {
            margin-top: 2rem;
            border-radius: 15px;
            box-shadow: 0 0 12px rgba(155, 89, 182, 0.3);
        }
        .card-header {
            background-color: #dcd6f7;
            font-weight: bold;
            color: #512e5f;
        }
        .btn-edit {
            margin-top: 1rem;
            display: inline-block;
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

    UserBean user = UserDAO.getUserByUsername(uname);
    List<Booking> bookings = BookingDAO.getBookingsByUsername(uname);
%>

<!-- Navbar -->
<div class="navbar">
    <div class="brand-heart">InnoStay 💜</div>
    <div class="nav-links">
        <a href="UserDashBoard.jsp">Home</a>
        <a href="about.jsp">About</a>
                <a href="../ContactUs.jsp">Contact</a>
        <a href="../help.jsp">Help</a>
        <a href="../Logout.jsp">Logout</a>
    </div>
</div>

<div class="container">
    <!-- User Info -->
    <div class="card">
        <div class="card-header">Your Info</div>
        <div class="card-body">
            <% if (user != null) { %>
                <p><strong>Name:</strong> <%= user.getName() %></p>
                <p><strong>Email:</strong> <%= user.getEmail() %></p>
                <p><strong>Phone:</strong> <%= user.getPhone() %></p>
                <p><strong>Gender:</strong> <%= user.getGender() %></p>
                <a href="UpdateProfile.jsp" class="btn btn-sm btn-outline-primary btn-edit">Edit Profile</a>
            <% } else { %>
                <p class="text-danger">User information not found.</p>
            <% } %>
        </div>
    </div>

    <!-- Booking Info -->
<!-- View Bookings Redirect -->
<div class="row mt-5">
    <div class="col-12 text-center">
        <h4 class="text-purple">Want to see your room bookings?</h4>
        <a href="ViewBooking.jsp" class="btn btn-outline-success mt-3">View Booked Rooms</a>

    </div>
</div>



<div class="row mt-5">
    <div class="col-12 text-center">
        <h4 class="text-purple">Want to see your room bookings?</h4>
<a href="BookingHistory.jsp" class="btn btn-outline-primary">View Booking History</a>
    </div>
</div>

</div>

</body>
</html>  