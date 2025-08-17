<%@ page import="java.util.*, com.net.DAO.RoomDAO, com.net.bean.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            animation: bgShift 15s ease-in-out infinite alternate;
            overflow-x: hidden;
        }

        @keyframes bgShift {
            0% { background: linear-gradient(135deg, #6a11cb, #2575fc); }
            50% { background: linear-gradient(135deg, #8e2de2, #4a00e0); }
            100% { background: linear-gradient(135deg, #6a11cb, #2575fc); }
        }

        /* Navbar */
        .navbar {
            background-color: rgba(255,255,255,0.85) !important;
            backdrop-filter: blur(10px);
        }

        .navbar-brand {
            font-weight: 700;
            color: #6a11cb;
        }

        .nav-link {
            font-weight: 600;
            color: #444;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: #6a11cb;
        }

        /* Floating Shapes */
        .shape {
            position: absolute;
            width: 250px;
            height: 250px;
            background: radial-gradient(circle, rgba(255,255,255,0.12), transparent);
            border-radius: 50%;
            animation: float 15s infinite ease-in-out alternate;
            z-index: -1;
        }

        .shape:nth-child(1) { top: -80px; left: -80px; animation-delay: 0s; }
        .shape:nth-child(2) { bottom: -120px; right: -90px; animation-delay: 3s; }
        .shape:nth-child(3) { top: 40%; left: 65%; animation-delay: 6s; }

        @keyframes float {
            0% { transform: translateY(0px); opacity: 0.2; }
            50% { transform: translateY(-20px); opacity: 0.4; }
            100% { transform: translateY(0px); opacity: 0.2; }
        }

        /* Room Cards */
        .room-card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            transition: all 0.3s ease;
        }

        .room-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.2);
        }

        .room-card img {
            height: 200px;
            object-fit: cover;
        }

        .availability {
            font-size: 0.95rem;
            font-weight: 600;
        }

        .available {
            color: #28a745;
        }

        .not-available {
            color: #dc3545;
        }

        h3 {
            color: white;
            font-weight: 700;
        }

        .card-title {
            font-weight: 600;
        }

        .btn-primary {
            background-color: #6a11cb;
            border: none;
        }

        .btn-primary:hover {
            background-color: #4a00e0;
        }

        .sparkle {
            position: absolute;
            width: 6px;
            height: 6px;
            background: white;
            border-radius: 50%;
            box-shadow: 0 0 10px 2px #fff;
            animation: sparkleMove 10s linear infinite, sparkleFade 2s ease-in-out infinite alternate;
            z-index: -2;
        }

        @keyframes sparkleMove {
            0% { transform: translateY(0) translateX(0); }
            100% { transform: translateY(-500px) translateX(200px); }
        }

        @keyframes sparkleFade {
            0% { opacity: 0.2; }
            100% { opacity: 0.8; }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">InnoStay</a>
        <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="UserDashBoard.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                
                   <li class="nav-item">
                    <a class="nav-link" href="../ContactUs.jsp">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../help.jsp">Help</a>
                </li>
                <li class="nav-item"><a class="nav-link text-danger" href="../Logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Background Shapes -->
<div class="shape"></div>
<div class="shape"></div>
<div class="shape"></div>

<% for (int i = 0; i < 30; i++) { %>
    <div class="sparkle" style="
        top: <%= (int)(Math.random()*100 + 10) %>vh;
        left: <%= (int)(Math.random()*100) %>vw;
        animation-delay: <%= (Math.random()*5) %>s;
    "></div>
<% } %>

<!-- Room Cards -->
<div class="container mt-5 pt-5">
    <h3 class="text-center mb-5">Search Results</h3>
    <div class="row g-4">
        <%
            String type = request.getParameter("roomType");
            RoomDAO dao = new RoomDAO();
            List<Room> rooms = dao.getRoomsByType(type);

            if (rooms == null || rooms.isEmpty()) {
        %>
            <div class="col-12">
                <p class="text-danger text-center">No rooms found for type: <strong><%= type %></strong></p>
            </div>
        <%
            } else {
                for (Room r : rooms) {
                    boolean isAvailable = r.getStatus() == null || r.getStatus().equalsIgnoreCase("available");
        %>
            <div class="col-md-4">
                <div class="card room-card">
                    <img src='<%= r.getImageUrl() %>' class="card-img-top" alt="Room Image">
                    <div class="card-body">
                        <h5 class="card-title"><%= r.getTitle() %></h5>
                        <p><strong>Room #:</strong> <%= r.getId() %></p>
                        <p><%= r.getDescription() %></p>
                        <p><strong>Price:</strong> ₹<%= r.getPrice() %></p>
                        <p class="availability <%= isAvailable ? "available" : "not-available" %>">
                            Status: <%= isAvailable ? "Available" : "Booked" %>
                        </p>
                        <% if (isAvailable) { %>
                            <a href="booking.jsp?roomId=<%= r.getId() %>" class="btn btn-primary w-100">Book Now</a>
                        <% } else { %>
                            <button class="btn btn-secondary w-100" disabled>Already Booked</button>
                        <% } %>
                    </div>
                </div>
            </div>
        <%
                }
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
