<%@ page import="com.net.bean.UserBean" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style> body {
            background: linear-gradient(135deg, #f8f6ff, #e0d4f7);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background-color: white;
            border-bottom: 2px solid #c9b6e4;
            padding: 0.8rem 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .brand-heart {
            font-size: 1.8rem;
            font-weight: bold;
            color: #8e44ad;
            animation: beat 1s infinite;
        }
        @keyframes beat {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }
        .nav-links a {
            margin-left: 15px;
            color: #6c3483;
            text-decoration: none;
            font-weight: 500;
        }
        .nav-links a:hover {
            color: #bb8fce;
        }
        .card {
            margin-top: 2rem;
            border-radius: 15px;
            box-shadow: 0 0 12px rgba(155, 89, 182, 0.3);
        }
        .card-header {
            background-color: #dcd6f7;
            font-weight: bold;
            color: #512e5f;
        }
        .btn-edit {
            margin-top: 1rem;
            display: inline-block;
        }
     </style>
</head>
<body>
<div class="navbar">
    <div class="brand-heart">InnoStay 💜</div>
    <div class="nav-links">
        <a href="UserDashBoard.jsp">Home</a>
        <a href="about.jsp">About</a>
                <a href="../ContactUs.jsp">Contact</a>
        <a href="../help.jsp">Help</a>
        <a href="../Logout.jsp">Logout</a>
    </div>
</div>
<%@ page import="com.net.DAO.UserDAO" %>
<%@ page import="com.net.bean.UserBean" %>
<%
    String uname = (String) session.getAttribute("uname");
    if (uname == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    UserBean user = UserDAO.getUserByUsername(uname);
%>

<div class="container mt-5">
    <h2>Update Your Profile</h2>
    <form action="updateaction.jsp" method="post">
        <input type="hidden" name="uid" value="<%= user.getUid() %>">
        
        <div class="mb-3">
            <label>Name</label>
            <input type="text" name="name" value="<%= user.getName() %>" class="form-control">
        </div>
        <div class="mb-3">
            <label>Username</label>
            <input type="text" name="username" value="<%= user.getUsername() %>" class="form-control">
        </div>
        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" class="form-control">
        </div>
        <div class="mb-3">
            <label>Phone</label>
            <input type="text" name="phone" value="<%= user.getPhone() %>" class="form-control">
        </div>
        <div class="mb-3">
            <label>Gender</label>
            <select name="gender" class="form-control">
                <option <%= user.getGender().equals("Male") ? "selected" : "" %>>Male</option>
                <option <%= user.getGender().equals("Female") ? "selected" : "" %>>Female</option>
            </select>
        </div>
        <div class="mb-3">
            <label>Age</label>
            <input type="number" name="age" value="<%= user.getAge() %>" class="form-control">
        </div>
        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="password" value="<%= user.getPassword() %>" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>
</body>
</html> 