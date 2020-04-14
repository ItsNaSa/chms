  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Enter Aadhar details</title>
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
    <h1 align="center">Central Healthcare Management system</h1>
    <div class="row align-items-center py-5">

      <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">
        <!-- <div class="pr-lg-5"><img src="img/logo.png" alt="" class="img-fluid" width="300" height="100"></div> -->
        <div class="pr-lg-5"><img src="img/illustration.svg" alt="" class="img-fluid"></div>
      </div>
      <div class="col-lg-5 px-lg-4">
        <!-- <h1 class="text-base text-primary text-uppercase mb-4">CHMS Dashboard</h1> -->
        <h2 class="mb-4">Welcome to CHMS, ${uname }!</h2>
        <h5 class="mb-4">Enter Aadhar ID to fetch patient medical history.</h5>
        <form id="loginForm" action="search" method="post" class="mt-4">
          <div class="form-group mb-4">
            <p align="center" style="color:red">
              <%
              if(null!=request.getAttribute("errorMessage"))
              {
                out.println(request.getAttribute("errorMessage"));
              }
              %>          
            </p>
            <input type="text" name="aadharid" placeholder="Aadhar ID" class="form-control border-0 shadow form-control-lg">
          </div>
          
          <div class="form-group mb-4">
            <div class="custom-control custom-checkbox">
            </div>

          </div>
          <button type="submit" class="btn btn-primary shadow px-5">Fetch</button>
        </form>
      </div>
    </div>
    <p class="mt-5 mb-0 text-gray-400 text-center">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Bootstrapious</a> & CHMS</p>
    <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)                 -->
  </div>
</div>
<footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-6 text-center text-md-left text-primary">
        <p class="mb-2 mb-md-0">CHMS &copy; 2018-2020</p>
      </div>
      <div class="col-md-6 text-center text-md-right text-gray-400">
        <p class="mb-0">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Bootstrapious</a></p>
        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
      </div>
    </div>
  </div>
</footer>     
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script src="js/front.js"></script>
</body>
</html>