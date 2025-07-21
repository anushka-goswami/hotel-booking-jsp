<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.net.DAO.RoomAdminDAO" %>
<%@ page import="com.net.bean.RoomAdminBean" %>

<%
    if ("true".equals(request.getParameter("logout"))) {
        session.invalidate();
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    if (request.getParameter("addRoom") != null) {
        RoomAdminBean room = new RoomAdminBean();
        room.setTitle(request.getParameter("title"));
        room.setDescription(request.getParameter("description"));
        room.setType(request.getParameter("type"));
        room.setPrice(Double.parseDouble(request.getParameter("price")));
        room.setImageUrl("../images/rooms/" + request.getParameter("imageUrl"));
        room.setStatus("Available");

        boolean added = RoomAdminDAO.addRoom(room);
        if (added) {
%>
            <div class="alert alert-success mt-3">Room added successfully!</div>
<%
        } else {
%>
            <div class="alert alert-danger mt-3">Failed to add room.</div>
<%
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #5e35b1, #7e57c2);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            min-height: 100vh;
            margin: 0;
            overflow-x: hidden;
        }

        .form-container {
            background-color: #1c1c2b;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0px 0px 25px rgba(98, 0, 234, 0.4);
            max-width: 600px;
            margin: 80px auto;
            position: relative;
            z-index: 10;
        }

        h2 {
            color: #d1c4e9;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        input, textarea, select {
            background-color: #2a2a3d;
            border: 1px solid #4a148c;
            color: #fff;
        }

        input::placeholder, textarea::placeholder {
            color: #bdbdbd;
        }

        .btn-primary {
            background-color: #7e57c2;
            border: none;
        }

        .btn-primary:hover {
            background-color: #5e35b1;
        }

        .btn-secondary {
            background-color: #9575cd;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #7e57c2;
        }

        /* Abstract Shapes */
        .abstract-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            overflow: hidden;
        }

        .shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
            animation: float 20s ease-in-out infinite;
            mix-blend-mode: overlay;
        }

        .shape.polygon {
            clip-path: polygon(50% 0%, 100% 38%, 82% 100%, 18% 100%, 0% 38%);
            border-radius: 0;
        }

        @keyframes float {
            0% {
                transform: translateY(0px) rotate(0deg);
                opacity: 0.4;
            }
            50% {
                transform: translateY(-50px) rotate(180deg);
                opacity: 0.2;
            }
            100% {
                transform: translateY(0px) rotate(360deg);
                opacity: 0.4;
            }
        }

        /* Logout Button */
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 30px;
            z-index: 20;
        }
    </style>
</head>
<body>

<!-- Abstract Background Shapes -->
<div class="abstract-shapes">
    <div class="shape" style="width: 150px; height: 150px; top: 10%; left: 20%; animation-delay: 0s;"></div>
    <div class="shape polygon" style="width: 120px; height: 120px; top: 30%; left: 70%; animation-delay: 2s;"></div>
    <div class="shape" style="width: 100px; height: 100px; top: 60%; left: 10%; animation-delay: 4s;"></div>
    <div class="shape polygon" style="width: 80px; height: 80px; top: 80%; left: 50%; animation-delay: 6s;"></div>
</div>

<!-- Logout Button -->
<a href="addRoom.jsp?logout=true" class="btn btn-light logout-btn">Logout</a>

<!-- Form Container -->
<div class="form-container">
    <h2>Add Room</h2>
    <form method="post">
        <input type="text" name="title" placeholder="Room Title" class="form-control mb-3" required>
        <textarea name="description" placeholder="Description" class="form-control mb-3" required></textarea>
        
        <select name="type" class="form-control mb-3" required>
            <option value="">-- Select Room Type --</option>
            <option value="Single Room">Single Room</option>
            <option value="Twin Bedroom">Twin Bedroom</option>
            <option value="Deluxe Room">Deluxe Room</option>
            <option value="Suite">Suite</option>
        </select>

        <input type="number" name="price" placeholder="Price" step="0.01" class="form-control mb-3" required>
        <input type="file" name="imageUrl" placeholder="Image name (e.g. suite1.jpg)" class="form-control mb-3" required>

        <div class="d-flex justify-content-between">
            <button type="submit" name="addRoom" class="btn btn-primary">Add Room</button>
            <a href="viewrooms.jsp" class="btn btn-secondary">View Rooms</a>
        </div>
    </form>
</div>

</body>
</html>
