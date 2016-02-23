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
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="login">BostonToGo v2.0,
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
										<li><a href="login"><i class="fa fa-dashboard fa-fw"></i>
												Show Restaurants</a></li>
										<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
												View Orders<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href="login">Current Orders</a></li>
												<li><a href="login">Order History</a></li>
											</ul> <!-- /.nav-second-level --></li>
										<li><a href="login"><i class="fa fa-table fa-fw"></i>
												Shopping Cart Details</a></li>
										<li><a href="login"><i class="fa fa-edit fa-fw"></i>
												View Reviews</a></li>
										<li><a href="#"><i class="fa fa-wrench fa-fw"></i>Customer Account
										<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href="login">Account Analysis</a></li>
												<li><a href="login">Bank Account</a></li>
												<li><a href="login">Coupon</a></li>																							
											</ul> <!-- /.nav-second-level --></li>
										
										<li><a href="#"><i class="fa fa-files-o fa-fw"></i>
												Support<span class="fa arrow"></span></a>
											<ul class="nav nav-second-level">
												<li><a href="login">FAQ</a></li>
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
					<h1 align="center" class="page-header">BostonToGo.com</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
<div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            New User Registration
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">Home</a>
                                </li>
                                <li><a href="#profile" data-toggle="tab">Profile</a>
                                </li>
                                <li><a href="#messages" data-toggle="tab">Messages</a>
                                </li>
                                <li><a href="#settings" data-toggle="tab">Settings</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="home">
                                    <h4>Home Tab</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                    <a class="nexttab" href="#">Next Tab</a>
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <h4>Profile Tab</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                                <div class="tab-pane fade" id="messages">
                                    <h4>Messages Tab</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                                <div class="tab-pane fade" id="settings">
                                    <h4>Settings Tab</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
				<div class="col-md-8 col-md-offset-2">
					
					<form id="newUserForm" action="login" method="post" name="myForm"
						OnSubmit="return confirmPass();">
						<div class="panel panel-default">
							<div class="panel-heading">New User Register</div>
							<!-- /.panel-heading -->
							&nbsp
							<div class="panel-body">

								<div class="col-lg-6">
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
												<label>Address:</label> </br> <input class="form-control"
													placeholder="Enter Street" name="street"> </br> <input
													class="form-control" placeholder="Enter City" name="city">
												</br> <input class="form-control" placeholder="Enter State"
													name="state"> </br> <input class="form-control"
													placeholder="Enter Zipcode" name="zipcode"> </br> <label>Selects
													Role:</label> <select class="form-control" placeholder="Enter Role"
													name="role">

													<option value="c">Customer</option>
													<option value="r">Restaurant</option>

												</select>
											</p>
											<p></p>
											<p></p>

										</div>
										<!-- /.panel-body -->
									</div>
									<!-- /.panel -->
								</div>
								<center>
									<p>&nbsp</p>
									<button type="submit" class="btn btn-default">Registor</button>
									&nbsp&nbsp&nbsp
									<button type="reset" class="btn btn-default">Registor</button>
								</center>
							</div>
						</div>
						<!-- /.panel-body -->
					</form>
				</div>

				<!-- /.panel -->
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
    <script src="resources/js/jquery.validate.min.js"></script>
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
				}
        },
        submitHandler: function (form) { // for demo
            alert('valid form submitted'); // for demo
            return false; // for demo
        }
    });

});
</script>
</body>
</html>
