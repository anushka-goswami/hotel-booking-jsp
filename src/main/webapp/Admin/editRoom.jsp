<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.net.DAO.RoomEditAdminDAO" %>
<%@ page import="com.net.bean.RoomEditAdminBean" %>

<%
    int roomId = Integer.parseInt(request.getParameter("roomId"));
    RoomEditAdminBean room = RoomEditAdminDAO.getRoomById(roomId);

    if ("true".equals(request.getParameter("updateRoom"))) {
        room.setTitle(request.getParameter("title"));
        room.setDescription(request.getParameter("description"));
        room.setType(request.getParameter("type"));
        room.setPrice(Double.parseDouble(request.getParameter("price")));
        room.setImageUrl("../images/rooms/" + request.getParameter("imageUrl"));
        RoomEditAdminDAO.updateRoom(room);
        response.sendRedirect("viewrooms.jsp");
        return;
    }

    String imageName = "default.jpg";
    if (room.getImageUrl() != null && room.getImageUrl().contains("/")) {
        imageName = room.getImageUrl().substring(room.getImageUrl().lastIndexOf("/") + 1);
    } else if (room.getImageUrl() != null) {
        imageName = room.getImageUrl();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #512da8, #9575cd);
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .form-container {
            background-color: #2c2c4d;
            padding: 30px;
            border-radius: 12px;
            max-width: 600px;
            margin: 60px auto;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.3);
        }
        .form-control, select {
            background-color: #3e3e5e;
            color: white;
            border: 1px solid #9575cd;
        }
        .form-control::placeholder {
            color: #ccc;
        }
        .btn-success {
            background-color: #7e57c2;
            border: none;
        }
        .btn-success:hover {
            background-color: #5e35b1;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2 class="text-center mb-4">Edit Room</h2>
    <form method="post">
        <input type="hidden" name="roomId" value="<%= room.getId() %>">
        <input type="text" name="title" value="<%= room.getTitle() %>" placeholder="Room Title" class="form-control mb-3" required>
        <textarea name="description" placeholder="Description" class="form-control mb-3" required><%= room.getDescription() %></textarea>

        <select name="type" class="form-control mb-3" required>
            <option value="Single Room" <%= room.getType().equals("Single Room") ? "selected" : "" %>>Single Room</option>
            <option value="Twin Bedroom" <%= room.getType().equals("Twin Bedroom") ? "selected" : "" %>>Twin Bedroom</option>
            <option value="Deluxe Room" <%= room.getType().equals("Deluxe Room") ? "selected" : "" %>>Deluxe Room</option>
            <option value="Suite" <%= room.getType().equals("Suite") ? "selected" : "" %>>Suite</option>
        </select>

        <input type="number" name="price" value="<%= room.getPrice() %>" placeholder="Price" step="0.01" class="form-control mb-3" required>
        <input type="text" name="imageUrl" value="<%= imageName %>" placeholder="Image name (e.g. suite1.jpg)" class="form-control mb-3" required>

        <button type="submit" name="updateRoom" value="true" class="btn btn-success w-100">Update Room</button>
    </form>
</div>

</body>
</html>
