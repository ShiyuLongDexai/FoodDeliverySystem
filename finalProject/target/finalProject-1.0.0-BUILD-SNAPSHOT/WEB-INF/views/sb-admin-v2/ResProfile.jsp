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
				<a class="navbar-brand" href="homeRes">BostonToGo v1.0,
					username=${username}, role=${role}, ResID=${res.id}</a>
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
					<h1 align="center" class="page-header">BostonToGo.com</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">

				<div class="col-md-12 col-md-offset-0">
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
					<form action="homeRes" method="post" name="myForm"
						OnSubmit="return confirmPass();" enctype="multipart/form-data">
						<div class="panel panel-default">
							<div class="panel-heading">Restaurant Profile</div>
							<!-- /.panel-heading -->
							&nbsp
							<div class="panel-body">

								<div class="col-lg-4">
									<div class="panel panel-default">

										<!-- /.panel-heading -->
										<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
										<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
										<div class="panel-body">
											<label>Email:</label> </br> <input value="<c:out value='${res.user.username}'/>"  class="form-control"
												placeholder="Enter UserName" name="username" type="email">
											</br> <label>Password:</label> </br> <input value='${res.user.password}' class="form-control"
												placeholder="Enter PassWord" name="password" type="password"
												id="password"> </br> <input value='${res.user.password}' class="form-control"
												placeholder="Confirm PassWord" name="newpassword" type="password"
												id="newpassword"> </br> <label>Real Name:</label> </br> <input value="${fn:escapeXml(res.name)}" 
												class="form-control" placeholder="Enter Name"
												name="realname"> </br> </br>


										</div>
										<!-- /.panel-body -->
									</div>
									<!-- /.panel -->
								</div>
							  <div class="col-lg-4">
								  <div class="panel panel-default">
								    <!-- /.panel-heading -->
								    <div class="panel-body">
								      <p>
								        <label>Address:</label>
								        </br>
								        <input value='${res.address.street}'class="form-control"
													placeholder="Enter Street" name="street">
								        </br>
								        <input value='${res.address.city}'
													class="form-control" placeholder="Enter City" name="city">
								        </br>
								        <input value='${res.address.state}' class="form-control" placeholder="Enter State"
													name="state">
								        </br>
								        <input value='${res.address.zipcode}' class="form-control"
													placeholder="Enter Zipcode" name="zipcode">
								        </br>
								       </br>
								       </br>
								       </br>
								      
								       
							          </p>
								      <p></p>
								      <p></p>
							        </div>
								    <!-- /.panel-body -->
							      </div>
								  <!-- /.panel -->
							  </div>
								<div class="col-lg-4">
								  <div class="panel panel-default">
								    <!-- /.panel-heading -->
								    <div class="panel-body">
								      
								        <label>Restaurant Photo:</label>
								        </br>
								       
								        <input class="form-control" placeholder="Enter Restaurant Photo"  type="file" name="resPhoto">
								        </br>
								        <label>Restaurant Type:</label>
                                        </br>
                                      <select class="form-control" placeholder="Enter Restaurant Type"
													name="resType">
                                          <option value="Chinese">Chinese</option>
                                          <option value="Indian">Indian</option>
                                          <option value="American">American</option>
                                        </select>
                                        </br>
                                        <label>Delivery ZipCodes:</label>
								        
								        <input value='${res.deliverZipcode}' class="form-control"
													placeholder="Enter Delivery Zipcodes" name="deliveryZipcode">
                                                     </br>
								        <label>Restaurant Discription</label>
                                            <textarea  class="form-control" rows="2" name="resDisc">${res.discription}</textarea>
								        
								        
								      
							        </div>
								    <!-- /.panel-body -->
							      </div>
								  <!-- /.panel -->
							  </div>
								<center>
								  <p>&nbsp</p>
									<button type="submit" class="btn btn-default">Update</button>
									&nbsp&nbsp&nbsp
									<button type="reset" class="btn btn-default">Reset</button>
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
</body>
</html>
