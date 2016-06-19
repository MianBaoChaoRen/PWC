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
	String disableIndustry = request.getParameter("disableIndustry");	

	String disableIndustrysuccess = "industrymanagement.jsp";
	
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/cscensus?user=root&password=root";
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			
			String disableIndustrySql = "UPDATE cscensus.industries set disabled=1 where IndustryID=?";
			
			PreparedStatement disableIndustrystmt = conn.prepareStatement(disableIndustrySql);
			disableIndustrystmt.setString(1, disableIndustry);
			
			int disableIndustryRec = disableIndustrystmt.executeUpdate();
			
			if (disableIndustryRec == 1){
				response.sendRedirect(disableIndustrysuccess);
			}
			conn.close();
		} catch (Exception e) {

			out.println(e);

		}
	%>
</body>
</html>