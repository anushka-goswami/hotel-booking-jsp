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
            <div class="alert alert-success text-center mt-3">Room added successfully!</div>
<%
        } else {
%>
            <div class="alert alert-danger text-center mt-3">Failed to add room.</div>
<%
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Room - Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #5e35b1, #7e57c2);
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .form-container {
            background-color: #1c1c2b;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 25px rgba(98, 0, 234, 0.4);
            max-width: 600px;
            margin: 100px auto;
            position: relative;
            z-index: 10;
        }

        h2 {
            color: #d1c4e9;
            font-weight: bold;
            text-align: center;
            margin-bottom: 25px;
        }

     input, textarea, select {
    background-color: #2a2a3d !important;
    border: 1px solid #4a148c;
    color: #fff;
}

input::placeholder, textarea::placeholder {
    color: #e0e0e0; /* Updated to lighter color */
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

        /* Navbar styling */
        .navbar-brand {
            font-weight: bold;
            color: #6f42c1;
        }

        .nav-link {
            color: #6f42c1 !important;
            font-weight: 500;
            position: relative;
        }

        .nav-link:hover {
            color: #9b59b6 !important;
        }

        .nav-animate::after {
            content: "";
            position: absolute;
            width: 0%;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #9b59b6;
            transition: width 0.3s ease-in-out;
        }

        .nav-animate:hover::after {
            width: 100%;
        }

        @keyframes beat {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.2);
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container-fluid px-4">
        <a class="navbar-brand" href="#">
            InnoStay <span style="animation: beat 1s infinite;">💜</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar"
            aria-controls="adminNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="adminNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link nav-animate" href="../UserDash/UserDashBoard.jsp">Home</a>
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
                    <a class="nav-link text-danger nav-animate fw-bold" href="addroom.jsp?logout=true">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Add Room Form -->
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
        <input type="text" name="imageUrl" placeholder="Image file name (e.g. suite1.jpg)" class="form-control mb-3" required>

        <div class="d-flex justify-content-between">
            <button type="submit" name="addRoom" class="btn btn-primary">Add Room</button>
            <a href="viewrooms.jsp" class="btn btn-secondary">View Rooms</a>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
