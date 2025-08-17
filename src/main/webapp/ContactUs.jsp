<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us - InnoStay</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e8ddf8, #f7f4fc);
            font-family: 'Segoe UI', sans-serif;
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 2rem;
            color: #6f42c1 !important;
            display: flex;
            align-items: center;
        }

        .navbar-brand .heart {
            margin-left: 10px;
            color: #6f42c1;
            font-size: 1.8rem;
            animation: heartbeat 1s infinite;
        }

        @keyframes heartbeat {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.4); }
        }

        .nav-link {
            color: #6f42c1 !important;
            font-weight: 500;
        }

        .nav-link:hover {
            text-decoration: underline;
        }

        .container {
            background-color: white;
            border-radius: 20px;
            padding: 50px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #6f42c1;
            font-weight: 700;
            font-size: 2.5rem;
            animation: fadeInDown 1s ease-in-out;
        }

        h5 {
            color: #5e35b1;
            font-weight: 600;
        }

        ul li {
            margin-bottom: 10px;
        }

        p {
            font-size: 1.1rem;
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .highlight-box {
            background-color: #f3ecff;
            border: 2px dashed #b39ddb;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: center;
        }

        .highlight-box h3 {
            color: #6f42c1;
            font-size: 2rem;
            font-weight: bold;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.05); opacity: 0.9; }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#">
            InnoStay <span class="heart">❤</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="help.jsp">Help</a></li>
                <li class="nav-item"><a class="nav-link active" href="ContactUs.jsp">Contact Us</a></li>
                <li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Highlight Section -->
<div class="container mt-5">
    <div class="highlight-box">
        <h3>We're here to help you — 24x7!</h3>
        <p>Whether it's a room inquiry or a service request, our team is just a message away.</p>
    </div>

    <h2 class="mb-4 text-center">Contact Us</h2>
    <div class="row">
        <div class="col-md-6">
            <h5>Get in Touch</h5>
            <p>Need help with booking, availability, or services? We’re just a message away!</p>
            <ul>
                <li><strong>Check-in/Check-out:</strong> 12:00 PM / 11:00 AM</li>
                <li><strong>Support Timings:</strong> 24x7 Customer Care</li>
                <li><strong>Room Service:</strong> Available 7 AM to 11 PM</li>
                <li><strong>Manager:</strong> Mr. Yogesh Goswami (Hospitality Head)</li>
            </ul>
            <p>We value your feedback and queries. Drop by or connect with us anytime!</p>
        </div>
        <div class="col-md-6">
            <h5>Our Address</h5>
            <p><strong>InnoStay Premium Hotel</strong><br>
                45 MG Road, Connaught Place<br>
                New Delhi - 110001, India</p>
            <p><strong>Email:</strong> support@innostay.com</p>
            <p><strong>Phone:</strong> +91-98765-43210</p>
            <p><strong>Website:</strong> www.innostay.com</p>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
