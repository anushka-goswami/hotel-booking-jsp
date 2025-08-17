<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login - InnoStay</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Nunito', sans-serif;
        background: linear-gradient(to right, #6a11cb, #2575fc);
        min-height: 100vh;
        overflow-x: hidden;
        padding-top: 90px; /* to account for navbar + message */
        position: relative;
    }

    .bubble {
        position: absolute;
        border-radius: 50%;
        opacity: 0.15;
        animation: float 6s ease-in-out infinite;
        z-index: 0;
    }

    .bubble:nth-child(1) {
        width: 200px;
        height: 200px;
        background: #ffffff;
        top: 10%;
        left: 5%;
    }

    .bubble:nth-child(2) {
        width: 150px;
        height: 150px;
        background: #fff;
        bottom: 10%;
        right: 10%;
    }

    @keyframes float {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-20px); }
    }

    .login-card {
        background-color: #ffffff;
        padding: 40px;
        border-radius: 25px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        width: 100%;
        max-width: 420px;
        margin: 30px auto;
        z-index: 1;
        animation: fadeInUp 1s ease-out forwards;
        transform: translateY(30px);
        opacity: 0;
    }

    @keyframes fadeInUp {
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .form-control {
        border-radius: 12px;
        transition: all 0.3s ease;
    }

    .form-control:focus {
        border-color: #6a11cb;
        box-shadow: 0 0 8px rgba(106, 17, 203, 0.3);
    }

    .btn-login {
        background: linear-gradient(to right, #6a11cb, #2575fc);
        color: white;
        border: none;
        border-radius: 12px;
        padding: 10px;
        font-weight: bold;
        transition: all 0.3s ease;
        width: 100%;
    }

    .btn-login:hover {
        transform: scale(1.05);
        box-shadow: 0 6px 16px rgba(106, 17, 203, 0.4);
    }

    .register-link {
        text-align: center;
        margin-top: 20px;
        font-weight: 600;
    }

    .register-link a {
        color: #6a11cb;
        text-decoration: none;
    }

    .register-link a:hover {
        text-decoration: underline;
    }

    .animated-message {
        color: white;
        font-size: 1.5rem;
        font-weight: 700;
        animation: slideDownFade 1.2s ease-out;
        text-align: center;
        text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
        margin-bottom: 10px;
    }

    @keyframes slideDownFade {
        0% { transform: translateY(-20px); opacity: 0; }
        100% { transform: translateY(0); opacity: 1; }
    }

    .navbar {
        background-color: rgba(255, 255, 255, 0.9) !important;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        backdrop-filter: blur(10px);
    }

    .navbar-brand {
        font-weight: bold;
        color: #6a11cb !important;
    }

    .nav-link {
        color: #333 !important;
        font-weight: 600;
    }

    .nav-link:hover {
        color: #6a11cb !important;
    }
</style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">InnoStay</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserDash/about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ContactUs.jsp">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="help.jsp">Help</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Admin/AdminLogin.jsp">Admin Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Floating bubbles -->
<div class="bubble"></div>
<div class="bubble"></div>

<!-- Welcome Message Below Navbar -->
<div class="container mt-4">
    <div class="animated-message">Welcome Back to InnoStay 💜</div>
</div>

<!-- Login Card -->
<div class="login-card">
    <h2 class="text-center text-dark mb-4">Log In</h2>

    <form method="post" action="log.jsp">
        <div class="mb-3">
            <label class="form-label fw-semibold">Username</label>
            <input type="text" class="form-control" name="username" placeholder="Enter Username" required>
        </div>
        <div class="mb-3">
            <label class="form-label fw-semibold">Password</label>
            <input type="password" class="form-control" name="password" placeholder="Enter Password" required>
        </div>
        <div class="mb-3 text-center">
            <button type="submit" class="btn btn-login">Log In</button>
        </div>
    </form>

    <div class="register-link">
        Not registered yet? <a href="index.jsp">Click here</a>
    </div>
</div>

</body>
</html>
