<%@ page import="com.net.bean.UserBean" %>
<%@ page import="com.net.DAO.UserDAO" %>
<%@ page session="true" %>
<%
    int uid = Integer.parseInt(request.getParameter("uid"));
    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String gender = request.getParameter("gender");
    int age = Integer.parseInt(request.getParameter("age"));
    String password = request.getParameter("password");

    UserBean ub = new UserBean();
    ub.setUid(uid);
    ub.setName(name);
    ub.setUsername(username);
    ub.setEmail(email);
    ub.setPhone(phone);
    ub.setGender(gender);
    ub.setAge(age);
    ub.setPassword(password);

    int status = UserDAO.UpdateUser(ub);

    if (status > 0) {
        session.setAttribute("user", ub); // update session
        out.println("<script>alert('Profile Updated Successfully'); location='../Login.jsp';</script>");
    } else {
        out.println("<script>alert('Update Failed'); history.back();</script>");
    }
%>
