<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Res Home Page</title>
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript">
	function resize(element, maxWidth, maxHeight) {
		if (element.width > maxWidth || element.height > maxHeight) {
			if (element.width / element.height > maxWidth / maxHeight) {
				element.width = maxWidth;
			} else {
				element.height = maxHeight;
			}
		}
	}
	
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
    -webkit-transform:scale(2.8); /* Safari and Chrome */
    -moz-transform:scale(2.8); /* Firefox */
    -ms-transform:scale(2.8); /* IE 9 */
    -o-transform:scale(2.8); /* Opera */
     transform:scale(2.8);
}
</style>
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
					username=${username}, role=${role}, CusID=${cus.id},
					Zip=${cus.address.zipcode}</a>
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
						<li><a href="CusProfile"><i class="fa fa-user fa-fw"></i>
								User Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<%
							HttpSession mySession = request.getSession();
							String username = (String) mySession.getAttribute("username");

							if (username == null) {
						%>
						<li><a href="login"><i class="fa fa-sign-out fa-fw"></i>
								Login</a></li>
						<%
							} else {
						%>
						<li><a href="home"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
						<%
							}
						%>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default navbar-static-side" role="navigation">
				<div class="sidebar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<form action="ResSearch" method="get">
								<div class="input-group custom-search-form">
									<input type="text" class="form-control" placeholder="Search..."
										name="searchName"> <span class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</span>
								</div>
								<!-- /input-group -->
							</form>
						</li>
						<li><a href="Restaurants"><i
								class="fa fa-dashboard fa-fw"></i> Show Restaurants</a></li>
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
						<li><a href="#"><i class="fa fa-wrench fa-fw"></i>Customer
								Account <span class="fa arrow"></span></a>
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
			
			  <div class="col-lg-12">
			    
			  
			        
			          <!--  <div class="col-lg-3">
						<h1>
							<c:if test="${fn:length(res.coverPhoto)> 0}">
								<img src="restaurantes/${res.id}/photo"
									onload="resize(this, 80, 50);" />
							</c:if>
							${res.name}
						</h1>
					</div>
					<div class="col-lg-4">
						<h5>${res.restaurantType}Food</h5>
						<h5>${res.avgRating}points in ${res.reviewsNo} reviews</h5>
						<h5>${res.address.street},${res.address.city},
							${res.address.state}, ${res.address.zipcode}</h5>

					</div>
					<div class="col-lg-5">
						<h6>&nbsp</h6>
						<h5>Delivery zipcode:</h5>
						<h5>${res.deliverZipcode}</h5>
					</div>
					</br> </br> </br>
					<hr />-->
			          <table class="table" width="70%" border="0" style="border-collapse: collapse">
			            <thead>
			              <tr>
			                <th width="10%" rowspan="3"><c:if
										test="${fn:length(res.coverPhoto)> 0}"> <img src="restaurantes/${res.id}/photo"
											onload="resize(this, 200, 140);" /> </c:if></th>
			                <td ><font color="#CC0000"  face="Courier New, Courier, monospace" size="+3">${res.name} </font><font style="vertical-align:bottom">${res.restaurantType} Cuisine</font>
			                  </td></tr><tr>
			                <td style="border-top:none"><input style="float:left" id="input-6a" class="rating" data-size="xs" value="${res.avgRating/2}" data-show-clear="false" data-show-caption="true" data-readonly="true">  <div style="float:left">on ${res.reviewsNo} Reviews</div>
			                  </td></tr>
                                <tr> <th style="border-top:none"><h5><strong>Address: </strong>${res.address.street}, ${res.address.city}, ${res.address.state}, ${res.address.zipcode}</h5>
		                    </th>  
		                    </th>
		                  </tr>
		                </thead>
		              </table>
		            
			     
			  </div>
			  <!-- /.col-lg-12 -->
			
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-primary">
						<div class="panel-heading">
							Menu 
                            <div class="btn-group pull-right">
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-chevron-down"></i>
                                </button>
                                <ul class="dropdown-menu slidedown">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-refresh fa-fw"></i> Refresh
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-check-circle fa-fw"></i> Available
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-times fa-fw"></i> Busy
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-clock-o fa-fw"></i> Away
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-sign-out fa-fw"></i> Sign Out
                                        </a>
                                    </li>
                                </ul>
                          </div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body" id="div1">
							<!-- /.panel-body -->
							<c:if test="${!empty menu}">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>

												<th width="7%">photo</th>
												<th width="14%">Dish</th>
												<th width="10%">Type</th>
												
												<th width="14%">Price</th>
												<th width="5%">Qty</th>
												<th width="13%"></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${menu}" var="dish">
												
												<tr class="gradeA">

