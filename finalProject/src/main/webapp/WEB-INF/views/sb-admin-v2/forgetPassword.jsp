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

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">forget password</h3>
					</div>
					<div class="panel-body">
						<p>${notValidUser} </p>
						<lable>Please Enter Your Email:
						<form role="form" action="login" method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="E-mail" name="forget"
										type="email" autofocus>
								</div>
								<div class="form-group"></div>
								
							  <!-- Change this to a button or input when using this as a form -->
								<input name="Submit" class="btn btn-lg btn-success btn-block"
									type="submit" value="Submit">



							</fieldset>
						</form>
						</br>
						
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

</body>

</html>
