<%@ page import="com.net.DAO.RoomDAO, com.net.bean.Room" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String roomIdParam = request.getParameter("roomId");
    Room room = null;
    int roomId = 0;

    if (roomIdParam != null) {
        try {
            roomId = Integer.parseInt(roomIdParam);
            room = new RoomDAO().getRoomById(roomId);
        } catch (Exception e) {
            out.println("<p style='color:red;'>Invalid room ID.</p>");
            return;
        }
    } else {
        out.println("<p style='color:red;'>Room ID is missing in the request.</p>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Room</title>

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
            min-height: 100vh;
            position: relative;
            z-index: 1;
        }

        #particles-js {
            position: fixed;
            top: 0;
            left: 0;
            z-index: -1;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, #6a11cb, #2575fc);
        }

        .booking-box {
            background-color: #fff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
            transition: all 0.3s ease;
        }

        .booking-box:hover {
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .form-label {
            font-weight: 600;
            color: #333;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 10px 15px;
            border-color: #6a11cb;
        }

        .btn-success {
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            font-size: 16px;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            border: none;
        }

        .btn-success:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(106, 17, 203, 0.3);
        }

        .room-img {
            max-height: 250px;
            object-fit: cover;
            border-radius: 12px;
        }

        h3 {
            font-weight: 700;
            color: #2c3e50;
        }

        .card-info p {
            margin-bottom: 6px;
        }
    </style>
</head>
<body>

<!-- Animated background layer -->
<div id="particles-js"></div>

<!-- Booking Container -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10 booking-box">
            <h3 class="mb-4 text-center animate__animated animate__fadeInDown">Book Room: <%= room.getTitle() %></h3>

            <div class="row g-4 mb-4">
                <!-- Room Image -->
                <div class="col-md-6">
                    <img src='<%= room.getImageUrl() %>' class="img-fluid room-img" alt="Room Image">
                </div>

                <!-- Room Info -->
                <div class="col-md-6 card-info">
                    <p><strong>Room ID:</strong> <%= room.getId() %></p>
                    <p><strong>Description:</strong> <%= room.getDescription() %></p>
                    <p><strong>Price:</strong> ₹<%= room.getPrice() %></p>
                    <p><strong>Type:</strong> <%= room.getType() %></p>
                </div>
            </div>

            <!-- Booking Form -->
            <form action="bookRoom.jsp" method="post">
                <input type="hidden" name="roomId" value="<%= room.getId() %>">

                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="checkin" class="form-label">Check-in Date</label>
                        <input type="date" name="checkin" id="checkin" class="form-control" required>
                    </div>

                    <div class="col-md-6">
                        <label for="checkout" class="form-label">Check-out Date</label>
                        <input type="date" name="checkout" id="checkout" class="form-control" required>
                    </div>

                    <div class="col-md-6">
                        <label for="adults" class="form-label">Number of Adults</label>
                        <input type="number" name="adults" id="adults" class="form-control" min="1" required>
                    </div>

                    <div class="col-md-6">
                        <label for="children" class="form-label">Number of Children</label>
                        <input type="number" name="children" id="children" class="form-control" min="0" required>
                    </div>

                    <div class="col-md-12">
                        <label for="payment" class="form-label">Payment Method</label>
                        <select name="payment" id="payment" class="form-select" required>
                            <option value="" disabled selected>Select Payment Method</option>
                            <option value="UPI">UPI</option>
                            <option value="Card">Card</option>
                            <option value="Netbanking">Net Banking</option>
                             <option value="other">Other</option>
                        </select>
                    </div>
                </div>

                <div class="mt-4">
                    <button type="submit" class="btn btn-success w-100">Confirm & Pay</button>
                </div>
            </form>
        </div>
    </div>
</div>

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

    document.querySelector('form').addEventListener('submit', function(e) {
        const checkin = new Date(document.getElementById('checkin').value);
        const checkout = new Date(document.getElementById('checkout').value);
        const adults = parseInt(document.getElementById('adults').value, 10);
        const children = parseInt(document.getElementById('children').value, 10);

        const minDate = new Date('2025-01-01');
        const maxDate = new Date('2026-12-31');

        let errorMsg = '';

        // Validate check-in date
        if (checkin < minDate) {
            errorMsg += 'Check-in date must be after 2015.\n';
        }

        // Validate checkout date
        if (checkout <= checkin) {
            errorMsg += 'Check-out date must be after check-in date.\n';
        }

        if (checkout > maxDate) {
            errorMsg += 'Check-out date must not be beyond the year 2106.\n';
        }

        // Adults and children limit
        if (adults > 2) {
            errorMsg += 'Maximum of 2 adults allowed.\n';
        }

        if (children > 2) {
            errorMsg += 'Maximum of 2 children allowed.\n';
        }

        // If there's an error, stop form submission
        if (errorMsg) {
            alert(errorMsg);
            e.preventDefault();
        }
    });


</script>

</body>
</html>
