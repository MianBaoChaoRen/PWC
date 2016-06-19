<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page import="java.io.*, java.util.*, javax.swing.*, java.sql.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>PWC | User Management</title>
	<meta
		content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
		name='viewport'>
	<!-- bootstrap 3.0.2 -->
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<!-- font Awesome -->
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<!-- Ionicons -->
	<link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
	<!-- bootstrap wysihtml5 - text editor -->
	<link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
		rel="stylesheet" type="text/css" />
	<!-- Theme style -->
	<link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	        <![endif]-->
</head>
<body class="skin-blue">

    <%
    // Check if any USER session
    	if ((session.getAttribute("UserName")==null) || (session.getAttribute("AuditorName")==null)){
    		response.sendRedirect("login.jsp");
    	} else {
    		String UserName = (String)session.getAttribute("UserName");
    		String AuditorName = (String)session.getAttribute("AuditorName");
    		String Admin = (String)session.getAttribute("Admin");

			try {
				// Step1: Load JDBC Driver
				Class.forName("com.mysql.jdbc.Driver");
				// Step 2: Define Connection URL
				String connURL = "jdbc:mysql://localhost/cscensus?user=root&password=root";
				// Step 3: Establish connection to URL
				Connection conn = DriverManager.getConnection(connURL);
				// Step 4: Create Statement object
				Statement stmt = conn.createStatement();
    %>
    
    
	<!-- header logo: style can be found in header.less -->
	<header class="header"> <a href="dashboard.jsp" class="logo">
		<!-- Add the class icon to your logo image or logo icon to add the margining -->
		CSCensus
	</a> 
	<!-- Header Navbar: style can be found in header.less --> 
		<nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span><%=AuditorName %> <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <p>
                                        <%=AuditorName %>
                                        <small>Member since Nov. 2012</small>
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="logout.jsp" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
     	</header>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="left-side sidebar-offcanvas"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left info">
				<p>Hello, <%=AuditorName %></p>
			</div>
		</div>
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li><a href="dashboard.jsp"> <i class="fa fa-dashboard"></i>
					<span>Dashboard</span>
			</a></li>
			<li class="active treeview"><a href="#"> <i
					class="fa fa-archive"></i> <span>Control Panel</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li class="active"><a href="usermanagement.jsp"><i
							class="fa fa-angle-double-right"></i> User Management</a></li>
					<li><a href="industrymanagement.jsp"><i
							class="fa fa-angle-double-right"></i> Industry Management</a></li>
					<li><a href="questionmanagement.jsp"><i
							class="fa fa-angle-double-right"></i> Question Management</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
					<span>Projects</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="pages/UI/general.html"><i
							class="fa fa-angle-double-right"></i> View</a></li>
					<li><a href="pages/UI/icons.html"><i
							class="fa fa-angle-double-right"></i> Create New</a></li>
				</ul></li>
		</ul>
		</section> <!-- /.sidebar --> </aside>

		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side"> <!-- Content Header (Page header) -->
		<section class="content-header">
		<h1>
			User Management <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="index.html"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li><a><i class="fa fa-archive"></i> Control Panel</a></li>
			<li class="active">User Management</li>
		</ol>
		</section> <!-- Main content --> <section class="content"> <!-- top row -->
		<!-- /.row --> 
		
		<!-- Main row -->
		<div class="row">
			<!-- Left col -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">List of Consultant Table</h3>
							</div>
						<!-- /.box-header -->
						<div class="box-body table-responsive no-padding">
							<table class="table table-hover">
								<tr>
									<th>ID</th>
									<th>Consultant Name</th>
									<th>Joined Date</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
								<%
									String UserSql="select * from cscensus.users";
									ResultSet Userrs = stmt.executeQuery(UserSql);
									
									int counter = 1;
									
									while (Userrs.next()){
									%> <tr>
											<td><%=counter%></td>
											<td><%=Userrs.getString("AuditorName") %></td>
											<td>11-7-2014</td>
											<td>
											<%		
												if (Userrs.getInt("admin") == 1){
											%>
												<span class="label label-success">Admin</span>
											<%
												} if (Userrs.getInt("disabled") == 1){
											%>
												<span class="label label-danger">Resigned</span>
											<%		
												} else if (Userrs.getInt("verified") == 1){
											%>
												<span class="label label-primary">Approved</span>
											<%		
												} else if (Userrs.getInt("verified") == 0){
											%>
												<span class="label label-warning">Pending</span>
											<%		
												} 
											%>
											</td>
											
											<td>
											<%	if (Userrs.getInt("disabled") ==1){
												%>
													<form class="form" action="UndisableUser.jsp">
														<input type='hidden' name='undisableuser' value='<%=Userrs.getString("username") %>'/>
														<button class="btn btn-danger btn-sm">Un-Resign</button>
													</form>
												<%
											} else if (Userrs.getInt("verified") == 1){
											%>
												<form class="form" action="DisapproveUser.jsp">
													<input type='hidden' name='Disapproveuser' value='<%=Userrs.getString("username") %>'/>
													<button class="btn btn-warning btn-sm">Disapprove</button>
												</form>
												
													<%
														if (Userrs.getInt("admin") == 0){
															%>
																<form class="form" action="MakeAdmin.jsp">
																	<input type='hidden' name='makeadmin' value='<%=Userrs.getString("username") %>'/>
																	<button class="btn btn-success btn-sm">Make Admin?</button>
																</form>
															<%
														}
														
														if (Userrs.getInt("disabled") ==0){
															%>
																<form class="form" action="DisableUser.jsp">
																	<input type='hidden' name='disableuser' value='<%=Userrs.getString("username") %>'/>	
																	<button class="btn btn-danger btn-sm">Resign</button>
																</form>
															<%		
														}
													%>
													
												
											<%
												} else {
											%>
												<form class="form" action="ApproveUser.jsp">
													<input type='hidden' name='approveuser' value='<%=Userrs.getString("username") %>'/>
													<button class="btn btn-primary btn-sm">Approve</button>
												</form>
										
											<%
												}
											%>
											</td>
										</tr>
								<%	
									counter++;
									}
								%>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
			</div>
			</section>
			<!-- /.Left col -->

		</div>
		<!-- /.row (main row) --> </section><!-- /.content --> </aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.0.2 -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<!-- jQuery UI 1.10.3 -->
	<script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
		type="text/javascript"></script>

	<!-- AdminLTE App -->
	<script src="js/AdminLTE/app.js" type="text/javascript"></script>
        <%
	        	conn.close();
				} catch(Exception e){
				out.println(e);
				} // Try Catch
			
    		}  // FOR USER session Else statement
        %>
</body>
</html>