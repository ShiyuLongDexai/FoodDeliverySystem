<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%
	HttpSession mySession = request.getSession();
%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Start Bootstrap - SB Admin Version 2.0 Demo</title>

<!-- Core CSS - Include with every page -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.css"
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
								
										<li><a href="login"><i
												class="fa fa-sign-out fa-fw"></i> Login</a></li>
												
												  
												   
									</ul> <!-- /.dropdown-user --></li>
								<!-- /.dropdown -->
							</ul>
							<!-- /.navbar-top-links --><!-- /.navbar-static-side -->
								</nav>
                                </div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						${notValidUser}
						<form id="loginForm" role="form" action="home" method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="E-mail" name="email"
										type="email" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="password" type="password" value="">
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="Remember Me">Remember Me
									</label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
                                <div class="row"><center><div class="col-lg-12">
								<input name="Submit" class="btn btn-success btn-block"
									type="submit" value="Login"></div>



							</fieldset>
						</form>
						</br>
						<center>
                        <div class="row"><div class="col-lg-12">
                        
							<a href="CustomerRegister" style="width: 47%" class="btn btn-success">
								New User
								</a>
                                
                                <a href="forgetPassword"  style="width: 47%"
								class="btn btn-success">forget password</a></div></div>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Core Scripts - Include with every page -->
	<script src="resources/js/jquery-1.10.2.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

	<!-- SB Admin Scripts - Include with every page -->
	<script src="resources/js/sb-admin.js"></script>
    <script src="resources/js/jquery.validate.min.js"></script>
<script>
$(document).ready(function () {

    $('#loginForm').validate({ // initialize the plugin
        rules: {
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 1
            }
        }
    });

});
</script>
</body>

</html>
