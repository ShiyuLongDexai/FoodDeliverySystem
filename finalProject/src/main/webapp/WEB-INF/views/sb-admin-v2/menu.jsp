<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Res Home Page</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
					<h1 class="page-header">Menu Manager</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-primary">
						<div class="panel-heading">Menu</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- /.panel-body -->
							<c:if test="${!empty menu}">
							<table width="104%" class="table table-hover">
								<thead>
									<tr>
										<th width="5%">#</th>
										<th width="11%">Photo</th>
										<th width="26%">Name</th>
										<th width="24%">Type</th>
										
										<th width="15%">Price</th>
										<th width="15%">Delete</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${menu}" var="dish">
									<tr>
										<form method="get" action="menu">
											<td rowspan="2">${dish.id}</td>
											<td rowspan="2"><c:if test="${fn:length(res.coverPhoto)> 0}">
						<img src="dishes/${dish.id}/photo" onload="resize(this, 80, 50);"/>
						</c:if></td>
											<td><font face="verdana" color="green">${dish.name}</font>
												</h1> <input name='deleteDishId' type='hidden' value='${dish.id}'>
											</td>
											<td>${dish.category}</td>
											
											<td>${dish.price}</td>
											<td rowspan="2"><button id="${dish.id}" type="submit" class="btn btn-default" aria-label="Left Align" onclick="doAjaxPostDeleteDish(this.id)"> 
  <span class="glyphicon glyphicon-remove" aria-hidden="true"></span></td>
										</form>
									</tr>
                                    <tr><td colspan="3" style="border-top:none"><strong>Description:</strong> ${dish.disc}</td>
                                    </tr>

</c:forEach>
								</tbody>
							</table>
							</c:if>
						</div>
					</div>
					<!-- /.panel -->
				</div>
				<div class="col-lg-4" >
                <div class="col-md-12">
					<div class="panel panel-info">
						<div class="panel-heading">Add Dish</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="best10" style="height: 450px;">
								<form action="menu" method="post" enctype="multipart/form-data">
									<label>Dish Name:</label> </br> <input class="form-control"
										placeholder="Enter Dish Name" name="dishName"> </br> <label>Dish
										Description:</label> </br> <input class="form-control"
										placeholder="Enter Dish Description" name="dishDisc">
									</br> <label>Dish Price:</label> </br> <input class="form-control"
										placeholder="Enter Dish Price" name="dishPrice"> </br> <label>Dish
										Type:</label> <select class="form-control"
										placeholder="Enter Dish Type" name="dishType">
										<option value="appetizer">Appetizer</option>
										<option value="Entree">Entree</option>
										<option value="dessert">Dessert</option>
										<option value="drink">Drink</option>
									</select> </br> <label>Dish Photo:</label> </br><!-- <input class="form-control"
										placeholder="Enter Dish Photo" type="file" name="dishPhoto"></br>-->
                                        <div class="col-md-12"><input  placeholder="Enter Dish Photo" id="input-2" type="file" class="file" multiple data-show-upload="false" data-show-caption="true" name="dishPhoto"></div>


									<center>
										<p>&nbsp</p>
										<button type="submit" class="btn btn-default">Create</button>
										&nbsp&nbsp&nbsp
										<button type="reset" class="btn btn-default">Reset</button>
									</center>
								</form>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
                    </div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
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
<!-- SB Admin Scripts - Include with every page -->
	<script src="resources/js/sb-admin.js"></script>

    <link href="resources/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
       
        <script src="resources/js/fileinput.js" type="text/javascript"></script>
        <script src="resources/js/test.js" type="text/javascript"></script>
</body>
</html>
