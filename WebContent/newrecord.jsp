<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>New diagnosis</title>
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
        <% String p_aadharid = (String)request.getAttribute("p_aadharid"); %>        
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
    			<a href="welcome.jsp" class="sidebar-toggler  mr-4 mr-lg-5 lead">
    				<button class="btn btn-primary">Home</button>
    			</a>        
    			<ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
    				<a href="welcome.jsp" class="navbar-brand font-weight-bold text-uppercase text-base">CHMS Dashboard</a>
    				<a href="Logout" > <button class="btn btn-primary">Logout</button></a>
    			</div>
    		</li>
    	</ul>
    </nav>
</header> 


	<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = 
		DriverManager.getConnection
		("jdbc:mysql://localhost/chms?user=pk&password=pk");
		Statement statement = connection.createStatement() ;
		resultset =statement.executeQuery("select * from medicine") ;
		%>
		<div class="page-holder d-flex align-items-center">
			<div class="container">
				<br>
				<h1 align="center">Central Healthcare Management system</h1>
				<div class="row align-items-center py-5">
					<div class="container">
						
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<form class="form-group" action="NewPrescription">
									<div class="diagnosis">
										<label for="diagnosis">Enter the diagnosis of the patient : </label>
										<textarea class="form-control" type="text" name="diagnosis" id="diagnosis"></textarea>                        </div>
										<div id="newPrescription">
											<div class="medicine">
												<label for="medicineList">Select medicines </label>
												<!-- <input class="medicineList" type="text" name="medicine-1" id="medicine-1" /> -->
												<select name="medicineList" id="medicineList" class="medicineList" multiple="multiple">
													<% while(resultset.next()){ %>
													<option><%= resultset.getString(2)%></option>
													<% } %>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3"></div>
											<div class="col-md-6">
												<button class="btn btn-outline-primary" type="button" onclick=" var el = document.getElementsByTagName('select')[0]; dosage(el)">Give the dosage</button></div>
												<div class="col-md-3"></div>
											</div>
											<div class="row">
												<div class="col-md-12"><input class="btn btn-outline-primary" type="submit" value="Create Prescription"></div>
											</div>
										</form>
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="col-md-2"></div>        
						</div>
        <p class="mt-5 mb-0 text-gray-400 text-center">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Bootstrapious</a> & Your company</p>
        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)  -->						
					</div>
				</div>


			<%
		}
		catch(Exception e)
		{
			out.println("wrong entry"+e);
		}
		%>

	</body>
	<script type="text/javascript">
		var count = 2;

		function dosage(select) {
			console.log("Into the function");
			var result = [];
			var options = select && select.options;
			var opt;

			for (var i = 0, iLen = options.length; i < iLen; i++) {
				opt = options[i];

				if (opt.selected) {
					result.push(opt.value || opt.text);
				}
			}
			for (var i = 0; i < result.length; i++) {
				console.log(result[i]);
			}

			var parentDiv = document.getElementById("newPrescription");


			for (var i = 0; i < result.length; i++) {
				var newDosageLabel = document.createElement("label");
				newDosageLabel.setAttribute("for", result[i]);
				newDosageLabel.textContent = "  Dosage for " + result[i] + " : ";

				var newDosage = document.createElement('input');
				newDosage.setAttribute("type", "text");
				newDosage.className = "dosageList";
				newDosage.setAttribute("name", result[i]);
				newDosage.id = "dosage" + result[i];
				parentDiv.appendChild(newDosageLabel);
				parentDiv.appendChild(newDosage);
			}
		}
	</script>
	</html>