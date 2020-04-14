<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Authenticate token</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">
	<!-- Bootstrap CSS-->
	<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome CSS-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<!-- Google fonts - Popppins for copy-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
	<!-- orion icons-->
	<link rel="stylesheet" href="css/orionicons.css">
	<!-- theme stylesheet-->
	<link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
	<!-- Custom stylesheet - for your changes-->
	<link rel="stylesheet" href="css/custom.css">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/favicon.png?3">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
    	<%
    	if(session.getAttribute("uname")==null){
    	response.sendRedirect("index.jsp");
    }
    else{
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
    }
    %>	
	<!-- navbar-->
	<header class="header">
		<nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">
			<a href="welcomeadmin.jsp" class="sidebar-toggler  mr-4 mr-lg-5 lead">
				<button class="btn btn-primary">Home</button>
			</a>
			
			<ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
				<a href="welcomeadmin.jsp" class="navbar-brand font-weight-bold text-uppercase text-base">CHMS Dashboard</a>
				<a href="Logout" > <button class="btn btn-primary">Logout</button></a>
			</div>
		</li>
	</ul>
</nav>
</header>      

<div class="page-holder d-flex align-items-center">
	<div class="container">
		<h1 align="center">Central Healthcare Management system</h1>
		<div class="row align-items-center py-5">
			<!-- Basic Form-->
			<div class="col-lg-6 row-lg-6 mx-auto mb-12">
				<div class="card">
					<div class="card-header">
						<h3 class="h6 text-uppercase mb-0">Generate Authentication token for Doctor</h3>
					</div>
					<div class="card-body">
						<form method="post" action="AddDoctorAdminServlet">
							<div class="form-group">
								<label class=" text-uppercase">Doctor's Registration ID</label>
								<input name="doctor_id" placeholder="Doctor's ID" class="form-control">
							</div>
							<div class="form-group">       
								<label class=" text-uppercase">Token</label>
								<input type ="password" name="new_key" placeholder="Authentication token" class="form-control">
							</div>
							<div class="form-group">       
								<button type="submit" class="btn btn-primary">Generate</button>
							</div>          
						</form>
					</div>
				</div>	
				        <p class="mt-5 mb-0 text-gray-400 text-center">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Bootstrapious</a> & Your company</p>
        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)  -->	
			</div>
		</div>
	</body>
	</html>