<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Start Bootstrap - SB Admin Version 2.0 Demo</title>

<!-- Core CSS - Include with every page -->
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
										<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<!-- Page-Level Plugin CSS - Morris -->
<link href="resources/css/plugins/morris/morris-0.4.3.min.css"
	rel="stylesheet">

<!-- SB Admin CSS - Include with every page -->
<link href="resources/css/sb-admin.css" rel="stylesheet">
<script type="text/javascript">
						function confirmPass() {
							var pass = document.getElementById("password").value
							var confPass = document
									.getElementById("newpassword").value
							if (pass != confPass) {
								alert('Confirm Password and Password Not Match !');
								return false;
							}
						}
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
					username=${username}, role=${role}, CusID=${cus.id}, Zip=${cus.address.zipcode}</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
			  <!-- /.dropdown --><!-- /.dropdown --><!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
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
					<h1 align="center" class="page-header">User Profile Update</h1>
				</div>
				<!-- /.col-lg-12 -->
		  </div>
			<!-- /.row -->
			<div class="row">
<div class="col-md-8 col-md-offset-2">
<form action="homeCus" method="post" name="myForm"
						OnSubmit="return confirmPass();">
      <div class="panel panel-default">
                        <div class="panel-heading">
                            Restaurant Profile
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">Profile</a>
                                </li>
                                
                                <li><a href="#messages" data-toggle="tab">Address</a>
                                </li>
                                <li><a href="#settings" data-toggle="tab">Terms&Conditions</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="home">
                                    <h4>Profile</h4>
                                    <div class="col-md-8 col-md-offset-2">
									<div class="panel panel-default">
										<!-- /.panel-heading -->
										<div class="panel-body">
											<p>
												 <label>Email:</label> </br> <input value="<c:out value='${cus.user.username}'/>"  class="form-control"
												placeholder="Enter UserName" name="username" type="email">
											</br> <label>Password:</label> </br> <input value='${cus.user.password}' class="form-control"
												placeholder="Enter PassWord" name="password" type="password"
												id="password"> </br> <input value='${cus.user.password}' class="form-control"
												placeholder="Confirm PassWord" name="newpassword" type="password"
												id="newpassword"> </br> <label>Real Name:</label> </br> <input value="${fn:escapeXml(cus.name)}" 
												class="form-control" placeholder="Enter Name"
												name="realname"> </br> 
											</p>
											 <center><a class="btn btn-primary btnNext" >Next</a>
        </center>

										</div>
										<!-- /.panel-body -->
									</div>
									<!-- /.panel -->
								</div>
                                   
                              </div>
                                
                                <div class="tab-pane fade" id="messages">
                                    <h4>Address Tab</h4>
                                    <div class="col-md-8 col-md-offset-2">
									<div class="panel panel-default">
										<!-- /.panel-heading -->
										<div class="panel-body">
											<p>
												<label>Address:</label>
								        </br>
								        <input value='${cus.address.street}'class="form-control"
													placeholder="Enter Street" name="street">
								        </br>
								        <input value='${cus.address.city}'
													class="form-control" placeholder="Enter City" name="city">
								        </br>
								        <input value='${cus.address.state}' class="form-control" placeholder="Enter State"
													name="state">
								        </br>
								        <input value='${cus.address.zipcode}' class="form-control"
													placeholder="Enter Zipcode" name="zipcode">
								        </br>
										  </p>
                                          
											 <center><a class="btn btn-primary btnPrevious" >Previous</a>&nbsp&nbsp&nbsp <a class="btn btn-primary btnNext" >Next</a>
        </center>

										</div>
										<!-- /.panel-body -->
									</div>
									<!-- /.panel -->
								</div>
                                   
                              </div>
                                <div class="tab-pane fade" id="settings">
                                    <h4>T&C Tab</h4>
                                    <div class="col-md-8 col-md-offset-2">
									<div class="panel panel-default">
										<!-- /.panel-heading -->
										<div class="panel-body">
                                        <h4>Terms and Conditions</h4>
                                        <p>
											<textarea class="terms" readonly style="margin: 0px; width: 95%; height: 342px;">Terms and Conditions

GENERAL

Servicing servicing resistor video computer element transponder prototype analog solution mainframe network. Solution video debugged feedback sampling extended, infrared, generator generator. 

* list item number one
* list item number two
* list item number three

Harmonic gigabyte generator in sequential interface. Services, integer device read-only supporting cascading cache capacitance. Proxy boolean solution or data overflow element overflow processor arrray video, reflective extended. Gigabyte debugged distributed, reflective controller disk encapsulated phase network arrray feedback element cache high silicon. Sampling backbone analog remote adaptive extended bridgeware n-tier integer audio femtosecond. 

