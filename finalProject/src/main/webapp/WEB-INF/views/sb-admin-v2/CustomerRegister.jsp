<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Start Bootstrap - SB Admin Version 2.0 Demo</title>

<!-- Core CSS - Include with every page -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<!-- Page-Level Plugin CSS - Morris -->
<link href="resources/css/plugins/morris/morris-0.4.3.min.css"
	rel="stylesheet">

<!-- SB Admin CSS - Include with every page -->
<link href="resources/css/sb-admin.css" rel="stylesheet">
</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			style=" background-color:#CCC margin-bottom:0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home">BostonToGo v2.0</a>
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
						<li><a href="login"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="login"><i class="fa fa-gear fa-fw"></i> Settings</a>
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
							<!-- /.navbar-top-links --><!-- /.navbar-static-side -->
								</nav>
                                </div>
		
			<div class="row">
				<div class="col-lg-12">
					<h1 align="center" class="page-header">BostonToGo.com</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
<div class="col-md-8 col-md-offset-2">
<form id="newUserForm" action="login" method="post" name="myForm"
						OnSubmit="return confirmPass();">
      <div class="panel panel-primary">
                        <div class="panel-heading">
                            New User Registration
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">Role</a>
                                </li>
                                <li><a href="#profile" data-toggle="tab">Profile</a>
                                </li>
                                <li><a href="#messages" data-toggle="tab">Address</a>
                                </li>
                                <li><a href="#settings" data-toggle="tab">Terms&Conditions</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="home">
                                    <h4>Role Tab</h4>
                                    <div class="col-md-8 col-md-offset-2">
									<div class="panel panel-default">
										<!-- /.panel-heading -->
										<div class="panel-body">
											<p>
												 <label>Selects
													Role:</label></br> </br><select class="form-control" placeholder="Enter Role"
													name="role">

													<option value="c" selected>Customer</option>
													<option value="r">Restaurant</option>

												</select></br>
											</p>
											 <center><a class="btn btn-primary btnNext" >Next</a>
        </center>

										</div>
										<!-- /.panel-body -->
									</div>
									<!-- /.panel -->
								</div>
                                   
                              </div>
                                <div class="tab-pane fade" id="profile">
                                    <h4>Profile Tab</h4>
                                    <div class="col-md-8 col-md-offset-2">
									<div class="panel panel-default">

										<!-- /.panel-heading -->
										<div class="panel-body">
											<label>Email:</label> </br> <input class="form-control"
												placeholder="Enter UserName" name="username" type="email">
											</br> <label>Password:</label> </br> <input class="form-control"
												placeholder="Enter PassWord" name="password" type="password"
												id="password"> </br> <input class="form-control"
												placeholder="Confirm PassWord" name="newpassword" type="password"
												id="newpassword"> </br> <label>Real Name:</label> </br> <input
												class="form-control" placeholder="Enter Name"
												name="realname"> </br> </br>
<center><a class="btn btn-primary btnPrevious" >Previous</a>&nbsp&nbsp&nbsp
 <a class="btn btn-primary btnNext" >Next</a>
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
												<label>Address:</label> </br> <input class="form-control"
													placeholder="Enter Street" name="street"> </br> <input
													class="form-control" placeholder="Enter City" name="city">
												</br> <input class="form-control" placeholder="Enter State"
													name="state"> </br> <input class="form-control"
													placeholder="Enter Zipcode" name="zipcode"> </br> 
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
<input name="terms" type="checkbox" id="isAgeSelected" checked>&nbsp Accept Term&Conditions
</br>
</p>
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
			<!-- /.col-lg-6 -->
			<!-- /.col-lg-6 -->
			<!-- /.col-lg-6 -->
			<!-- /.col-lg-6 -->
			<!-- /.col-lg-6 -->
		
<!-- /.row -->
	
	<!-- /#page-wrapper -->


	<!-- /#wrapper -->

<!-- Core Scripts - Include with every page -->
	<script src="resources/js/jquery-1.10.2.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

	<script src="resources/js/sb-admin.js"></script>
    <script src="resources/js/jquery.validate.min.js"></script>
     <script>
$(document).ready(function () {

    $('#newUserForm').validate({ // initialize the plugin
        rules: {
            username: {
                required: true,
                email: true
            },
            password: {
				required: true,
				minlength: 5
			},
			newpassword: {
				required: true,
				minlength: 5,
				equalTo: "#password"
			},
			realname: {
				required: true
			},
			street: {
				required: true
			},
			city: {
				required: true
			},
			state: {
				required: true
			},
			zipcode: {
				required: true,
				number: true
			},
			 terms: {
         		required : true
      }
        },
		messages:{
      		terms: {
        	required : "Please accept Terms & Conditions!"
     		 }
		}
    });

});
</script>

</body>
</html>
