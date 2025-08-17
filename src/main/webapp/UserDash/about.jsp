<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About InnoStay</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #d3cce3, #e9e4f0);
            font-family: 'Segoe UI', sans-serif;
            animation: fadeIn 1.5s ease-in-out;
            overflow-x: hidden;
            color: #4b0082;
            padding-top: 80px; /* Prevent content from hiding behind navbar */
        }

        .container {
            padding: 30px;
            border-radius: 20px;
            background-color: #ffffffde;
            box-shadow: 0px 8px 25px rgba(75, 0, 130, 0.15);
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(40px);}
            to {opacity: 1; transform: translateY(0);}
        }

        .room-card {
            transition: transform 0.4s, box-shadow 0.4s;
            border: none;
            border-radius: 20px;
            overflow: hidden;
            background: #fdf5ff;
            height: 100%;
        }

        .room-card:hover {
            transform: translateY(-10px);
            box-shadow: 0px 12px 25px rgba(123, 50, 200, 0.3);
        }

        .room-img {
            height: 200px;
            object-fit: cover;
            width: 100%;
        }

        .room-title {
            font-weight: bold;
            color: #6a0dad;
        }

        .heart {
            display: inline-block;
            color: #ff69b4;
            font-size: 28px;
            animation: pulse 1.2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.3); }
            100% { transform: scale(1); }
        }

        .sparkle-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
            background-image: radial-gradient(#ffffff66 1px, transparent 1px),
                              radial-gradient(#ffffff33 1px, transparent 1px);
            background-size: 40px 40px, 60px 60px;
            animation: sparkleMove 20s linear infinite;
        }

        @keyframes sparkleMove {
            0% { background-position: 0 0, 0 0; }
            100% { background-position: 100px 100px, 200px 200px; }
        }

        .floating-emoji {
            position: fixed;
            bottom: 20px;
            right: 20px;
            font-size: 50px;
            animation: floatEmoji 3s ease-in-out infinite;
            z-index: 2;
            pointer-events: none;
        }

        @keyframes floatEmoji {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-12px); }
        }

        a {
            color: #6a0dad;
            text-decoration: underline;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary" href="UserDashBoard.jsp">InnoStay</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navContent">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link fw-semibold" href="UserDashBoard.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link fw-semibold active" href="about.jsp">About</a></li>
                <li class="nav-item"><a class="nav-link fw-semibold text-danger" href="../Logout.jsp">Logout</a></li>
                <li class="nav-item"><a class="nav-link" href="../ContactUs.jsp">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="../help.jsp">Help</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Sparkle Background -->
<div class="sparkle-background"></div>

<!-- Main Content -->
<div class="container text-center mt-5">
    <h1>Welcome to InnoStay <span class="heart">💜</span></h1>
    <p class="lead mt-4">Your one-stop destination for an unforgettable hotel experience!</p>
    <p><strong>Phone:</strong> +91 99999-88888</p>
    <p><strong>Instagram:</strong> <a href="https://instagram.com/fake_innostay" target="_blank">@fake_innostay</a></p>
    <hr>
    <p>Discover serenity and luxury at InnoStay — a premium staycation retreat where comfort meets elegance. Whether it's a weekend getaway or a special celebration, InnoStay offers thoughtfully designed rooms, personalized service, and a peaceful ambiance that makes you feel at home, yet away from it all.</p>
</div>

<!-- Room Showcase -->
<div class="container mt-5 mb-5">
    <h2 class="text-center mb-4">🏡 Our Rooms</h2>
    <div class="row g-4">

        <div class="col-md-4 d-flex">
            <div class="card room-card w-100">
                <img src="../images/rooms/deluxroom1.jpeg" class="card-img-top room-img" alt="Deluxe Room">
                <div class="card-body">
                    <h5 class="room-title">Deluxe Room</h5>
                    <p class="card-text">Luxurious and spacious, perfect for a royal stay.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 d-flex">
            <div class="card room-card w-100">
                <img src="../images/rooms/suite1.jpeg" class="card-img-top room-img" alt="Family Suite">
                <div class="card-body">
                    <h5 class="room-title">Family Suite</h5>
                    <p class="card-text">Spacious suite ideal for families with cozy beds and seating area.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 d-flex">
            <div class="card room-card w-100">
                <img src="../images/rooms/single1.jpeg" class="card-img-top room-img" alt="Budget Room">
                <div class="card-body">
                    <h5 class="room-title">Budget Room</h5>
                    <p class="card-text">Affordable comfort with essential amenities for solo travelers.</p>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Floating Emoji -->
<div class="floating-emoji">🛎️</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
