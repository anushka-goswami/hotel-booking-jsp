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
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
        overflow: hidden;
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
        position: absolute;
        top: 30px;
        color: white;
        font-size: 1.5rem;
        font-weight: 700;
        animation: slideDownFade 1.2s ease-out;
        text-align: center;
        width: 100%;
        z-index: 2;
        text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
    }

    @keyframes slideDownFade {
        0% {
            transform: translateY(-20px);
            opacity: 0;
        }
        100% {
            transform: translateY(0);
            opacity: 1;
        }
    }
</style>
</head>

<body>

<!-- Floating bubbles for design -->
<div class="bubble"></div>
<div class="bubble"></div>

<!-- Animated top message -->
<div class="animated-message">Welcome Back to InnoStay 💜</div>

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
        Not registered yet? <a href="Registration.jsp">Click here</a> 
        
        
    
        
    </div>
</div>

</body>
</html>
