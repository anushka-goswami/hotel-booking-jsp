<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.net.DAO.RoomAdminDAO" %>
<%@ page import="com.net.bean.RoomAdminBean" %>

<%
    if (request.getParameter("updateStatus") != null) {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        String newStatus = request.getParameter("newStatus");
        RoomAdminDAO.updateStatus(roomId, newStatus);
    }

    List<RoomAdminBean> roomList = RoomAdminDAO.getAllRooms();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Room Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f3e5f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        h2 {
            text-align: center;
            font-weight: bold;
            color: #6a1b9a;
        }
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 40px;
        }
        .card {
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #ce93d8;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(106, 27, 154, 0.2);
        }
        .card-title {
            color: #8e24aa;
            font-weight: 600;
        }
        .btn-warning {
            background-color: #ab47bc;
            border: none;
            color: #fff;
        }
        .btn-warning:hover {
            background-color: #9c27b0;
        }
        .btn-edit {
            background-color: #7b1fa2;
            color: white;
            border: none;
        }
        .btn-edit:hover {
            background-color: #6a1b9a;
        }
        select.form-select {
            border-radius: 8px;
            border: 1px solid #ba68c8;
        }
        .text-success {
            color: #6a1b9a !important;
        }
        .form-label {
            color: #6a1b9a;
            font-weight: 500;
        }
    </style>
</head>
<body class="container mt-5">

    <!-- Logout Button -->
    <div class="logout-btn">
        <a href="AdminLogin.jsp" class="btn btn-danger">Logout</a>
    </div>

    <h2 class="mb-5">All Room Listings (Admin Panel)</h2>

    <div class="row">
        <% for(RoomAdminBean r : roomList) { %>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm bg-white">
                <img src='<%= r.getImageUrl() %>' class="card-img-top" style="height:200px; object-fit:cover;">
                <div class="card-body">
                    <h5 class="card-title"><%= r.getTitle() %></h5>
                    <p><strong>ID:</strong> <%= r.getId() %></p>
                    <p><%= r.getDescription() %></p>
                    <p><strong>Type:</strong> <%= r.getType() %></p>
                    <p><strong>Price:</strong> ₹<%= r.getPrice() %></p>
                    <p>
                        <strong>Status:</strong>
                        <% if(r.getStatus().equalsIgnoreCase("Booked")) { %>
                            <span class="text-danger fw-bold">Room is currently booked!</span>
                        <% } else { %>
                            <span class="text-success"><%= r.getStatus() %></span>
                        <% } %>
                    </p>

                    <!-- Update Status + Edit Room in same row -->
                    <form method="post">
                        <input type="hidden" name="roomId" value="<%= r.getId() %>">

                        <label for="status_<%= r.getId() %>" class="form-label">Change Status:</label>
                        <select name="newStatus" id="status_<%= r.getId() %>" class="form-select mb-2">
                            <option value="Available" <%= r.getStatus().equals("Available") ? "selected" : "" %>>Available</option>
                            <option value="Booked" <%= r.getStatus().equals("Booked") ? "selected" : "" %>>Booked</option>
                            <option value="Inactive" <%= r.getStatus().equals("Inactive") ? "selected" : "" %>>Inactive</option>
                        </select>

                        <div class="d-flex justify-content-between">
                            <button type="submit" name="updateStatus" class="btn btn-warning">Update Status</button>
                            <a href="editRoom.jsp?roomId=<%= r.getId() %>" class="btn btn-edit">Edit Room</a>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <% } %>
    </div>
</body>
</html>
