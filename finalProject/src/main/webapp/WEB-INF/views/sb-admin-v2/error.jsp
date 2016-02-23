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
				<a class="navbar-brand" href="homeCus">SB Admin v2.0,
					username=${username}, role=${role}, ResID=${cus.id}</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<!-- /.dropdown -->
				<li class="dropdown">
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#">
								<div>
									<p>
										<strong>Task 1</strong> <span class="pull-right text-muted">40%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 2</strong> <span class="pull-right text-muted">20%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">
											<span class="sr-only">20% Complete</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 3</strong> <span class="pull-right text-muted">60%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%">
											<span class="sr-only">60% Complete (warning)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 4</strong> <span class="pull-right text-muted">80%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%">
											<span class="sr-only">80% Complete (danger)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Tasks</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-tasks -->
				</li>
				<!-- /.dropdown -->
				<li class="dropdown">
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> New Comment <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
										class="pull-right text-muted small">12 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> Message Sent <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> New Task <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Alerts</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-alerts -->
				</li>
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
												Charts<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href="flot.html">Flot Charts</a></li>
												<li><a href="morris.html">Morris.js Charts</a></li>
											</ul> <!-- /.nav-second-level --></li>
										<li><a href="OrderDetails"><i class="fa fa-table fa-fw"></i>
												Order Details</a></li>
										<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
												Forms</a></li>
										<li><a href="#"><i class="fa fa-wrench fa-fw"></i> UI
												Elements<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href="panels-wells.html">Panels and Wells</a></li>
												<li><a href="buttons.html">Buttons</a></li>
												<li><a href="notifications.html">Notifications</a></li>
												<li><a href="typography.html">Typography</a></li>
												<li><a href="grid.html">Grid</a></li>
											</ul> <!-- /.nav-second-level --></li>
										<li><a href="#"><i class="fa fa-sitemap fa-fw"></i>
												Multi-Level Dropdown<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href="#">Second Level Item</a></li>
												<li><a href="#">Second Level Item</a></li>
												<li><a href="#">Third Level <span class="fa arrow"></span></a>
													<ul class="nav nav-third-level">
														<li><a href="#">Third Level Item</a></li>
														<li><a href="#">Third Level Item</a></li>
														<li><a href="#">Third Level Item</a></li>
														<li><a href="#">Third Level Item</a></li>
													</ul> <!-- /.nav-third-level --></li>
											</ul> <!-- /.nav-second-level --></li>
										<li><a href="#"><i class="fa fa-files-o fa-fw"></i>
												Support<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href=FAQ>FAQ</a></li>
												<li><a href="login.html">Login Page</a></li>
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
									<h1 class="page-header">Sorry, the server is in the maintaince.</h1>
									<h2>Please try again later. </h2>
									<h2>Or contact deleloper at<a> 603544395@qq.com </a></h2>
								</div>
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.row --></div>
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
						</body>
						</html>
						