IMPORTANT STUFF

Interface broadband developer backbone fragmentation messaging software transmission, sampling cascading element high silicon backbone. Reflective servicing coordinated boolean connectivity extended inversion sequential for. Data distributed backbone bridgeware connectivity logarithmic, sampling ethernet for. Extended logarithmic log video echo gigabyte. Or procedural phaselock sequential port extended deviation sequential, disk recognition gigabyte phaselock proxy messaging arrray. Encapsulated echo deviation boolean system ethernet reducer, pc. 

Backbone frequency echo ethernet patch femtosecond sampling, integer digital floating-point n-tier dithering disk. Processor reflective boolean includes phase deviation, with log, integral logistically femtosecond, in, integral infrared phaselock. Element developer pc harmonic, plasma with, integral floating-point. Reflective feedback infrared, echo anomoly integral generator reflective led, high overflow servicing gigabyte. Extended integral data, infrared frequency disk broadband transistorized processor disk anomoly, sampling potentiometer kilohertz. Bus overflow, bridgeware fragmentation bypass prototype, interface, for internet pc generator integral, bypass disk, frequency. 

FEES

Sequential ENCAPSULATED RESISTOR element converter pc harmonic. Feedback cache hyperlinked debugged generator infrared device network, fragmentation connectivity, debugged. For, dithering interface debugged sequential recognition bypass bridgeware processor backbone sampling logarithmic software. Anomoly infrared logarithmic logarithmic procedural plasma resistor integral silicon deviation. Computer broadband plasma, encapsulated cable kilohertz scan. With logarithmic bridgeware indeterminate sampling, port. Development procedural hyperlinked mainframe, encapsulated boolean software processor transistorized cable with backbone. 

Reflective backbone log transmission cable logarithmic mainframe. Messaging backbone debugged feedback development phaselock metafile n-tier coordinated, cable coordinated coordinated in. Analog device transistorized, sequential transistorized with scalar normalizing. Mainframe phase cache anomoly feedback servicing harmonic. Services software pc, femtosecond bypass scalar data element extended cascading capacitance harmonic. Adaptive plasma bypass supporting cascading deviation system pulse broadband bridgeware. 

AGREEMENT

Servicing hyperlinked analog encapsulated disk cable with, capacitance element partitioned potentiometer read-only dithering. Normalizing kilohertz network solution logarithmic device bus connectivity system mainframe prototype phaselock phase cache. 

Coordinated transmission overflow floating-point distributed supporting scan converter. Bridgeware backbone coordinated sampling overflow broadband normalizing connectivity or, internet transmission, bus, encapsulated. Extended element element echo messaging scan, cache video deviation debugged broadband. Pc, supporting hyperlinked coordinated patch, bridgeware transistorized, led frequency scalar. Servicing, plasma recursive boolean includes, computer, femtosecond inversion. Services integer harmonic mainframe scalar prototype broadband n-tier. Echo software application indeterminate dithering bypass plasma bus harmonic patch. Digital, mainframe scalar anomoly bypass, bus potentiometer phaselock plasma, phaselock prompt data disk inversion. 

</textarea>
</br>
<input type="checkbox" id="isAgeSelected" checked>&nbsp Accept Term&Conditions
</br>
</p>
 <script>
    if(document.getElementById('isAgeSelected').checked) {
    $("#txtAge").show();
} else {
    $("#txtAge").hide();
}
	</script>
											<center><a class="btn btn-primary btnPrevious" >Previous</a>&nbsp&nbsp&nbsp
        <button type="submit" class="btn btn-primary" id="txtAge">Registor</button>
        
        </center>
        </br>
       


										</div>
										<!-- /.panel-body -->
									</div>
									<!-- /.panel -->
								</div>
        
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
    </form>
              </div>
				

				<!-- /.panel -->
			</div>
			<div class="row"><!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row"><!-- /.panel -->
			</div>
			<!-- /.col-lg-6 -->
			<!-- /.col-lg-6 -->
			<!-- /.col-lg-6 -->
			<!-- /.col-lg-6 -->
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

	<!-- Page-Level Plugin Scripts - Morris -->
	<script src="resources/js/plugins/morris/raphael-2.1.0.min.js"></script>
	<script src="resources/js/plugins/morris/morris.js"></script>

	<!-- SB Admin Scripts - Include with every page -->
	<script src="resources/js/sb-admin.js"></script>

	<!-- Page-Level Demo Scripts - Morris - Use for reference -->
	<script src="resources/js/demo/morris-demo.js"></script>
</body>
</html>
