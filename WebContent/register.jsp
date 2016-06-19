<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.io.*, java.util.*, javax.swing.*, java.sql.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

	<%
		String id = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("auditorname");
		
		String registersuccess = "login.jsp";
	%>

	<%
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/cscensus?user=root&password=root";
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();
			// Step 5: Execute SQL Command
			
			// Insert into Users Table
			String RegisterUserSql = "Insert into cscensus.users (username, password, AuditorName, admin, verified, disabled) values (?,?,?, 0, 0,0)";
			PreparedStatement RegisterUserpstmt = conn.prepareStatement(RegisterUserSql);
			RegisterUserpstmt.setString(1, id);
			RegisterUserpstmt.setString(2, password);
			RegisterUserpstmt.setString(3, fullname);
			
			int RegisterUserrec = RegisterUserpstmt.executeUpdate();
			
			if (RegisterUserrec ==1){
				session.setAttribute("fullname", fullname);
				response.sendRedirect(registersuccess);
			} 
			
			conn.close();
		} catch (Exception e) {

			out.println(e);

		}
	%>

</body>
</html>