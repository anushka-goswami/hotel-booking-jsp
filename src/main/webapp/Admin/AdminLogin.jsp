<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.net.DAO.AdminDAO" %>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isValid = AdminDAO.validate(username, password);

        if (isValid) {
            session.setAttribute("admin", username);
            response.sendRedirect("AdminDashboard.jsp"); // Redirect to addRoom.jsp
        } else {
            request.setAttribute("error", "Invalid Username or Password!");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Nunito', sans-serif;
            overflow: hidden;
        }

        .login-box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            max-width: 400px;
            padding: 40px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.3);
            z-index: 2;
        }

        h2 {
            color: #6a11cb;
            text-align: center;
            margin-bottom: 25px;
            font-weight: 700;
        }

        /* Bubbles animation */
        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            overflow: hidden;
            z-index: 0;
        }

        .bubble {
            position: absolute;
            bottom: -100px;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            animation: rise 10s infinite ease-in;
        }

        .bubble:nth-child(1) { left: 10%; width: 20px; height: 20px; animation-duration: 8s; }
        .bubble:nth-child(2) { left: 20%; animation-duration: 10s; }
        .bubble:nth-child(3) { left: 35%; width: 25px; height: 25px; animation-duration: 12s; }
        .bubble:nth-child(4) { left: 50%; width: 15px; height: 15px; animation-duration: 9s; }
        .bubble:nth-child(5) { left: 65%; width: 30px; height: 30px; animation-duration: 11s; }
        .bubble:nth-child(6) { left: 80%; width: 10px; height: 10px; animation-duration: 7s; }

        @keyframes rise {
            0% {
                transform: translateY(0) scale(1);
                opacity: 1;
            }
            100% {
                transform: translateY(-1200px) scale(0.5);
                opacity: 0;
            }
        }
          .navbar-custom {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    }

    .navbar-custom .navbar-brand {
        color: #ffffff;
        font-weight: bold;
        font-size: 1.5rem;
    }

    .navbar-custom .nav-link {
        color: #ffffff;
        margin: 0 10px;
        transition: all 0.3s ease;
    }

    .navbar-custom .nav-link:hover {
        color: #ffccff;
        text-decoration: underline;
    }

    .navbar-toggler {
        border: none;
        color: white;
    }

    .navbar-toggler-icon {
        background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba%28255, 255, 255, 0.7%29' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
    }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-custom fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">InnoStay 💜</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon text-white">☰</span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="../UserDash/UserDashBoard.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../UserDash/about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../ContactUs.jsp">Contact-Us </a>
                </li>
                     <li class="nav-item">
                    <a class="nav-link" href="../help.jsp">Help</a>
                </li>
              
                <li class="nav-item">
                    <a class="nav-link" href="../Logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

    <!-- Animated Background -->
    <div class="bg-animation">
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
    </div>

    <!-- Login Form -->
    <div class="login-box">
        <h2>Admin Login</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>

        <form method="post" action="">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" name="username" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
    </div>

</body>
</html>
