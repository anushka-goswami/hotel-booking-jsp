<%@ page import="java.util.*, com.net.DAO.BookingDAO, com.net.model.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Booking Info</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e0c3fc, #8ec5fc);
            font-family: 'Segoe UI', sans-serif;
            color: #2d2d2d;
        }
        .navbar {
            background: linear-gradient(90deg, #6a11cb, #2575fc);
        }
        .navbar-brand, .nav-link {
            color: white !important;
            font-weight: bold;
        }
        .nav-link:hover {
            color: #ffd700 !important;
        }
        h3 {
            font-weight: 700;
            color: #fff;
            background-color: #6a11cb;
            border-radius: 10px;
            padding: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.2);
        }
        .card {
            margin-bottom: 20px;
            border: none;
            border-radius: 15px;
            background: #fef6f0; /* Light sand tone */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .card-title {
            color: #6a11cb;
            font-weight: bold;
        }
        .card-text strong {
            color: #333;
        }
        .container {
            margin-top: 40px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg shadow-sm" style="background-color: white;">
    <div class="container-fluid px-4">
        <a class="navbar-brand fw-bold text-purple-emphasis" style="color: #6f42c1; font-size: 1.6rem;" href="#">
            InnoStay <span style="animation: beat 1s infinite;">💜</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link nav-animate" href="../index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-animate" href="../UserDash/about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-animate" href="../ContactUs.jsp">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-animate" href="../help.jsp">Help</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-animate" href="AdminDashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-danger nav-animate fw-bold" href="AdminLogin.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>

</nav>

<!-- Main Content -->
<div class="container">
    <h3 class="text-center mb-4">All Booking Details</h3>
    <div class="row">
        <%
            List<Booking> bookings = BookingDAO.getAllBookings();
            for (Booking b : bookings) {
        %>
        <div class="col-md-4">
            <div class="card p-3">
                <div class="card-body">
                    <h5 class="card-title">👤 Username: <%= b.getUsername() %></h5>
                    <p class="card-text">
                        <strong>🏠 Room ID:</strong> <%= b.getRoomId() %><br>
                        <strong>📅 Check-in:</strong> <%= b.getCheckin() %><br>
                        <strong>📅 Check-out:</strong> <%= b.getCheckout() %><br>
                        <strong>👨 Adults:</strong> <%= b.getAdults() %><br>
                        <strong>🧒 Children:</strong> <%= b.getChildren() %><br>
                        <strong>💳 Payment:</strong> <%= b.getPaymentMethod() %><br>
                        <strong>✔️ Status:</strong> <%= b.getStatus() %>
                    </p>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
