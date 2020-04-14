<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="com.CHMS.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.sql.*"%>

<%
HttpSession ses = request.getSession();

String s = " select count(*) from treatment";
String s1 = " select count(*) as cold from treatment where diagnosis like '%cold%'";
String s2 = " select count(*) as heart from treatment where diagnosis like '%heart%'";
String s3= " select count(*) as diabetes from treatment where diagnosis like '%diabetes%'";
String s4 = " select count(*)  as chest from treatment where diagnosis like '%chest%'";
String s5 = " select count(*) as bp from treatment where diagnosis like '%bp%'";
String s6 = " select count(*) as migrain from treatment where diagnosis like '%migrain%'";


String url = "jdbc:mysql://localhost:3306/chms";
String username = "root";
String password = "root";

try 
{	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url,username, password);
	PreparedStatement ps1 = con.prepareStatement(s1);
	PreparedStatement  ps2= con.prepareStatement(s2);
	PreparedStatement ps3 = con.prepareStatement(s3);
	PreparedStatement ps4 = con.prepareStatement(s4);
	PreparedStatement ps5 = con.prepareStatement(s5);
	PreparedStatement ps6 = con.prepareStatement(s6);
	ResultSet rs1 = ps1.executeQuery();
	ResultSet rs2 = ps2.executeQuery();
	ResultSet rs3 = ps3.executeQuery();
	ResultSet rs4 = ps4.executeQuery();
	ResultSet rs5 = ps5.executeQuery();
	ResultSet rs6 = ps6.executeQuery();
	
	int c=0,h=0,d=0,b=0,m=0,ch=0;
	if(rs1.next())
	{
		c=rs1.getInt("cold");		
	}
	
	if(rs2.next())
	{
		h=rs2.getInt("heart");		
	}
	
	if(rs3.next())
	{
		d=rs3.getInt("diabetes");		
	}
	
	if(rs4.next())
	{
		ch=rs4.getInt("chest");		
	}
	
	if(rs5.next())
	{
		b=rs5.getInt("bp");		
	}
	
	if(rs1.next())
	{
		m=rs6.getInt("migrain");		
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
    		<a href="welcomeadmin.jsp" class="sidebar-toggler  mr-4 mr-lg-5 lead">
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
				<div id="piechart"></div>
				<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
				<script type="text/javascript">
				// Load google charts
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
				// Draw the chart and set the chart values
				function drawChart() {
				var data = google.visualization.arrayToDataTable([
				['Disease', 'No of patients'],
				['Cold',<%=c%>],
				['Heart',<%=h%> ],
				['Diabetes',<%=d%>],
				['Chest', <%=ch%>],
				['BP', <%=b%>],
				['Migrain', <%=m%>]
				]);
				// Optional; add a title and set the width and height of the chart
				var options = {'title':'No of patients per disease', 'width':550, 'height':400};
				// Display the chart inside the <div> element with id="piechart"
				var chart = new google.visualization.PieChart(document.getElementById('piechart'));
				chart.draw(data, options);
				}
				</script>
				
	</body>
	<%
}
catch(Exception E){

}%>
</html>