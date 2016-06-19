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

		String loginsuccess = "dashboard.jsp";
		String loginfail = "login.jsp";
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
			
			// Statement to Verify Normal (Non-Admin) Users
			String VerifiedUserSql = "SELECT * FROM cscensus.users where username=? and password =? and verified = 1 and disabled = 0 ";
			PreparedStatement VerifiedUserpstmt = conn.prepareStatement(VerifiedUserSql);
			VerifiedUserpstmt.setString(1, id);
			VerifiedUserpstmt.setString(2, password);
			ResultSet VerifiedUserrs = VerifiedUserpstmt.executeQuery();
			
			// Statement to Verify Admin Users
			String VerifiedAdminSql = "SELECT * FROM cscensus.users where username=? and password =? and verified = 1 and disabled = 0 and admin = 1";
			PreparedStatement VerifiedAdminSqlpstmt = conn.prepareStatement(VerifiedAdminSql);
			VerifiedAdminSqlpstmt.setString(1, id);
			VerifiedAdminSqlpstmt.setString(2, password);
			ResultSet VerifiedAdminrs = VerifiedAdminSqlpstmt.executeQuery();
			
			// Statement to Verify Resigned (Disabled) Users
			String VerifiedResignedSql = "SELECT * FROM cscensus.users where username=? and password =? and disabled = 1";
			PreparedStatement VerifiedResignedpstmt = conn.prepareStatement(VerifiedResignedSql);
			VerifiedResignedpstmt.setString(1, id);
			VerifiedResignedpstmt.setString(2, password);
			ResultSet VerifiedResignedrs = VerifiedResignedpstmt.executeQuery();
			
			if (VerifiedAdminrs.next()){
				String UserName = VerifiedAdminrs.getString("username");
				String AuditorName = VerifiedAdminrs.getString("AuditorName");
				String Admin = VerifiedAdminrs.getString("admin");
				
				session.setAttribute("UserName", UserName);
				session.setAttribute("AuditorName", AuditorName);
				session.setAttribute("Admin", Admin);
				
				response.sendRedirect(loginsuccess);
			}else if (VerifiedUserrs.next()) {
				String UserName = VerifiedUserrs.getString("username");
				String AuditorName = VerifiedUserrs.getString("AuditorName");
				
				session.setAttribute("UserName", UserName);
				session.setAttribute("AuditorName", AuditorName);
				session.setAttribute("Admin", "0");
				
				response.sendRedirect(loginsuccess);
			
			}else if (VerifiedResignedrs.next()) {
				String UserName = VerifiedResignedrs.getString("username");
				String AuditorName = VerifiedResignedrs.getString("AuditorName");
				String Resigned = VerifiedResignedrs.getString("disabled");
				
				session.setAttribute("UserName", UserName);
				session.setAttribute("AuditorName", AuditorName);
				
				response.sendRedirect(loginfail);
			
			}else{
				response.sendRedirect(loginfail);
			}
			
			
			conn.close();
		} catch (Exception e) {

			out.println(e);

		}
	%>

</body>
</html>