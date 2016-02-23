<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Customer Home Page</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link type="text/css" href="resources/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link type="text/css" href="resources/css/sb-admin.css" rel="stylesheet">

    
    
    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="resources/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="resources/css/plugins/timeline/timeline.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
   

<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
	
</script>
<script>
	var marker;
	function initialize() {
		var myCenter = new google.maps.LatLng(42.3583333, -71.0602778);
		var mapProp = {
			center : myCenter,
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);
		marker = new google.maps.Marker({
			position : myCenter,
			// icon:'themes/assets/images/nepali-momo.png',
			animation : google.maps.Animation.BOUNCE
		});

		marker.setMap(map);

		// Info open
		var infowindow = new google.maps.InfoWindow({
			content : "Hello World!"
		});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="homeCus">BostonToGo v2.0,
					username=${username}, role=${role}, CusID=${cus.id}</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<!-- /.dropdown -->
				
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="CusProfile"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<%
							HttpSession mySession = request.getSession();
						String username = (String) mySession.getAttribute("username");
						
							if(username==null){%>			
										<li><a href="login"><i
												class="fa fa-sign-out fa-fw"></i> Login</a></li>
												<%} 
												    else{%>
												  <li><a href="home"><i
												class="fa fa-sign-out fa-fw"></i> Logout</a></li>
												    <%}%>
									</ul> <!-- /.dropdown-user --></li>
								<!-- /.dropdown -->
							</ul>
							<!-- /.navbar-top-links -->

							<div class="navbar-default navbar-static-side" role="navigation">
								<div class="sidebar-collapse">
									<ul class="nav" id="side-menu">
										<li class="sidebar-search">
											<form action="ResSearch" method="get"><div class="input-group custom-search-form">
												<input type="text" class="form-control" placeholder="Search..." name="searchName">
												<span class="input-group-btn">
													<button class="btn btn-default" type="submit">
														<i class="fa fa-search"></i>
													</button>
												</span>
											</div> <!-- /input-group --></form>
										</li>
										<li><a href="Restaurants"><i class="fa fa-dashboard fa-fw"></i>
												Show Restaurants</a></li>
										<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
												View Orders<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href="CusOrder">Current Orders</a></li>
												<li><a href="CusOrderHistory">Order History</a></li>
											</ul> <!-- /.nav-second-level --></li>
										<li><a href="OrderDetails"><i class="fa fa-table fa-fw"></i>
												Shopping Cart Details</a></li>
										<li><a href="CusReviews"><i class="fa fa-edit fa-fw"></i>
												View Reviews</a></li>
										<li><a href="#"><i class="fa fa-wrench fa-fw"></i>Customer Account
										<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href="panels-wells.html">Account Analysis</a></li>
												<li><a href="buttons.html">Bank Account</a></li>
												<li><a href="notifications.html">Coupon</a></li>																							
											</ul> <!-- /.nav-second-level --></li>
										
										<li><a href="#"><i class="fa fa-files-o fa-fw"></i>
												Support<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href=FAQ>FAQ</a></li>
												<li><a href="#">Contact Admin</a></li>
											</ul> <!-- /.nav-second-level --></li>
									</ul>
									<!-- /#side-menu -->
								</div>
								<!-- /.sidebar-collapse -->
							</div>
							<!-- /.navbar-static-side -->
								</nav>
								<div id="page-wrapper">
							<div class="row">
								<div class="col-lg-12">
									<h1 class="page-header">FAQ</h1>
                                   
							  </div>
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.row -->
							<div class="row">
							  <div class="col-md-8 col-md-offset-2">
							    <div class="panel panel-info">
							      <div class="panel-heading">Common Questions</div>
							      <!-- /.panel-heading -->
							      
							       <div class="panel-body">
                                     <div class="row">
                                <div class="col-lg-12">
							      <!-- /.panel-body -->
						          <p><strong>Q.) What is the Delivery Fee?</strong></p>
						          <p>A.) The standard delivery fee is $4.49. Most of our deliveries are covered in this range with a few exceptions if you are located in an extended delivery area.</p>
						          <p> </p>
						       
						          <p><strong>Q.) How Does Your Service Work?</strong></p>
						          <p>A.) Ithaca To Go provides food delivery from your favorite Ithaca restaurants and brings it directly to your door. It's that easy! We deliver to homes, businesses, hotels and dorms - if your zip code is 14850 then we deliver to you.</p>
						          <p> </p>
						          
						          <p> <strong>Q.) How Do I Place an Order?</strong></p>
						          <p> A.) You can place your order online or over the phone by calling (607) 216-9310. We are happy to answer any questions you may have!</p>
						          <p>  </p>
						         
						          <p><strong>Q.) Do You Have a Minimum Order?</strong></p>
						          <p>A.) Standard deliveries require no minimum order. Please feel free to order as much as you would like! Some extended delivery areas may require a $25.00 - $50.00 minimum depending on distance from the restaurant to your address.</p>
						          <p> </p>
						        
						          <p><strong>Q.) What Type of Payments Do You Accept?</strong></p>
						          <p>A.) We accept cash, City Bucks, SMC and all major credit cards (Visa, Mastercard, American Express, Discover and Purchase Cards). Personal checks are not accepted.</p>
						          <p> </p>
						      
						          <p><strong>Q.) How Long Does Delivery Take?</strong></p>
						          <p>A.) Ithaca To Go provides service within 35 - 45 minutes for all standard deliveries. This time frame may vary depending on factors such as traffic and food preparation times. We do our best to minimize delays and greatly appreciate your patience. </p>
						          <p> </p>
						        
						          <strong>Q.) Do You Deliver Drinks?</strong>
						          <p> A.) Yes! Ithaca To Go offers a variety of beverage options including soft drinks and bottled water. Complete your meal be selecting 'Drinks' on the left hand side when placing your order.</p>
						          <p> </p>
						        
                                  <p> <strong>Q.) Should I Tip My Driver?</strong></p>
                                  <p>A.) Absolutely! Gratuity is not included and our drivers work hard so please consider your driver's efforts and tip accordingly. Standard delivery gratuity is 15%-20%.</p>
                                  </div>
                                  </div>
						          </div>
							    <!-- /.panel -->
						      </div>
							  <!-- /.col-lg-12 -->
								<!-- /.col-lg-6 --><!-- /.col-lg-6 -->
								<!-- /.col-lg-6 --><!-- /.col-lg-6 -->
								<!-- /.col-lg-6 -->
							</div>
							<!-- /.row -->
								</div>
								<!-- /#page-wrapper -->

							</div>
							<!-- /#wrapper -->

							<!-- Core Scripts - Include with every page -->
							<script src="resources/js/jquery-1.10.2.js"></script>
							<script src="resources/js/bootstrap.min.js"></script>
							<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

							<!-- Page-Level Plugin Scripts - Flot -->
							<!--[if lte IE 8]><script src="resources/js/excanvas.min.js"></script><![endif]-->
							<script src="resources/js/plugins/flot/jquery.flot.js"></script>
							<script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
							<script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>
							<script src="resources/js/plugins/flot/jquery.flot.pie.js"></script>

							<!-- SB Admin Scripts - Include with every page -->
							<script src="resources/js/sb-admin.js"></script>

							<!-- Page-Level Demo Scripts - Flot - Use for reference -->
							<script src="resources/js/demo/flot-demo.js"></script>
                            
   
    

    <!-- Page-Level Plugin Scripts - Dashboard -->
    <script src="resources/js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="resources/js/plugins/morris/morris.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    

    <!-- Page-Level Demo Scripts - Dashboard - Use for reference -->
    <script src="resources/js/demo/dashboard-demo.js"></script>
    

						</body>
						</html>
						