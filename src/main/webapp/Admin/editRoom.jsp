<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.net.DAO.RoomEditAdminDAO" %>
<%@ page import="com.net.bean.RoomEditAdminBean" %>

<%
    int roomId = Integer.parseInt(request.getParameter("roomId"));
    RoomEditAdminBean room = RoomEditAdminDAO.getRoomById(roomId);

    if ("true".equals(request.getParameter("updateRoom"))) {
        room.setTitle(request.getParameter("title"));
        room.setDescription(request.getParameter("description"));
        room.setType(request.getParameter("type"));
        room.setPrice(Double.parseDouble(request.getParameter("price")));
        room.setImageUrl("../images/rooms/" + request.getParameter("imageUrl"));
        RoomEditAdminDAO.updateRoom(room);
        response.sendRedirect("viewrooms.jsp");
        return;
    }

    String imageName = "default.jpg";
    if (room.getImageUrl() != null && room.getImageUrl().contains("/")) {
        imageName = room.getImageUrl().substring(room.getImageUrl().lastIndexOf("/") + 1);
    } else if (room.getImageUrl() != null) {
        imageName = room.getImageUrl();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #512da8, #9575cd);
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .form-container {
            background-color: #2c2c4d;
            padding: 30px;
            border-radius: 12px;
            max-width: 600px;
            margin: 60px auto;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
        }
        .form-control, select {
            background-color: #3e3e5e;
            color: white;
            border: 1px solid #9575cd;
        }
        .form-control::placeholder {
            color: #ccc;
        }
        .btn-success {
            background-color: #7e57c2;
            border: none;
        }
        .btn-success:hover {
            background-color: #5e35b1;
        }
    </style>
</head>
<body>
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

<div class="form-container">
    <h2 class="text-center mb-4">Edit Room</h2>
    <form method="post">
        <input type="hidden" name="roomId" value="<%= room.getId() %>">
        <input type="text" name="title" value="<%= room.getTitle() %>" placeholder="Room Title" class="form-control mb-3" required>
        <textarea name="description" placeholder="Description" class="form-control mb-3" required><%= room.getDescription() %></textarea>

        <select name="type" class="form-control mb-3" required>
            <option value="Single Room" <%= room.getType().equals("Single Room") ? "selected" : "" %>>Single Room</option>
            <option value="Twin Bed room" <%= room.getType().equals("Twin Bedroom") ? "selected" : "" %>>Twin Bedroom</option>
            <option value="Deluxe Room" <%= room.getType().equals("Deluxe Room") ? "selected" : "" %>>Deluxe Room</option>
            <option value="Suite" <%= room.getType().equals("Suite") ? "selected" : "" %>>Suite</option>
        </select>

        <input type="number" name="price" value="<%= room.getPrice() %>" placeholder="Price" step="0.01" class="form-control mb-3" required>
        <input type="text" name="imageUrl" value="<%= imageName %>" placeholder="Image name (e.g. suite1.jpg)" class="form-control mb-3" required>

        <button type="submit" name="updateRoom" value="true" class="btn btn-success w-100">Update Room</button>
    </form>
</div>

</body>
</html>
