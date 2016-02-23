<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Home Page</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link type="text/css" href="resources/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link type="text/css" href="resources/css/sb-admin.css" rel="stylesheet">
<link href="resources/css/modern-business.css" rel="stylesheet">
<link href="resources/css/metro.css" rel="stylesheet">
<link href="resources/css/agency.css" rel="stylesheet">
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
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
	
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
				<a class="navbar-brand" href="login">BostonToGo v2.0</a>
			</div>
			<!-- /.navbar-header -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-top-links navbar-right">
				<!-- /.dropdown -->
                <li class="dropdown">
                    <a href="#"><i class="fa fa-upload fa-fw"></i> Top</a></li>
                <li class="dropdown">
                    <a href="#most"><i class="fa fa-bolt fa-fw"></i> Dishes</a></li>
				<li class="dropdown">
                    <a href="#quick"><i class="fa fa-map-marker fa-fw"></i> Map</a>
                </li>
                <li class="dropdown">
                    <a href="#steps"><i class="fa fa-money fa-fw"></i> Steps</a>
                </li>
                
                <li class="dropdown">
                    <a href="#team"><i class="fa fa-comment fa-fw"></i> Team</a>
                </li>
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
</div>
							
							<!-- /.navbar-static-side -->
								</nav>
                                </div>
							
							<div class="row">
                            <div class="col-md-8 col-md-offset-2">
                            <div class="cell">
                        <h5>.carousel & .square-markers</h5>
                        <div class="carousel square-bullets" data-height="360" data-role="carousel" data-direction="right">
                        <div class="slide"><img src="resources/img/FoodDelivery.jpg" data-role="fitImage" data-format="fill"></div>
                            <div class="slide"><img src="resources/img/1.jpg" data-role="fitImage" data-format="fill"></div>
                            <div class="slide"><img src="resources/img/2.jpg" data-role="fitImage" data-format="fill"></div>
                            <div class="slide"><img src="resources/img/3.jpg" data-role="fitImage" data-format="fill"></div>
                           
                        </div>
                    </div>
                </div>
                            </div>
								<!--<div class="col-lg-12">
									<center><h1 class="page-header" style="color:#C9F">Order Your Own Food</h1></center>
                                   
								</div>
								
							</div>
							
                            <div class="row" >
								<div class="col-md-6 col-md-offset-3 image-container">
                                
                            
                            <div class=""><img src="resources/img/FoodDelivery.jpg" style="height:auto"></div>
                            <div class="image-overlay">
                                <h2>Login now to enjoy food delivery</h2>
                             <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                </p>
                        </div>
                    </div>
                                 
                                </div>
                                </div>
                                <hr>-->
                                
                                 <div class="row" id="most">
                                 <div class="col-lg-8 col-md-offset-2">
            <div class="col-lg-12">
                <h2 class="page-header">Most Popular Dishes</h2>
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
                 <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food3.jpg" alt="">
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='login';">
                                <h2>Piperi Mediterranean Grill</h2>
                             <p>
                                    Login now to enjoy free food delivery from Piperi Mediterranean Grill
                  </p>
                        </div>
                    
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
              <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food2.jpg" alt="">
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='login';">
                                 <h2>Casa Razdora</h2>
                             <p>
                                    Login now to enjoy free food delivery from Casa Razdora
                  </p>
              </div>
                    
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
              <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food3.jpg" alt="">
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='login';">
                                <h2>Roast Beast</h2>
                             <p>
                                    Login now to enjoy free food delivery from Roast Beast
                  </p>
              </div>
                    
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
              <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food4.jpg" alt="">
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='login';">
                                <h2>Salumeria Italiana</h2>
                             <p>
                                    Login now to enjoy free food delivery from Salumeria Italiana
                  </p>
              </div>
                    
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
              <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food5.jpg" alt="">
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='login';">
                                <h2>South End Formaggio</h2>
                             <p>
                                    Login now to enjoy free food delivery from South End Formaggio
                  </p>
              </div>
                    
            </div>
            <div class="col-md-4 col-sm-6 image-container">
                
              <img style="width:100%; height:auto" class="img-responsive img-portfolio img-hover" src="resources/img/food6.jpg" alt="">
                <div class="image-overlay" style="cursor: pointer;" onclick="window.location='login';">
                                <h2>Carlo’s Cucina Italiana</h2>
                             <p>
                                    Login now to enjoy free food delivery from Carlo’s Cucina Italiana
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


        <!-- Marketing Icons Section -->
        <div class="row" id="steps">
            <div class="col-lg-8 col-xs-offset-2">
                <h1 class="page-header">
                    Steps to Order Food from BostonToGo
                </h1>
            
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Search the Restaurant</h4>
                    </div>
                    <div class="panel-body">
                        <p>Search by cuisine, restaurant name or menu item.  We'll filter your results accordingly. When you find what you're looking for, you can place your order online or by phone, free of charge. </p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> Order the Food</h4>
                    </div>
                    <div class="panel-body">
                        <p> Oh, and we also give you access to reviews, coupons, special deals and a 24/7 customer care team that tracks each order and makes sure you get exactly what you want.</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i> Track the Deilivery and Eat</h4>
                    </div>
                    <div class="panel-body">
                        <p>All the deilivery are tracked by our system and can be checked online. User will be able to check the information of the delivery updated by the restaurant real-time.</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
        </div>   
        </div>     




