<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.net.DAO.UserDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reg page</title>
</head>
<body>

<jsp:useBean id="obj" class="com.net.bean.UserBean">
</jsp:useBean>
<jsp:setProperty property="*" name="obj"/>

<% 
out.print("Reg page");
out.print("<hr>User Name - " + request.getParameter("username"));
out.print("<hr>Password - " + request.getParameter("password"));

int regStatus = UserDAO.Register(obj);
out.print("<br> ");
if(regStatus > 0)
{	
//	out.print("Registration Success.. " +  regStatus);
out.print("<script> alert('Registration Success...'); window.open('Login.jsp','_self'); </script>");
}
else
{
//	out.print("Registration Failed.. " + regStatus);
	out.print("<script> alert('Registration Failed...'); window.open('Registration.jsp','_self'); </script>");
}


%>
</body>
</html>