<%@ page import="java.util.*, com.net.DAO.RoomDAO, com.net.bean.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            overflow-x: hidden;
            position: relative;
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            animation: bgShift 20s infinite alternate ease-in-out;
        }

        @keyframes bgShift {
            0% { background: linear-gradient(45deg, #6a11cb, #2575fc); }
            50% { background: linear-gradient(45deg, #8e2de2, #4a00e0); }
            100% { background: linear-gradient(45deg, #6a11cb, #2575fc); }
        }

        /* Floating shapes */
        .shape {
            position: absolute;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(255,255,255,0.15), transparent);
            border-radius: 50%;
            animation: float 18s infinite ease-in-out alternate;
            z-index: -2;
        }

        .shape:nth-child(1) { top: -100px; left: -100px; animation-delay: 0s; }
        .shape:nth-child(2) { bottom: -150px; right: -100px; animation-delay: 3s; }
        .shape:nth-child(3) { top: 40%; left: 65%; animation-delay: 6s; }

        @keyframes float {
            0% { transform: translateY(0) scale(1); opacity: 0.3; }
            50% { transform: translateY(-20px) scale(1.1); opacity: 0.4; }
            100% { transform: translateY(0) scale(1); opacity: 0.3; }
        }

        /* Sparkles */
        .sparkle {
            position: absolute;
            width: 6px;
            height: 6px;
            background: white;
            border-radius: 50%;
            box-shadow: 0 0 10px 2px #fff;
            animation: sparkleMove 12s linear infinite, sparkleFade 2s ease-in-out infinite alternate;
            z-index: -1;
        }

        @keyframes sparkleMove {
            0% { transform: translateY(0) translateX(0); }
            100% { transform: translateY(-500px) translateX(200px); }
        }

        @keyframes sparkleFade {
            0% { opacity: 0.2; }
            100% { opacity: 0.8; }
        }

        .room-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            overflow: hidden;
            border: none;
            background: white;
        }

        .room-card:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .availability {
            font-weight: bold;
            font-size: 1rem;
        }

        .available {
            color: #32cd32;
        }

        .not-available {
            color: #ff4d4d;
        }

        .btn-primary {
            background-color: #7f00ff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #5f00cc;
        }

        h3 {
            color: white;
            font-weight: 600;
        }

        .card-title, .card-text, p {
            color: #333;
        }
    </style>
</head>
<body>

    <!-- Floating Shapes -->
    <div class="shape"></div>
    <div class="shape"></div>
    <div class="shape"></div>

    <!-- Sparkles -->
    <% for (int i = 0; i < 30; i++) { %>
        <div class="sparkle" style="
            top: <%= (int)(Math.random()*100 + 10) %>vh;
            left: <%= (int)(Math.random()*100) %>vw;
            animation-delay: <%= (Math.random()*5) %>s;
        "></div>
    <% } %>

    <!-- Room Listing -->
    <div class="container-fluid px-4 mt-5">
        <h3 class="text-center mb-4">Search Results</h3>
        <div class="row">
            <%
                String type = request.getParameter("roomType");
                RoomDAO dao = new RoomDAO();
                List<Room> rooms = dao.getRoomsByType(type);

                if (rooms == null || rooms.size() == 0) {
            %>
                <div class="col-12">
                    <p class="text-danger text-center">No rooms found for type: <strong><%= type %></strong></p>
                </div>
            <%
                } else {
                    for (Room r : rooms) {
                        String status = r.getStatus();
                        boolean isAvailable = status == null || status.equalsIgnoreCase("available");
            %>
                <div class="col-md-4 mb-4">
                    <div class="card room-card">
                        <img src='<%= r.getImageUrl() %>' class="card-img-top" alt="Room Image">
                        <div class="card-body">
                            <h5 class="card-title"><%= r.getTitle() %></h5>
                            <p><strong>Room Number:</strong> <%= r.getId() %></p>
                            <p class="card-text"><%= r.getDescription() %></p>
                            <p><strong>Price:</strong> ₹<%= r.getPrice() %></p>

                            <p class="availability <%= isAvailable ? "available" : "not-available" %>">
                                Status: <%= isAvailable ? "Available" : "Booked" %>
                            </p>

                            <% if (isAvailable) { %>
                                <a href="booking.jsp?roomId=<%= r.getId() %>" class="btn btn-primary">Book Now</a>
                            <% } else { %>
                                <button class="btn btn-secondary" disabled>Already Booked</button>
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

</body>
</html>