<form method="post" action="ResMenu" name="theform">
													<td rowspan="2"><c:if test="${fn:length(dish.coverPhoto)> 0}">
															<div class="thumbnail1">
    <div class="image1"><img src="dishes/${dish.id}/photo"
																onload="resize(this, 85, 58);" /></div></div>
														</c:if></td>
													<td><font face="verdana" color="green">${dish.name}</font><input name='dishId' type='hidden'
														value='${dish.id}'> <input name='resId'
														type='hidden' value='${resId}'>
													</td>
													<td>${dish.category}</td>
													
													<td>$${dish.price}</td>
													<td rowspan="2" valign="middle">
                                                        <select id='${dish.id}qty' class="input-sm orderQty" placeholder="Month"
										class="form-control" name="orderItemQty">
										<option selected value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										

							  </select>
													</td>
													<td rowspan="2" valign="middle" style="text-align:center"><input class="btn btn-default" type="button" value="Order" onclick="doAjaxPost(this.id)" id='${dish.id}'></td>
</form>
												</tr>
                                                <tr><td colspan="3" style="border-top:none"><Strong>Description:</Strong> ${dish.disc}</td></tr>
												
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:if>
						</div>
					</div>
					<!-- /.panel -->
				</div>
				<div class="col-lg-4">
					<div class="panel panel-info">
						<div class="panel-heading">Order Detail</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<c:if test="${!empty ois}">
								<table width="104%" class="table table-hover">
									<thead>
										<tr>
											<th width="20%">Name</th>
											<th width="5%">Type</th>
											<th width="5%">Qty</th>
                                            <th width="10%">Total </th>
										</tr>
									</thead>
									<tbody id="p_scents">
                                    <c:if test="${fn:length(ois)> 0}">
										<c:forEach items="${ois}" var="orderItem">
											<tr>

												<td>${orderItem.dish.name}</td>
												<td>${orderItem.dish.category}</td>
												<td>${orderItem.quantity}</td>
                                                <td>
                                                $${orderItem.quantity*orderItem.dish.price}
                                                </td>

											</tr>
										</c:forEach>
                                        </c:if>
									</tbody>
								</table>
							</c:if>
						</div>
						<!-- /.panel-body -->
<hr color="#0066FF">
						<p align="right" class="text-primary">Total Price:
							$${totalPrice} &nbsp&nbsp</p>
						<center>
							<a class="btn btn-default" href="Checkout">Proceed to
								Checkout</a>
						</center>

						</br>
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
				<!-- /.col-lg-6 -->
				<!-- /.col-lg-6 -->
				<!-- /.col-lg-6 -->
				<!-- /.col-lg-6 -->
				<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
                
                <div class="col-lg-8">
<div class="chat-panel panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i>
                            Comment
                           <div class="btn-group pull-right">
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-chevron-down"></i>
                                </button>
                                <ul class="dropdown-menu slidedown">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-refresh fa-fw"></i> Refresh
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-check-circle fa-fw"></i> Available
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-times fa-fw"></i> Busy
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-clock-o fa-fw"></i> Away
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-sign-out fa-fw"></i> Sign Out
                                        </a>
                                    </li>
                                </ul>
                          </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <c:if test="${!empty restaurantReviews}">
                            <ul class="chat" id="chatul">
                            <c:forEach items="${restaurantReviews}" var="restaurantReview">
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                    <script type="text/javascript">
var images = [], 
index = 0;

images[0] = "<img class='img-circle' src='resources/img/user/1.jpg' alt='Visit Computer Hope'>";
images[1] = "<img class='img-circle' src='resources/img/user/2.jpg' alt='Computer History'>";
images[2] = "<img class='img-circle' src='resources/img/user/3.jpg' alt='Visit Computer Hope'>";

