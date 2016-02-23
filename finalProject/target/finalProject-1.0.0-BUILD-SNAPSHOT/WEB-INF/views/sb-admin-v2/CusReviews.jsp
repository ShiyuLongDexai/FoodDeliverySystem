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
			<div class="row">
				<div class="col-lg-12">

					<h1 class="page-header">${cus.name}'s Reviews</h1>




				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<!-- /.col-lg-12 -->
				<!-- /.col-lg-6 -->
				<!-- /.col-lg-6 -->
				<!-- /.col-lg-6 -->
				<!-- /.col-lg-6 -->
				<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
				<!-- /.col-lg-6 -->
				<div class="col-lg-8">
					<div class="panel panel-info">
						<div class="panel-heading">Reviews</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- /.panel-body -->
							<c:if test="${!empty restaurantReviews}">
								<table class="table table-striped table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											
											<th width="20%">Restaurant</th>
											
											<th width="47%">Review Contents</th>
											<th width="12%" style="text-align:center">Status</th>
										</tr>
									</thead>
									<tbody id="reviewTable">
										<c:forEach items="${restaurantReviews}" var="restaurantReview">

											<tr>

												


												
												<td>${restaurantReview.restaurant.name} <input style="float:left"  id="input-6a" class="rating" data-size="xs" value="${restaurantReview.rating/2}" data-show-clear="false" data-show-caption="true" data-readonly="true"></td>

												
												<td><p>${restaurantReview.content}</br></p>
                                                <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> <fmt:formatDate value='${restaurantReview.date}'
														pattern="yyyy-MM-dd" />
                                            </small>
                                                </td>
												<td style="text-align:center"><form action="CusReviews" method="post">
														<input name='resReviewId' type='hidden'
															value='${restaurantReview.id}'>
														<button type="submit" class="btn btn-default">select</button>
													</form>
													<form action="CusReviews" method="post">
														<input name='deleteId' type='hidden' value='${review.id}'>
														<button type="submit" class="btn btn-default" >delete</button>
                                                        
													</form></td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
					</div>
					<!-- /.panel -->
				</div>
				<div class="col-lg-4">
					<div class="panel panel-warning">
						<div class="panel-heading">Review of ${review.restaurant.name}</div>
						<!-- /.panel-heading -->
						<form action="CusReviews" method="post">
							<div class="panel-body">
								<div id="best">
									<label>Rating: (1-10)</label> </br>
                                    <input  name="rating" id="input-6a" class="rating" data-size="sm" value="${review.rating/2}" data-show-clear="false" data-show-caption="true" data-readonly="false">
									 </br> <label>Review:</label> </br>
									<textarea class="form-control" rows="3" name="reviewContent">${review.content}</textarea>
									<input name='resReviewId' type='hidden' value='${review.id}'></br>
									<button type="submit" class="btn btn-default">Submit</button>
									&nbsp&nbsp&nbsp
									<button type="reset" class="btn btn-default">Reset</button>
						</form>

					</div>
				</div>
				</form>
				<!-- /.panel-body -->
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
<script src="resources/js/test.js" type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>

	<!-- Page-Level Demo Scripts - Flot - Use for reference -->
	<!-- <script src="resources/js/demo/flot-demo.js"></script> -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable({
				"scrollY":  "600px",
        "scrollCollapse": true,
			});
		});
		$(document).ready(function() {
			$('#dataTables-example2').dataTable();
		});
	</script>
</body>
</html>