<div class="row" id="video">
                                 <div class="col-lg-8 col-md-offset-2">
            <div class="col-lg-12">
                <h2 class="page-header">Instructions to Order Food online</h2>
            </div>
            
           <div class="panel-body embed-responsive embed-responsive-16by9">
            <center><iframe width="940" height="600" src="https://www.youtube.com/embed/gFyZ2SIfKlw" frameborder="0" allowfullscreen></iframe></center> <!--
<iframe  src="//www.youtube.com/embed/gFyZ2SIfKlw?rel=0&showinfo=0" frameborder="0" allowfullscreen></iframe>-->

<p>
Video courtesy of 
<a href="" target="_blank">BostonToGo.com</a>.
</p>
								   </div>
										<!-- /.panel-body -->
  </div>
            
            
            
           
</div>
        
        
        

                                
                                <div class="container-fluid">
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

 <!-- Team Section -->
    <section id="team" class="bg-light-gray">
        <div class="container" id="team">
            <div class="row">
                <div class="col-lg-12 ">
                    <h2 class="section-heading">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">Be part of the success</h3>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="resources/img/team/1.jpg" class="img-responsive img-circle" alt="">
                        <h4>Shiyu Long</h4>
                        <p class="text-muted">Lead Designer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="resources/img/team/2.jpg" class="img-responsive img-circle" alt="">
                        <h4>Shiyu Long</h4>
                        <p class="text-muted">Lead Marketer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="resources/img/team/3.jpg" class="img-responsive img-circle" alt="">
                        <h4>Shiyu Long</h4>
                        <p class="text-muted">Lead Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">Join my team right now, we need your help. Please send your resume to bostontogo@gmail.com, let's paint our future together!.</p>
                </div>
            </div>
        </div>
    </section>                                
                                
                                 
                             <div class="container">   
                               <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p style="color:#F03">BostonToGo helps you find and order food from wherever you are. How it works: you type in an address, we tell you the restaurants that deliver to that locale as well as showing you droves of pickup restaurants near you. </p>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-lg btn-default btn-block" href="login">Action Now</a>
                </div>
            </div>
        </div>
        </div>
     
								<!-- /.col-lg-12 -->
								<!-- /.col-lg-6 -->
							  
								<!-- /.col-lg-6 -->
								<!-- /.col-lg-6 -->
							  
								<!-- /.col-lg-6 -->
								<!-- /.col-lg-6 -->
							
							<!-- /.row -->
								
								<!-- /#page-wrapper -->

							
<!-- /#wrapper -->
<footer class="text-center navbar navbar-bottom" style="background-color: #CCC">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>Designer</h3>
                        <p>Shiyu Long</p>
                        <p>Northeastern University</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Share the website</h3>
                        <a class="btn btn-social-icon btn-bitbucket"><i class="fa fa-bitbucket"></i></a>
                                <a class="btn btn-social-icon btn-dropbox"><i class="fa fa-dropbox"></i></a>
                                <a class="btn btn-social-icon btn-facebook"><i class="fa fa-facebook"></i></a>
                                <a class="btn btn-social-icon btn-flickr"><i class="fa fa-flickr"></i></a>
                                <a class="btn btn-social-icon btn-github"><i class="fa fa-github"></i></a>
                                <a class="btn btn-social-icon btn-google-plus"><i class="fa fa-google-plus"></i></a>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>About BostonToGo</h3>
                        <p>BostonToGo is designed and implemented by Shiyu Long using HTML5, Bootstrap, AJAX, jQuery plugins like GeoLocation, LazyLoad, AnimateHeader and jQuery-UI</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; BostonToGo 2015
                    </div>
                </div>
            </div>
        </div>
</footer>
<!-- Core Scripts - Include with every page -->
                          
                           
<script src="resources/js/jquery-1.10.2.js"></script>
<script src="resources/js/jquery.js"></script>
                             
                             
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
<script src="resources/js/metro.js"></script>

							<!-- Page-Level Demo Scripts - Flot - Use for reference -->
							<script src="resources/js/demo/flot-demo.js"></script>
                           <!-- <script src="resources/js/jquery-2.1.3.min.js"></script> -->
                           <script>
$('a').click(function(){
    $('html, body').animate({
        scrollTop: $( $(this).attr('href') ).offset().top
    }, 500);
    return false;
});
</script>
                            
</body>
						</html>
						