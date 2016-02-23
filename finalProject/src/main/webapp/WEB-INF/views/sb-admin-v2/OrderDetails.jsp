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
					<h1 class="page-header">Order Details</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-info">
						<div class="panel-heading">Dishes List</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- /.panel-body -->
							<c:if test="${!empty ois}">
                            <div class="table-responsive">
								<table width="104%" class="table table-hover">
									<thead>
										<tr>
											
										<th width="7%">photo</th>
												<th width="14%">Dish</th>
												<th width="10%">Type</th>
												<th width="14%">Price</th>
												<th width="5%" valign="middle">Qty</th>
												<th width="13%"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ois}" var="orderItem">
											<tr>
												<form method="post" action="OrderDetails">
													
													<td rowspan="2"><c:if test="${fn:length(orderItem.dish.coverPhoto)> 0}">
															<div class="thumbnail1">
    <div class="image1"><img src="dishes/${orderItem.dish.id}/photo"
																onload="resize(this, 85, 58);" /></div></div>
														</c:if></td>
													<td><font face="verdana" color="green">${orderItem.dish.name}</font><input name='dishId' type='hidden'
														value='${orderItem.dish.id}'> <input name='resId'
														type='hidden' value='${resId}'>
													</td>
													<td>${orderItem.dish.category}</td>
													
													<td>$${orderItem.dish.price}</td>
													<td rowspan="2" valign="middle">
                                                    <select id='${orderItem.dish.id}qty' class="input-sm orderQty" placeholder="Month"
										class="form-control" name="orderItemQty">
                                        <option value="0">0</option>
										<option value="1" ${orderItem.quantity == '1' ? 'selected' : ''}>1</option>
										<option value="2" ${orderItem.quantity == '2' ? 'selected' : ''}>2</option>
                                        <option value="3" ${orderItem.quantity == '3' ? 'selected' : ''}>3</option>
                                        <option value="4" ${orderItem.quantity == '4' ? 'selected' : ''}>4</option>
                                        <option value="5" ${orderItem.quantity == '5' ? 'selected' : ''}>5</option>
										

							  </select>
														</td>
													<td rowspan="2" valign="middle" style="text-align:center"><input type='submit' class="btn btn-default"
														value='Update' /></td>
												</form>
											</tr>
                                            <tr><td colspan="3" style="border-top:none"><Strong>Description:</Strong> ${orderItem.dish.disc}</td></tr>

										</c:forEach>
									</tbody>
								</table>
                                </div>
							</c:if>
						</div>
                        <p align="right" class="text-primary">Total Price: ${totalPrice} &nbsp&nbsp</p>
					</div>
					<!-- /.panel -->
                    <center><a class="btn btn-default" href="Checkout">Proceed to Checkout</a></center>
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
	<script src="resources/js/plugins/flot/jquery.flot.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.pie.js"></script>

	<!-- SB Admin Scripts - Include with every page -->
	<script src="resources/js/sb-admin.js"></script>

	<!-- Page-Level Demo Scripts - Flot - Use for reference -->
	<script src="resources/js/demo/flot-demo.js"></script>
    
</body>
</html>
