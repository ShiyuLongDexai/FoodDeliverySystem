<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Customer Home Page</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link type="text/css" href="resources/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link type="text/css" href="resources/css/sb-admin.css" rel="stylesheet">
<link href="resources/css/modern-business.css" rel="stylesheet">
<link href="resources/css/metro.css" rel="stylesheet">

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
<script src="https://maps.googleapis.com/maps/api/js?signed_in=true&libraries=places&callback=initMap" async defer></script>
<script type="text/javascript">

var map;
var infowindow;

function initMap() {
  var pyrmont = {lat: 42.338265, lng: -71.087943};

  map = new google.maps.Map(document.getElementById('map'), {
    center: pyrmont,
    zoom: 16
  });

  infowindow = new google.maps.InfoWindow();

  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch({
    location: pyrmont,
    radius: 500,
    types: ['store']
  }, callback);
}

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
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
												<li><a href=Contact>Contact Admin</a></li>
                                                <li><a href=About>About Us</a></li>
											</ul> <!-- /.nav-second-level --></li>
									</ul>
									<!-- /#side-menu -->
								</div>
								<!-- /.sidebar-collapse -->
							</div>
							<!-- /.navbar-static-side -->
								</nav>
								<div id="page-wrapper">
                                
                                
                                <script type="text/javascript">
    function crunchifyAjax() {
        $.ajax({
            url : 'ajaxtest.html',
            success : function(data) {
                $('#result').html(data);
            }
        });
    }
</script>
 
<script type="text/javascript">
    var intervalId = 0;
    intervalId = setInterval(crunchifyAjax, 3000);
</script>


                                <div class="row">
                                <div class="col-lg-6 col-md-offset-3" style="margin-top:100px">
							<img src="resources/img/FoodDelivery.jpg" style="width:100%">
                            </div></div>
							<!-- /.row -->
							<div class="row"><!-- /.col-lg-12 -->
								<div class="row" id="most">
                                 <div class="col-lg-8 col-md-offset-2">
            <div class="col-lg-12">
                <h2 class="page-header">Most Popular Dishes</h2>
                
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
                 <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food1.jpg" alt="">
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='Restaurants';">
                                <h2>Piperi Mediterranean Grill</h2>
                             <p>
                                    Order now to enjoy free food delivery from Piperi Mediterranean Grill
                  </p>
              </div>
                    
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
              <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food2.jpg" alt="">
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='Restaurants';">
                                 <h2>Casa Razdora</h2>
                             <p>
                                    Order now to enjoy free food delivery from Casa Razdora
                  </p>
              </div>
                    
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
              <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food3.jpg" alt="">
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='Restaurants';">
                                <h2>Roast Beast</h2>
                             <p>
                                    Order now to enjoy free food delivery from Roast Beast
                  </p>
              </div>
                    
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
              <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food4.jpg" alt="" >
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='Restaurants';">
                                <h2>Salumeria Italiana</h2>
                             <p>
                                    Order now to enjoy free food delivery from Salumeria Italiana
                  </p>
              </div>
                    
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
              <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food5.jpg" alt="">
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='Restaurants';">
                                <h2>South End Formaggio</h2>
                             <p>
                                    Order now to enjoy free food delivery from South End Formaggio
                  </p>
              </div>
                    
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
              <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food6.jpg" alt="" style="cursor: pointer;" onclick="window.location='Restaurants';">
                <div class="image-overlay">
                                <h2>Carlo’s Cucina Italiana</h2>
                             <p>
                                    Order now to enjoy free food delivery from Carlo’s Cucina Italiana
                  </p>
              </div>
                    
            </div>
        </div>
        </div>
        <!-- /.row -->
        
        <div class="container-fluid" id="quick">
         <div class="row">
                                 <div class="col-lg-8 col-md-offset-2">
            <div class="col-lg-12">
                <h2 class="page-header">Restaurants Near You</h2>
            </div>
            
           <div class="panel-body">
			 <div id="map" style="height: 550px;"></div>
								   </div>
										<!-- /.panel-body -->
		   </div>
            
            
            
           </div>
        </div>
        </div>
        <div class="container-fluid" id="top">
                                <div class="row">
								<div class="col-md-8 col-md-offset-2">
									<div class="panel panel-success">
										<div class="panel-heading">Top Restaurants in the Area</div>
										<!-- /.panel-heading -->
										<div class="panel-body">
											<div id="best10" >
												<table class="table table-striped">
													<thead>
														<tr>
															
															
															<th width="15%">Picture</th>
															<th width="45%">Name</th>
                                                            <th width="15%">Cuisine</th>
                                                            <th width="15%">Rating</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${restaurants}" var="restaurant">
														<tr>
															
															
															<td><c:if test="${fn:length(restaurant.coverPhoto) > 0}">
			    					<img src="restaurantes/${restaurant.id}/photo" onload="resize(this, 80, 50);"/>
			    				</c:if></td>
															<td><a href="login">${restaurant.name}</a></td>
                                                            <td>${restaurant.restaurantType}</td>
   <td>${restaurant.avgRating}</td>
														</tr>
													  </c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										<!-- /.panel-body -->
									</div>
                                    </div>
                                    </div>
									<!-- /.panel -->
								</div>
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
                            <script src="resources/js/metro.js"></script>
						</body>
						</html>
						