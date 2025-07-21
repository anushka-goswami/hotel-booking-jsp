<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.net.DAO.UserDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log page</title>
</head>
<body>

<jsp:useBean id="obj" class="com.net.bean.UserBean">
</jsp:useBean>
<jsp:setProperty property="*" name="obj"/>

<% 
out.print("log page");
out.print("<hr>User Name - " + request.getParameter("username"));
out.print("<hr>Password - " + request.getParameter("password"));


int logStatus = UserDAO.Login(obj);
out.print("<br> ");
if(logStatus > 0){
//	out.print("Login Success.. " +  logStatus);
   
session.setAttribute("uname", obj.getUsername());
   
	out.print("<script> alert('Login Success...'); window.open('UserDash/UserDashBoard.jsp','_self'); </script>");

}
else{
	//out.print("Login Failed.. " + logStatus);
	out.print("<script> alert('Login Failed...'); window.open('Login.jsp','_self'); </script>");
}
%>
</body>
</html>