<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - InnoStay</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Nunito:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
            margin: 0;
            padding: 0;
            background: linear-gradient(-45deg, #b19cd9, #fff, #d0bfff, #f3e5f5);
            background-size: 400% 400%;
            animation: gradientBG 12s ease infinite;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Floating shapes */
        .shape {
            position: absolute;
            border-radius: 50%;
            opacity: 0.3;
            animation: float 15s infinite ease-in-out;
            background: #d8b4fe;
        }

        .shape1 { width: 100px; height: 100px; top: 10%; left: 10%; animation-delay: 0s; }
        .shape2 { width: 150px; height: 150px; bottom: 20%; right: 15%; animation-delay: 5s; }
        .shape3 { width: 80px; height: 80px; top: 60%; left: 70%; animation-delay: 8s; }

        @keyframes float {
            0%   { transform: translateY(0px) scale(1); }
            50%  { transform: translateY(-30px) scale(1.05); }
            100% { transform: translateY(0px) scale(1); }
        }

        /* Navbar */
        .navbar-custom {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }

        .navbar-brand {
            font-family: 'Pacifico', cursive;
            font-size: 1.8rem;
            color: #6a11cb !important;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .heart {
            color: #6a11cb;
            animation: pulse 1.5s infinite;
            font-size: 1.5rem;
        }

        @keyframes pulse {
            0% { transform: scale(1); opacity: 0.7; }
            50% { transform: scale(1.2); opacity: 1; }
            100% { transform: scale(1); opacity: 0.7; }
        }

        /* Welcome Text */
         .welcome-text {
            font-size: 3rem;
            font-weight: 700;
            color: #6a11cb;
            text-align: center;
            margin-top: 100px; /* Ensures it's below navbar */
            animation: slideFade 2s ease-out;
        }

        @keyframes slideFade {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Card Styles */
        .card {
            border: none;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.7);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 10px 25px rgba(106, 17, 203, 0.2);
            height: 100%;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.03);
            box-shadow: 0 12px 30px rgba(106, 17, 203, 0.4);
        }

        .card-title {
            color: #6a11cb;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .btn {
            border-radius: 25px;
        }

        .container {
            z-index: 2;
        }
        


    </style>
</head>
<body>
    <!-- Floating Animated Shapes -->
    <div class="shape shape1"></div>
    <div class="shape shape2"></div>
    <div class="shape shape3"></div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                InnoStay <span class="heart">❤</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link text-dark" href="../UserDash/UserDashBoard.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="../UserDash/about.jsp">About</a></li>
                      <li class="nav-item"><a class="nav-link text-dark" href="../ContactUs.jsp">Contact-Us</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="../help.jsp">Help</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="../Logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Welcome Text -->
    <div class="welcome-text">
        👋 Welcome Admin to InnoStay Dashboard
    </div>

    <!-- Dashboard Cards -->
    <div class="container mt-5">
        <div class="row justify-content-center g-4">
            <!-- Add Room -->
            <div class="col-md-4 d-flex">
                <div class="card p-4 w-100">
                    <div class="card-body text-center">
                        <h5 class="card-title">Add Room</h5>
                        <p class="card-text">Add new rooms to your hotel listing.</p>
                        <a href="addRoom.jsp" class="btn btn-outline-primary">Go</a>
                    </div>
                </div>
            </div>

            <!-- View Room -->
            <div class="col-md-4 d-flex">
                <div class="card p-4 w-100">
                    <div class="card-body text-center">
                        <h5 class="card-title">View Rooms</h5>
                        <p class="card-text">See all the available rooms and their details.</p>
                        <a href="viewrooms.jsp" class="btn btn-outline-success">Go</a>
                    </div>
                </div>
            </div>

            <!-- User Info -->
            <div class="col-md-4 d-flex">
                <div class="card p-4 w-100">
                    <div class="card-body text-center">
                        <h5 class="card-title">User Info</h5>
                        <p class="card-text">Check user data and manage accounts.</p>
                        <a href="userinfo.jsp" class="btn btn-outline-warning">Go</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
