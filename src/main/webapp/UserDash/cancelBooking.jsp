<%@ page import="com.net.DAO.BookingDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    try {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        int roomId = Integer.parseInt(request.getParameter("roomId"));

        boolean success = BookingDAO.cancelBooking(bookingId, roomId);

        if (success) {
%>
    <script>
        alert("Booking cancelled successfully.");
        window.location.href = "UserProfile.jsp";
    </script>
<%
        } else {
%>
    <script>
        alert("Failed to cancel booking.");
        window.history.back();
    </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
    <script>
        alert("Something went wrong.");
        window.history.back();
    </script>
<%
    }
%>
