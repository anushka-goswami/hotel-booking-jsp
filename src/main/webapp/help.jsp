<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Help & Support - InnoStay</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f5f0ff, #ebe4f9);
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
        
        .help-section {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 6px 18px rgba(111, 66, 193, 0.2);
            color: #4b2c83;
        }
        h2, h4 {
            color: #6f42c1;
        }
        .faq-question {
            font-weight: bold;
            margin-top: 15px;
            color: #5e33a5;
        }
        .btn-primary {
            background-color: #6f42c1;
            border-color: #6f42c1;
        }
        .btn-primary:hover {
            background-color: #5b33a2;
            border-color: #5b33a2;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
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
    <div class="container mt-5 help-section">
        <h2 class="mb-4 text-center">Help & Support</h2>
        <p class="text-center mb-5">We’re here to assist you with your stay and bookings at <strong>InnoStay</strong>.</p>

        <div class="row">
            <div class="col-md-6">
                <h4>Contact Information</h4>
                <p><strong>Customer Care:</strong> +91-9999999999</p>
                <p><strong>Email:</strong> help@innostay.com</p>
                <p><strong>Working Hours:</strong> Mon - Sat, 9:00 AM - 6:00 PM</p>
                <p><strong>Corporate Office:</strong> 12th Floor, InnoStay Plaza, Connaught Place, New Delhi - 110001</p>
            </div>

            <div class="col-md-6">
                <h4>Frequently Asked Questions</h4>
                <p class="faq-question">1. How do I modify my hotel booking?</p>
                <p>Login to your account, go to "My Bookings" and click on "Modify" beside the respective booking.</p>

                <p class="faq-question">2. What is the cancellation policy?</p>
                <p>Free cancellation within 24 hours of booking. Later cancellations may incur charges depending on the hotel policy.</p>

                <p class="faq-question">3. How do I get a refund for a canceled booking?</p>
                <p>Refunds are processed within 5-7 working days to your original payment method.</p>

                <p class="faq-question">4. Is customer support available 24/7?</p>
                <p>Currently, our support is available Mon-Sat, 9 AM to 6 PM. For urgent issues, email us and we'll respond ASAP.</p>
            </div>
        </div>

        <div class="mt-5 text-center">
            <p>If your query is not listed above, feel free to reach out to us. We're happy to help!</p>
            <a href="contactus.jsp" class="btn btn-primary px-4 py-2">Contact Us</a>
        </div>
    </div>
</body>
</html>
