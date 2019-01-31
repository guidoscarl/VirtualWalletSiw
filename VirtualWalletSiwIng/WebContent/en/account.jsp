<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
	<link rel="stylesheet" href="../newCSS/myCSS.css">
    <link rel="stylesheet" href="../bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="../bootstrap-4.1.0-dist/fonts/ionicons.min.css">
    <script src="../js/loader.js"></script>
    
</head>
<body class="myBody">
	<nav class="navbar navbar-dark navbar-expand-sm fixed-top gradient">
		<div class="container">
			<span class="navbar-brand">Virtual Wallet</span>
			<div class="navbar-collapse" id="navcol-1">
				<ul class="nav navbar-nav">
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="home.jsp">Home</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="../logout">Logout</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="../account.jsp">Cambia in italiano</a></li>
		        </ul>
			</div>
	        <a class="links" href="account.jsp"><%out.print(session.getAttribute("nome")+" "+(session.getAttribute("cognome"))); %>, welcome!</a>
		</div>
	</nav>
	<section class="portfolio-block section-border">
		<div class="row">
			<div class="col-sm-3 profile-info gradient myBorder">
				<h1>User info</h1>
				<span>Name:</span>
				<p><%out.print(session.getAttribute("nome")); %></p>
				<span>Surname:</span>
				<p><%out.print(session.getAttribute("cognome")); %></p>
				<span>E-mail:</span>
				<p style="font-size:1.00vw;"><%out.print(session.getAttribute("email")); %></p>
			</div>
	   	 	<div class="col-sm-9 gradient myBorder">
        		<p>Your bill amount to:</p>
	       		<!--"€-:--." -->
	       		<div class="grid amount" style="background-image:url(&quot;../Images/grid.png&quot;);">&#8364;<%out.print(session.getAttribute("saldo")); %></div>
	       		<a class="btn btn-primary" role="button" href="viewHistory">Show history</a>
	       		<a class="btn btn-primary" role="button" href="recharge.jsp">Make recharge</a>
	        	<a class="btn btn-primary" role="button" href="transaction.jsp">Make transaction</a>
		    </div>
		</div>
				<div class="lds-dual-ring" id="loader" style="visibility:hidden"></div>
		
	</section>
	<script src="../bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="../bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
</body>
</html>