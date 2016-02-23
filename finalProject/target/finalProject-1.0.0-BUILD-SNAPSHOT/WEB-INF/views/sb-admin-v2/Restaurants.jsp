<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Res Home Page</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link type="text/css" href="resources/css/bootstrap.min.css"
	rel="stylesheet">

<link type="text/css" href="resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="resources/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">
<link type="text/css" href="resources/css/sb-admin.css" rel="stylesheet">


<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
	
</script>
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
    </script>
<style>
.thumbnail1 {
    width: 100%;
    height: 100%;
}

.image1 {
    width: 100%;
    height: 100%;    
}

.image1 img {
    -webkit-transition: all 1s ease; /* Safari and Chrome */
    -moz-transition: all 1s ease; /* Firefox */
    -ms-transition: all 1s ease; /* IE 9 */
    -o-transition: all 1s ease; /* Opera */
    transition: all 1s ease;
}

.image1:hover img {
    -webkit-transform:scale(1.5); /* Safari and Chrome */
    -moz-transform:scale(1.5); /* Firefox */
    -ms-transform:scale(1.5); /* IE 9 */
    -o-transform:scale(1.5); /* Opera */
     transform:scale(1.5);
}
</style>
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
					<h1 class="page-header">Restaurants Overview</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-info">
						<div class="panel-heading"> 
                        <form action="Restaurants" method="post" name="theform">
						  <select class="form-control" style="width:25% " placeholder="Enter Role"
													name="sort" onChange="document.theform.submit();">
						    
						    <option 
						    <c:if test="${sort=='sbt'}"> selected</c:if>
						    value="sbt">Sort By Type</option>
						    <option 
						    <c:if test="${sort=='sbn'}"> selected</c:if>
						    value="sbn">Sort By Name</option>
						    <option 
						    <c:if test="${sort=='sbr'}"> selected</c:if>
						    value="sbr">Sort By Rating</option>
					      </select>
                          </form>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- /.panel-body -->
							<c:if test="${!empty restaurants}">
							<table class="table table-striped  table-hover"
										 id="example">
								<thead>
									<center><tr>
										
										
                                        
										<th >photo</th>
										<th >Restaurant</th>
										<!--<th  width="7%">cuisine</th>-->
										<th >address</th>
                                       <!-- <th  width="11%">Reviews</th>-->  
                                                                            
										<th >Status</th>
									</tr></center>
								</thead>
								<tbody>
								<c:forEach items="${restaurants}" var="restaurant">
									<tr style="cursor: pointer;" onclick="window.location='ResMenu?resId=${restaurant.id}';">
										<form method="get" action="ResMenu">
											
											
											<td><c:if test="${fn:length(restaurant.coverPhoto) > 0}">
			    					<div class="thumbnail1">
    <div class="image1"><img src="restaurantes/${restaurant.id}/photo" onload="resize(this, 140, 90);"/></div></div>
			    				</c:if></td>
											<td><h4><font face="verdana" color="red">${restaurant.name}</font></h4>
                                            <input style="float:left"  id="input-6a" class="rating" data-size="xs" value="${restaurant.avgRating/2}" data-show-clear="false" data-show-caption="true" data-readonly="true">on ${restaurant.reviewsNo} reviews
												 <input name='resId' type='hidden' value='${restaurant.id}'></br>
												 
												
											</td>
											<!--<td></td>-->
											<td><br><br><font face="verdana" color="green">${restaurant.restaurantType} Cuisine</font> <br>${restaurant.address.street}, ${restaurant.address.city},</br>
										${restaurant.address.state}, ${restaurant.address.zipcode}</td>
                                        
                                        
											<td><button type="submit" class="btn btn-default" aria-label="Left Align">
  <span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>
</button></td>
										</form>
									</tr>

</c:forEach>
								</tbody>
							</table>
							</c:if>
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

	<!-- Page-Level Plugin Scripts - Flot -->
	<!--[if lte IE 8]><script src="resources/js/excanvas.min.js"></script><![endif]-->

	<script src="resources/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>
	<!--
	<script src="resources/js/plugins/flot/jquery.flot.js"></script> 
	 <script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.pie.js"></script>
-->
	<!-- SB Admin Scripts - Include with every page -->
	<script src="resources/js/sb-admin.js"></script>
    <script src="resources/js/star-rating.js" type="text/javascript"></script>

<link rel="stylesheet" href="resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>	
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
		$(document).ready(function() {
    var dataTable = $('#example').dataTable({
         
		 "autoWidth": false,
		 
         aoColumns : [
          { "sWidth": "13%"},
          { "sWidth": "25%"},
          { "sWidth": "51%"},
          { "sWidth": "9%"}
        ]
    });
    
});
		</script>
</body>
</html>