index = Math.floor(Math.random() * images.length);
document.write(images[index]);
//done
</script>
                                
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                           <div class="list-inline"> <strong style="float:left" class="primary-font">${restaurantReview.customer.name} &nbsp;&nbsp;&nbsp;</strong><input style="float:left"  id="input-6a" class="rating" data-size="xs" value="${restaurantReview.rating/2}" data-show-clear="false" data-show-caption="true" data-readonly="true"> 
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> <fmt:formatDate value='${restaurantReview.date}'
														pattern="yyyy-MM-dd" />
                                            </small></div>
                                        </div>
                                        <p>
                                            ${restaurantReview.content} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur
                                        </p>
                                    </div>
                                </li>
                              </c:forEach>       
                            </ul></c:if>
                        </div>
                        <!-- /.panel-body -->
  <div class="panel-footer">
                        <form action action="ResMenu" method="post" class="form-inline"><input name='resId' type='hidden' value='${resId}'>
                            <div class="input-group">
                            <div class="col-xs-2">
                            <label for="exampleInputName2">rating:&nbsp;&nbsp;</label><select id="ratingInput" class="input-sm" placeholder="Month"
										class="form-control" name="rating">
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option selected value="10">10</option>

							  </select></div>
                              <div class="col-xs-9">
                                <input id="btn-input" name="reviewContent" type="text" class="form-control input-sm" placeholder="Type your message here..." /></div>
                                <div class="col-xs-1">
                                <span class="input-group-btn">
                                <input class="btn btn-warning btn-sm" type="button" value="send" onclick="doAjaxPostSendReview(this.id)" id='${resId}'>
                                </span>
                            </div>
				</div></form>
  </div>
  <!-- /#page-wrapper -->

	
<!-- /.col-lg-6 --></div>
<!-- /.col-lg-12 -->
             <!--   <div class="col-lg-8">
					<div class="panel panel-warning">
						<div class="panel-heading">Reviews</div>
						
						<div class="panel-body">
							
							<c:if test="${!empty restaurantReviews}">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example2">
									<thead>
										<tr>
											<th width="5%">#</th>
											<th width="15%">Date</th>
											<th width="15%">User</th>
											<th width="15%">Rating</th>
											<th width="40%">Review Contents</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${restaurantReviews}" var="restaurantReview">
											<tr>

												<td>${restaurantReview.id}</td>

												<td><fmt:formatDate value='${restaurantReview.date}'
														pattern="yyyy-MM-dd" /></td>
												<td>${restaurantReview.customer.name}</td>
												<td>${restaurantReview.rating}</td>
												<td>${restaurantReview.content}</td>

											</tr>

										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
					</div>
					
				</div>
				
			</div> -->
            <!-- /.panel -->
                    
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
    <script src="resources/js/test.js" type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>


	<!-- Page-Level Demo Scripts - Flot - Use for reference -->
	<!-- <script src="resources/js/demo/flot-demo.js"></script> -->
	<script>
	$(document).ready(function() {
    var dataTable = $('#dataTables-example').dataTable({
         sScrollX: "100%", 
		 "autoWidth": false,
		 "scrollCollapse": true,
         aoColumns : [
          { "sWidth": "13%"},
          { "sWidth": "15%"},
          { "sWidth": "44%"},
          { "sWidth": "17%"},
          { "sWidth": "9%"}
        ]
    });
    
});
		
		$(document).ready(function() {
			$('#dataTables-example2').dataTable({
         sScrollX: "100%",
         aoColumns : [
          { "sWidth": "100px"},
          { "sWidth": "100px"},
          { "sWidth": "100px"},
          { "sWidth": "100px"},
          { "sWidth": "100px"}
        ]
    });
		});
	</script>
	<script>
		$(document).ready(function() {
			$("#uuu111").click(function() {
				$("#div1").fadeToggle();
			});
		});
		$(document).ready(function() {
			$("#uuu112").click(function() {
				$("#div2").fadeToggle();
			});
		});
	</script>

</body>
</html>
