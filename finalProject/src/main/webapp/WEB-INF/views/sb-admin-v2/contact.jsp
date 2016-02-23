
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Res Home Page</title>

<script type="text/javascript">
		function resize(element, maxWidth, maxHeight){
			if(element.width > maxWidth || element.height > maxHeight){
				if(element.width / element.height > maxWidth / maxHeight){
					element.width = maxWidth;
				}else{
					element.height = maxHeight;
				}
			}
		}
	</script>
<link type="text/css" href="resources/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link type="text/css" href="resources/css/sb-admin.css" rel="stylesheet">
<link href="resources/css/agency.css" rel="stylesheet">
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
				<a class="navbar-brand" href="homeRes">BostonToGo v1.0</a>
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
						<li><a href="ResProfile"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
									
										
												   
												  <li><a href="home"><i
												class="fa fa-sign-out fa-fw"></i> Logout</a></li>
												   
									</ul> <!-- /.dropdown-user --></li>
								<!-- /.dropdown -->
							</ul>
							<!-- /.navbar-top-links -->

							<div class="navbar-default navbar-static-side" role="navigation">
								<div class="sidebar-collapse">
									<ul class="nav" id="side-menu">
										<li class="sidebar-search">
											<div class="input-group custom-search-form">
												<input type="text" class="form-control" placeholder="Search...">
												<span class="input-group-btn">
													<button class="btn btn-default" type="button">
														<i class="fa fa-search"></i>
													</button>
												</span>
											</div> <!-- /input-group -->
										</li>
										<li><a href="menu"><i class="fa fa-dashboard fa-fw"></i>
												Manage Menu</a></li>
										<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
												View Order Details<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href="ResOrderUD">Undelivered Order</a></li>
												<li><a href="ResOrderDing">Delivering Order</a></li>
												<li><a href="ResOrderDed">Order History</a></li>
												<li><a href="ResOrderAll">Orders Manager</a></li>
											</ul> <!-- /.nav-second-level --></li>
										<li><a href="ResReviews"><i class="fa fa-table fa-fw"></i>
												View Reviews</a></li>
										<li><a href="#"><i class="fa fa-edit fa-fw"></i>
												Account Manager<span class="fa arrow"></span></a>
												<ul class="nav nav-second-level">
												<li><a href="ResOrderUD">Monthly Income</a></li>
												<li><a href="ResOrderDing">Customer Analysis</a></li>
												<li><a href="ResOrderDed">Income Analysisy</a></li>
											</ul></li>
										
										<li><a href="#"><i class="fa fa-files-o fa-fw"></i>
												Support<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href="FAQ">FAQ</a></li>
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
					<h1 class="page-header" style="color:#0CF">Do you want to get in touch?</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		 <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Contact Us</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name *" id="name" required data-validation-required-message="Please enter your name.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Your Email *" id="email" required data-validation-required-message="Please enter your email address.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control" placeholder="Your Phone *" id="phone" required data-validation-required-message="Please enter your phone number.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Your Message *" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button type="submit" class="btn btn-default">Send Message</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
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
</body>
</html>
