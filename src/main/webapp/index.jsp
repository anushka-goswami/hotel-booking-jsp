<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>InnoStay - User Registration</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            background: linear-gradient(to right, #f6f8fc, #e0ecff);
            font-family: 'Nunito', sans-serif;
            min-height: 100vh;
        }

        .navbar-brand {
            color: #6a11cb !important;
            font-weight: bold;
        }

        .heart {
            animation: heartbeat 1.3s infinite;
            display: inline-block;
        }

        @keyframes heartbeat {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.2); }
        }

        .navbar-nav .nav-link {
            font-weight: 600;
        }

        .welcome-section {
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 100vh;
            padding: 3rem;
            animation: fadeInLeft 1s ease;
        }

        .welcome-section h1 {
            font-size: 3rem;
            color: #4b0082;
            font-weight: 700;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.1);
        }

        .welcome-section p {
            font-size: 1.2rem;
            margin-top: 1rem;
            color: #333;
        }

        .animated-heart {
            font-size: 3rem;
            animation: heartbeat 1.5s infinite;
            color: #ff6b81;
        }

        @keyframes fadeInLeft {
            from { opacity: 0; transform: translateX(-30px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes fadeInRight {
            from { opacity: 0; transform: translateX(30px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .card {
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            animation: fadeInRight 1s ease;
        }

        .card-header {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: white;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            font-size: 1.8rem;
            text-align: center;
            padding: 1.5rem 1rem;
            font-weight: 700;
        }

        .btn-custom {
            background-color: #6a11cb;
            color: white;
            border-radius: 10px;
            padding: 10px 30px;
            font-weight: bold;
        }

        .btn-custom:hover {
            background-color: #5111a5;
        }

        a {
            color: #6a11cb;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @media(max-width: 768px) {
            .welcome-section {
                text-align: center;
                height: auto;
                padding: 2rem 1rem;
            }
        }
    </style>
</head>
<body>

<!-- ✅ Navbar with 3-line menu -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm px-4">
    <div class="container-fluid">
        <!-- Toggler button for mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Logo/Brand -->
        <a class="navbar-brand ms-2" href="#">
            <span class="heart">💜</span> InnoStay
        </a>

        <!-- Collapsible links -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarMenu">
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#"> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserDash/about.jsp"> About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ContactUs.jsp"> Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="help.jsp"> Help</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="Admin/AdminLogin.jsp"> Admin Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 🧾 Main Content -->
<div class="container-fluid">
    <div class="row h-100">
        <!-- Left: Animated Welcome Section -->
        <div class="col-md-6 d-flex align-items-center justify-content-center welcome-section">
            <div>
                <div class="animated-heart text-center mb-3">💜</div>
                <h1>Welcome to InnoStay!</h1>
                <p>
                    A place where your comfort is our priority.<br/>
                    Join us now and start your journey with <b>trust, joy & care</b> 💫<br/>
                    Stay safe. Stay comfy. Stay with InnoStay 🌟
                </p>
            </div>
        </div>

        <!-- Right: Registration Form -->
        <div class="col-md-6 d-flex align-items-center justify-content-center my-5">
            <div class="col-md-10 col-lg-8">
                <div class="card">
                    <div class="card-header">
                        InnoStay – User Registration
                    </div>
                    <div class="card-body px-5 py-4">
                        <form method="post" action="reg.jsp">
                            <div class="row">
                                <div class="mb-3 col-md-6">
                                    <label class="form-label fw-bold">Full Name</label>
                                    <input type="text" class="form-control" name="name" placeholder="Enter your full name" required>
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label class="form-label fw-bold">Email ID</label>
                                    <input type="email" class="form-control" name="email" placeholder="example@domain.com" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="mb-3 col-md-6">
                                    <label class="form-label fw-bold">Phone Number</label>
                                    <input type="tel" class="form-control" name="phone" placeholder="Enter 10-digit number" pattern="[0-9]{10}" required>
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label class="form-label fw-bold">Gender</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="Male" id="male" required>
                                        <label class="form-check-label" for="male">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="Female" id="female" required>
                                        <label class="form-check-label" for="female">Female</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="mb-3 col-md-4">
                                    <label class="form-label fw-bold">Age</label>
                                    <input type="number" class="form-control" name="age" min="18" max="100" placeholder="Enter your age" required>
                                </div>
                                <div class="mb-3 col-md-4">
                                    <label class="form-label fw-bold">Username</label>
                                    <input type="text" class="form-control" name="username" placeholder="Choose a username" required>
                                </div>
                                <div class="mb-3 col-md-4">
                                    <label class="form-label fw-bold">Password</label>
                                    <input type="password" class="form-control" name="password" placeholder="Choose a strong password" required>
                                </div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-custom">Register</button>
                            </div>

                            <div class="text-center mt-4 fw-bold">
                                Already a member? <a href="Login.jsp">Click here</a> to Login.
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
