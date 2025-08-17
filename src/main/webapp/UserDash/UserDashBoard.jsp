<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<style>
    body {
        font-family: 'Nunito', sans-serif;
        margin: 0;
        padding: 0;
        background: transparent;
        position: relative;
        min-height: 100vh;
    }

    #particles-js {
        position: fixed;
        width: 100%;
        height: 100%;
        background: linear-gradient(to right, #6a11cb, #2575fc);
        z-index: -1;
    }

    .animated-heart {
        animation: pulse 1.2s infinite;
        display: inline-block;
        margin-left: 8px;
        color: #a020f0; /* purple heart */
    }

    @keyframes pulse {
        0% { transform: scale(1); opacity: 0.7; }
        50% { transform: scale(1.3); opacity: 1; }
        100% { transform: scale(1); opacity: 0.7; }
    }

    .navbar {
        background: #ffffff;
        border-radius: 0 0 20px 20px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        z-index: 10;
    }

    .navbar-brand {
        color: #6a11cb !important;
        font-weight: bold;
        font-size: 1.5rem;
    }

    .nav-link {
        color: #6a11cb !important;
        font-weight: 600;
    }

    .nav-link:hover, .nav-link.active {
        color: #2575fc !important;
    }

    .dashboard-container {
        display: flex;
        flex-wrap: wrap;
        margin-top: 40px;
        padding: 20px;
        gap: 20px;
        z-index: 1;
    }

    .hotel-image {
        flex: 1;
        min-width: 300px;
        height: 400px;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
    }

    .dashboard-content {
        flex: 2;
        min-width: 300px;
        background-color: white;
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        position: relative;
        z-index: 2;
    }

    .welcome-text {
        font-size: 2rem;
        font-weight: bold;
        color: #6a11cb;
    }

    .section-title {
        margin-top: 20px;
        font-size: 1.4rem;
        font-weight: 600;
        color: #444;
    }

    .form-select, .form-control {
        border-radius: 10px;
        border-color: #6a11cb;
        box-shadow: none;
    }

    .btn-primary {
        background: linear-gradient(to right, #6a11cb, #2575fc);
        border: none;
        border-radius: 12px;
        font-weight: 600;
    }

    .btn-primary:hover {
        transform: scale(1.05);
        box-shadow: 0 5px 15px rgba(106, 17, 203, 0.4);
    }

    .carousel-inner img {
        width: 100%;
        height: 400px;
        object-fit: cover;
        border-radius: 20px;
        transition: transform 0.5s ease-in-out;
    }

    .carousel-inner {
        border-radius: 20px;
        overflow: hidden;
        height: 400px; /* Fixed height to avoid shifting */
    }

    .carousel-item {
        height: 400px;
    }

    .custom-carousel-img:hover {
        transform: scale(1.02);
    }

    footer {
        color: white;
        font-size: 0.9rem;
        z-index: 3;
    }

    footer hr {
        border-top: 1px solid #ffffff44;
    }
</style>
</head>

<body>

<div id="particles-js"></div>

<%
   if(session.getAttribute("uname") == null){
	   response.sendRedirect("../Login.jsp");
   }
%>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">InnoStay<span class="animated-heart">❤</span> Dashboard</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" href="UserDashBoard.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
           <li class="nav-item">
                    <a class="nav-link" href="../ContactUs.jsp"> Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../help.jsp"> Help</a>
                </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Services</a>
          <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="../Admin/AdminLogin.jsp">Admin Login</a></li>

            <li><a href="<%= request.getContextPath() %>/UserDash/UserProfile.jsp">User Profile</a>
</li>
            <li><a class="dropdown-item" href="#">Other</a></li>
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link" href="../Logout.jsp">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- MAIN DASHBOARD -->
<div class="container dashboard-container">

  <!-- SLIDESHOW -->
  <div class="hotel-image">
    <div id="aestheticSlider" class="carousel slide shadow" data-bs-ride="carousel" data-bs-interval="3000">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="images/hotel.jpeg" class="d-block w-100" alt="Luxury Room">
        </div>
        <div class="carousel-item">
          <img src="images/res.jpg" class="d-block w-100" alt="Resort Room">
        </div>
        <div class="carousel-item">
          <img src="images/lo.jpg" class="d-block w-100" alt="Lounge">
        </div>
        <div class="carousel-item">
          <img src="images/pool.jpg" class="d-block w-100" alt="Bedroom">
        </div>
      </div>
    </div>
  </div>

  <!-- DASHBOARD CONTENT -->
  <div class="dashboard-content">
      <div class="welcome-text animate__animated animate__fadeInDown">
          Welcome, <%= session.getAttribute("uname") %>!
      </div>
      
      <div class="section-title mt-3">
          We’re happy to see you on InnoStay 💼<br>
          Explore services from the navbar above.
      </div>

      <!-- SEARCH BAR -->
      <div class="mt-4">
          <form action="searchResult.jsp" method="get" class="row g-3 align-items-center">
              <div class="col-auto">
                  <label for="roomType" class="col-form-label fw-bold">Search Room Type:</label>
              </div>
              <div class="col-auto">
                  <select name="roomType" id="roomType" class="form-select">
                      <option value="">-- Select Room Type --</option>
                      <option value="Deluxe Room">Deluxe Room</option>
                      <option value="Single Room">Single Room</option>
                      <option value="Multiple Room">Twin Room</option>
                      <option value="Suite">Suite</option>
                  </select>
              </div>
              <div class="col-auto">
                  <button type="submit" class="btn btn-primary">Search</button>
              </div>
          </form>
      </div>

      <hr><p>🏨 Welcome to InnoStay – where comfort meets convenience.<br>
   ✨ Make the most of your stay with easy access to everything you need.</p>

  </div>
</div>

<!-- FOOTER -->
<footer class="text-center mt-5 mb-3">
    <hr>
    💡 Crafted with <span style="color: #a020f0;">❤</span> and late-night <span style="color:#ffffff;">coding caffeine</span><br>
    👩‍💻 By <strong>Anu</strong> 
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

<!-- Particles JS -->
<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>
<script>
    particlesJS('particles-js', {
        particles: {
            number: { value: 80 },
            color: { value: "#ffffff" },
            shape: {
                type: ["circle", "triangle", "polygon"],
                stroke: { width: 0, color: "#000000" }
            },
            opacity: { value: 0.6, random: true },
            size: { value: 4, random: true },
            move: { enable: true, speed: 2 }
        },
        interactivity: {
            events: {
                onhover: { enable: true, mode: "repulse" },
                onclick: { enable: true, mode: "push" }
            },
            modes: {
                repulse: { distance: 80 },
                push: { particles_nb: 4 }
            }
        },
        retina_detect: true
    });
</script>

</body>
</html>
