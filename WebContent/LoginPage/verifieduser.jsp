<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%page import="java.sql.*">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
try{
Class.forName("com.mysql.jdbc.Driver")
String connURL ="jdbc:mysql://localhost/fyp?user=root&password=root"
Connection conn = DriverManager.getConnection(connURL)

Statement stmt=conn.createStatement();

String username =request.getParameter("username");
String password =request.getParameter("password");

String sqlStr ="Select * From login where username'" + username + "' and password='" + password + "'";

if (rs.next() )
	response.sendRedirect("dashboard.jsp");
} else {
	response.sendRedirect("index.jsp");
}

</body>
</html>