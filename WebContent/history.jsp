<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="com.CHMS.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.sql.*"%>

<%
HttpSession ses = request.getSession();
String getInfo = "select * from person where aadhar = ?";
String z="select floor(DATEDIFF(sysdate(),?) / 365.25) as age from person";
String url = "jdbc:mysql://localhost:3306/chms";
String username = "root";
String password = "root";

String aadharid = (String)ses.getAttribute("aadharid");
try 
{	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url,username, password);
	PreparedStatement ps = con.prepareStatement(getInfo);
	ps.setString(1,aadharid);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
			//PrescriptionData pd=new PrescriptionData(rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6));			
		}
		
		PreparedStatement ds = con.prepareStatement(z);
		Date abc=rs.getDate(8);
		System.out.println(abc);
		ds.setDate(1,abc);
		ResultSet r = ds.executeQuery();
		if(r.next())
		{
			
		}		
		%>

		<!DOCTYPE html>
		<html>
		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<title>Patient history</title>
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
<div class="page-holder d-flex align-items-center">
	<div class="container">
		<br>
		<div class="  card">                  
			<div class="card-header">
				<h3 style="text-align: center; padding-bottom: 20px;">Patient Medical History</h3 >
				<div class="row">
					<div class="col-md-4">
						Patient name : <%= rs.getString(2)%>  <%= rs.getString(4)%>  <br>
						<!-- add prescription here -->
						<br>
						City : <%= rs.getString(5)%> <br>
					</div>
					<div class="col-sm-3"></div>
					<div class="col-md-4">                                    
						Age : <%= r.getInt(1)%> <br><br>
						Gender : <%= rs.getString(7)%> <br>
					</div>
				</div>
				<br><br>
				<a href="newrecord.jsp"><button class="btn btn-primary">Add new diagnosis</button></a>
			</div>
			<div class="card-body">         
				<table class="table table-striped table-hover card-text">
					<thead>
						<tr>                 
							<th scope="col">Date</th>
							<th scope="col">Doctor ID</th>
							<th scope="col">Diagnosis</th>    
							<c:forEach var="tempT" items="${T_LIST}">
							<tr>
								<td>${tempT.date_of_treatment }</td>
								<td>${tempT.doc_reg_id }</td>
								
								<td>${tempT.diagnosis }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>    		
			</table>    		
		</div>
		        <p class="mt-5 mb-0 text-gray-400 text-center">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Bootstrapious</a> & Your company</p>
        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)  -->
		<br>
	</body>
	<%
}
catch(Exception E){

}%>
</html>