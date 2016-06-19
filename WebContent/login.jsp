<!DOCTYPE html>
<html>
<head>

<script src='js/jquery.min.js'></script>
<script src="js/loginindex.js"></script>


<meta charset="UTF-8">
<title>Pricewaterhouse Coopers | Login Page</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=yes">


<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Open+Sans'>

<link rel="stylesheet" href="css/Loginstyle.css">
</head>
<body>
<% 
// This part of code is for Registering Users.
	if ((session.getAttribute("fullname")!=null)){
		String fullname = (String)session.getAttribute("fullname");
	%> 
		<script> alert("Please look for your Administrator for Approval of account."); </script>
	<%
		session.invalidate();
	}
%>
		
<!--  LOCAL Val  -->
<script>

function chkForm(){
	var UsernameField=document.getElementById("username");
	var Username=UsernameField.value;
	
	var passwordField=document.getElementById("password");
	var password=passwordField.value;
	
	var Usernameval = /^([a-zA-Z0-9]{3,})+([@]{1,1})+[a-zA-Z_]+\.[a-zA-Z]{3,}$/;
	var validUsername = UsernameField.value.match(Usernameval);
	
	var passwordval = /^[a-zA-Z0-9]{8,}$/;
	var validpassword = passwordField.value.match(passwordval);

	var error=false;
	
	if (Username == "admin" && password =="admin"){
		error=false;
		break;
	}else if (Username == "" && password ==""){
		alert("Please enter your Username and Password");
		error=true;
	}else if(Username == ""){
		alert("Please enter your Username");
		error=true;
	}else if (password==""){
		alert("Please enter your Password");
		error=true;
	}else if (validUsername == null) {
		alert("Please enter a Valid Username");
		error=true;
	}else if (validpassword == null){
		alert("Please enter a Valid Password");
		error=true;
	}
	
	if (error){
		window.location = "login.jsp";
		return false;
	} else {
		return true;
	}
}

</script>

<!--  END OF LOCAL Val -->			
    	

	<div class="LoginBody">
		<div class="logininput">

			<!-- Login form -->
			<div class="login">

				<!--  Login Logo -->
				<div class="login__check">
					<IMG SRC="img/pwc.png">
				</div>
				<!--  End Login Logo -->
				<div class="login__form">
					<form action="verify.jsp" method="post">
						<div class="login__row">
							<svg class="login__icon name svg-icon" viewBox="0 0 20 20">
            				<path
									d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
          				</svg>

							<input type="text" class="login__input name"
								placeholder="Username" name="username" id="username" />
						</div>
						<div class="login__row">
							<svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
				  			<path
									d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
				       	</svg>
							<input type="password" class="login__input pass"
								placeholder="Password" name="password" id="password" />
						</div>
						<button type="submit" class="login__submit" name="btnSubmit" onclick="return chkForm()">Sign in</button>
					</form>
					<form action="newuser.jsp" method="post">
						<button type="submit" class="login__submit" name="btnSubmit">Register</button>
					</form>
				</div>
				<!--  End of Login Form -->
			</div>
		</div>

	</div>

</body>
</html>