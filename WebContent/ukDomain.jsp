<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page import="java.io.*, java.util.*, javax.swing.*, java.sql.*" %> 
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>PWC | Question Management</title>
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
	//Check if any USER session
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
	</a> <!-- Header Navbar: style can be found in header.less --> <nav
		class="navbar navbar-static-top" role="navigation"> <!-- Sidebar toggle button-->
	<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
		role="button"> <span class="sr-only">Toggle navigation</span> <span
		class="icon-bar"></span> <span class="icon-bar"></span> <span
		class="icon-bar"></span>
	</a>
	<div class="navbar-right">
		<ul class="nav navbar-nav">
			<li class="dropdown user user-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <i
					class="glyphicon glyphicon-user"></i> <span>
						<%=AuditorName %> 
						<i class="caret"></i></span>
			</a>
				<ul class="dropdown-menu">
					<!-- User image -->
					<li class="user-header bg-light-blue">
						<p>
							<%=AuditorName %>
							<small>Member since Nov. 2012</small>
						</p></li>
					<!-- Menu Footer-->
					<li class="user-footer">
						<div class="pull-left">
							<a href="#" class="btn btn-default btn-flat">Profile</a>
						</div>
						<div class="pull-right">
							<a href="logout.jsp" class="btn btn-default btn-flat">Sign out</a>
						</div>
					</li>
				</ul></li>
		</ul>
	</div>
	</nav> </header>
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
					<li><a href="usermanagement.jsp"><i
							class="fa fa-angle-double-right"></i> User Management</a></li>
					<li><a href="industrymanagement.jsp"><i
							class="fa fa-angle-double-right"></i> Industry Management</a></li>
					<li class="active"><a href="questionmanagement.jsp"><i
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
			Question Management <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="index.html"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li><a><i class="fa fa-archive"></i> Control Panel</a></li>
			<li class="active">Question Management</li>
		</ol>
		</section> <!-- Main content --> <section class="content"> <!-- top row -->
		<!-- /.row --> 
		
		<!-- Main row -->
		<div class="row">
			<!-- Left col -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<tr>
	                		<td>
	                        	<div class="btn-group">
	                        		<form class="form" action="questionmanagement.jsp">
	                            			<button class="btn btn-info">Both</button>
	                            	</form>
	                            	
	                            	<form class="form" action="ukDomain.jsp">
	                            		<button class="btn btn-info">UK Domain</button>
	                            	</form>
	                            	
	                            	<form class="form" action="usDomain.jsp">
	                             		<button class="btn btn-info">US Domain</button>
	                             	</form>
	                    		</div>
	                    	</td>
	                   	</tr>
	           		</div>
	         	</div>
	                   	
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title"> UK Questions Table</h3>
							</div>
							
							<div class="col-md-6">
                            <!-- Custom Tabs -->
                            <div class="nav-tabs-custom">
                            	<ul class="nav nav-tabs">
	                            	<%
	                            		// SQL statement for UKDomains Section
										String ukDomainSql="select * from cscensus.ukdomains";
										ResultSet ukDomainrs = stmt.executeQuery(ukDomainSql);
										
										int counter = 1;
										
										while (ukDomainrs.next()){
											
											
											if (counter == 1){
												%>
				                            		<li class="active"><a href="#tab_<%=ukDomainrs.getString("UKDomID") %>" data-toggle="tab"><%=ukDomainrs.getString("UKDomainName") %></a></li>
			                            		<%
											} else {
												%>
		                                   	 	<li><a href="#tab_<%=ukDomainrs.getString("UKDomID") %>" data-toggle="tab"><%=ukDomainrs.getString("UKDomainName") %></a></li>
			                            		<%
											}
											
											counter++;
											
											String UKDOMID = ukDomainrs.getString("UKDomID");
											
											// SQL Satement for UKDomain QUESTIONS
											String ukDomainQuestionSql="select * from cscensus.questions where UKDomID = UKDOMID ";
											ResultSet ukDomainQuestionrs = stmt.executeQuery(ukDomainQuestionSql);
													
											while (ukDomainQuestionrs.next()){
												
											}
											
										}
									%>
								</ul>
								
								
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1">
                                        <b>How to use:</b>
                                        <p>Exactly like the original bootstrap tabs except you should use
                                            the custom wrapper <code>.nav-tabs-custom</code> to achieve this style.</p>
                                        A wonderful serenity has taken possession of my entire soul,
                                        like these sweet mornings of spring which I enjoy with my whole heart.
                                        I am alone, and feel the charm of existence in this spot,
                                        which was created for the bliss of souls like mine. I am so happy,
                                        my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
                                        that I neglect my talents. I should be incapable of drawing a single stroke
                                        at the present moment; and yet I feel that I never was a greater artist than now.
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2">
                                        The European languages are members of the same family. Their separate existence is a myth.
                                        For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ
                                        in their grammar, their pronunciation and their most common words. Everyone realizes why a
                                        new common language would be desirable: one could refuse to pay expensive translators. To
                                        achieve this, it would be necessary to have uniform grammar, pronunciation and more common
                                        words. If several languages coalesce, the grammar of the resulting language is more simple
                                        and regular than that of the individual languages.
                                    </div><!-- /.tab-pane -->
                                </div><!-- /.tab-content -->
	                       	</div><!-- nav-tabs-custom -->
	                        </div><!-- /.col -->
                        
                        
						<!-- /.box-header -->
						<div class="box-body table-responsive no-padding">
							<table class="table table-hover">
								<tr>
									<th>ID</th>
									<th>Question</th>
									<th>Immature description </th>
									<th>Mature description</th>
									<th>Actions </th>
								</tr>
								
								
								<%
									String questionSql="select * from cscensus.questions where Disabled = 0";
									ResultSet questionrs = stmt.executeQuery(questionSql);
									
									while (questionrs.next()){
									%>
										<tr>
											<td><%=questionrs.getString("QuestionID") %></td>
											<td><%=questionrs.getString("Question") %></td>
											<td>
												<% if (questionrs.getString("ImmatureDesc") == null){
													%>
														-
													<%
												} else {
													questionrs.getString("ImmatureDesc");
												}
												%>
											</td>
											<td>
												<% if (questionrs.getString("MatureDesc") == null){
													%>
														-
													<%
												} else {
													questionrs.getString("MatureDesc");
												}
												%>
											</td>
										</tr>
									<%
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