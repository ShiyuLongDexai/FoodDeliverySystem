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
					<h1 class="page-header">Review Your Order</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<form action="CheckSuccess" method="post" name="myForm"
				OnSubmit="return confirmPass();">
				<div class="row">
					<div class="col-md-8">

						<div class="panel panel-primary">
							<div class="panel-heading">Check Out Profile</div>
							<!-- /.panel-heading -->
							&nbsp
							<div class="panel-body">
								<div class="col-lg-6">
									<div class="panel panel-default">
										<!-- /.panel-heading -->
										<div class="panel-body">
											<p>
												<label>Phone:</label>
											</p>
											<p>
												<input class="form-control" placeholder="Enter Phone Number"
													name="phone">
											</p>
											<p>
												<label>Address:</label> </br> <input
													value='${cus.address.street}' class="form-control"
													placeholder="Enter Street" name="street"> </br> <input
													value='${cus.address.city}' class="form-control"
													placeholder="Enter City" name="city"> </br> <input
													value='${cus.address.state}' class="form-control"
													placeholder="Enter State" name="state"> </br> <input
													value='${cus.address.zipcode}' class="form-control"
													placeholder="Enter Zipcode" name="zipcode">
											<p></p>
										</div>
										<!-- /.panel-body -->
									</div>
									<!-- /.panel -->
								</div>
								<div class="col-lg-6">
									<div class="panel panel-default">
										<!-- /.panel-heading -->
										<div class="panel-body">
											<p>
												<label>Credit Card:</label>

											</p>
											<input class="form-control"
												placeholder="Enter Credit Card Number" name="cardNo">
											</br> <input class="form-control"
												placeholder="Enter Name On Credit Card" name="nameOnCard">
											</br>
											
												<label>Expiration Date:</label>
											</br>
											<div class="col-lg-5">
												<select placeholder="Month" class="form-control" name="expMonth">
													<option selected value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
											</div>
											<div class="col-lg-5">
												<select id="disabledSelect" class="form-control" name="expYear">
													<option value="2014">2014</option>
													<option value="2015">2015</option>
													<option value="2016">2016</option>
													<option value="2017">2017</option>
													<option value="2018">2018</option>
													<option value="2019">2019</option>
												</select>
											</div>
											</br>
											 </br> </br> <input class="form-control" placeholder="Enter CSC"
												name="vin" data-toggle="tooltip" data-placement="right" title="Tooltip on right"> 
												<a id="popover" class="text-info btn"  rel="popover" data-content="" title="What is CSC code?">
                                                What is CSC</a>
												</br> <label> <input name="remember"
												type="checkbox" value="Remember Me"> &nbsp&nbsp
												Remember The Card
											</label> 

										</div>
										<!-- /.panel-body -->
									</div>
									<!-- /.panel -->
								</div>

							</div>
						</div>
						<!-- /.panel-body -->

						<!-- /.col-lg-12 -->
						<!-- /.col-lg-6 -->
						<!-- /.col-lg-6 -->
						<!-- /.col-lg-6 -->
						<!-- /.col-lg-6 -->
						<!-- /.col-lg-6 -->
					</div>
					<div class="col-lg-4">
						<div class="panel panel-info">
							<div class="panel-heading">Order Detail</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<center>
									<button style="width: 80%" type="submit"
										class="btn btn-info">Place Your Order</button>
									&nbsp&nbsp&nbsp

								</center>
								</br>
								<div class="col-lg-8">
									Dishes Price:</br>Tax Estimated:
								</div>
								<div class="col-lg-4">
									$ ${originTotalPrice}</br> 
									$ ${tax}
								</div>
								</br> </br>
								<hr />
								<!-- /.panel-body -->
								<p align="right" class="text-primary">Total Price:
									$ ${finalTotalPrice} &nbsp&nbsp&nbsp&nbsp&nbsp</p>
								</br>

								<hr />
									</br>  <a class="text-info" data-toggle="tooltip" data-placement="top" 
									title="We dont's charge shippin fees for order over 25 dollors.In addition, some restaurants also dont charge the shipping fees no matter how much you ordered">How do we calculate the shipping fee?</a> 
								</br> </br> <a class="text-info" data-toggle="tooltip" data-placement="top" 
								title="You should call the restaurant to cancel the order, and then place the order again. The system dont support address change function at this time">How can you change the shipping address?</a> </br> </br>

							</div>

						</div>
						<!-- /.panel -->
					</div>
				</div>
				<!-- /.row -->
			</form>
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
	<!--  <script src="resources/js/plugins/flot/jquery.flot.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.pie.js"></script>
<script type="text/javascript"></script>
<script src="resources/js/demo/flot-demo.js"></script>-->
	<!-- SB Admin Scripts - Include with every page -->
	
	<script src="resources/js/sb-admin.js"></script>

	<!-- Page-Level Demo Scripts - Flot - Use for reference -->
	
	
	 <script>
    // tooltip demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    })

    // popover demo
    $("[data-toggle=popover]")
        .popover()
			
	var image = '<img width="80%" src="resources/img/csc.jpg">';
	$('#popover').popover({placement: 'right', content: image, html: true});

    </script>
    
</body>
</html>
