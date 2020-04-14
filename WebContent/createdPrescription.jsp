<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="com.CHMS.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.sql.*"%>

<%
HttpSession ses = request.getSession();
String getInfo = "select * from view1 where treatmentID = ?";
String url = "jdbc:mysql://localhost:3306/chms";
String username = "pk";
String password = "pk";
int treatID = (Integer)ses.getAttribute("treatmentID");
String docName = null;
String patientName= null;
int age = 0;
String gender = null;
String city = null;
try 
{ 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url,username, password);
	PreparedStatement ps = con.prepareStatement(getInfo);
	ps.setInt(1,treatID);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
    //PrescriptionData pd=new PrescriptionData(rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6));     
}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Prescription</title>
	<style>
		@media print {
			@page { margin: 0cm; }
			body { margin: 1.6cm; }
		}
	</style>  
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
      <%  //HttpSession ses = request.getSession();
      String[] med = (String[])request.getAttribute("medicines");
      String[] dosage = (String[])request.getAttribute("dosages");
      int count = 1;
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

<div class="row">
	<div class="col-sm-3"></div>
	<div class="col-sm-6">
		<div class="card" style="margin-top: 30px; padding:10px;">
			<h3 class="card-title" style="text-align: center;padding: 10px;">Central Healthcare Management
			System</h3>
			<div class="card-header">
				<h3 style="text-align: center; padding-bottom: 20px;">Prescription</h3 >
				<div class="row">
					<div class="col-md-4">
						Doctor name : <%= rs.getString(2)%> <br>
						Degree : <%= rs.getString(3)%> 
						<!-- add prescription here -->
						<br>
						Address : <%= rs.getString(8)%>  <br>
					</div>
					<div class="col-sm-3"></div>
					<div class="col-md-5">
						Patient Name : <%= rs.getString(4)%> <br> 
						Age : <%= rs.getInt(6)%> <br>
						Gender : <%= rs.getString(7)%> <br>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5>Medicines:</h5>
				<table class="table" style="text-align: center;">
					<th>Sr. No.</th>
					<th>Medicine name</th>
					<th>Dosage</th>
					<%
					for(int i = 0 ; i<med.length ; i++) { %>
					<tr>
						<td><%= Integer.toString(count) %></td>
						<td><%= (String)med[i] %></td>
						<td><%= (String)dosage[i] %></td>
					</tr>
					<%
					count++;
				} %>
			</table>
		</div>
		<div class="card-footer">
			<div class="row" style="padding-top: 40px;">
				<div class="col-md-8"></div>
				<div class="col-md-4">Signature of Doctor <br></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<a href="#" onClick="window.print()"><button type="button" class="btn btn-primary">Print</button></a>        
	<a href="fetchdetails.jsp">
		<button type="button" class="btn btn-primary"">Search a new patient</button></a>
	</div>
        <p class="mt-5 mb-0 text-gray-400 text-center">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Bootstrapious</a> & Your company</p>
        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)  -->	
</div>
</div>
</body>
<%
}
catch(Exception E){

}%>
</html>
