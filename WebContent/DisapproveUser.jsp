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
	String Disapproveuser = request.getParameter("Disapproveuser");	

	String Disapprovesuccess = "usermanagement.jsp";
	
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/cscensus?user=root&password=root";
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			
			String DisapproveuserSql = "UPDATE cscensus.users set admin=0,verified=0 where username=?";
			
			PreparedStatement Disapproveuserstmt = conn.prepareStatement(DisapproveuserSql);
			Disapproveuserstmt.setString(1, Disapproveuser);
			
			int DisapproveuserRec = Disapproveuserstmt.executeUpdate();
			
			if (DisapproveuserRec == 1){
				response.sendRedirect(Disapprovesuccess);
			}
			conn.close();
		} catch (Exception e) {

			out.println(e);

		}
	%>
</body>
</html>