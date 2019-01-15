<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PROFILO UTENTE</title>
	<link rel="stylesheet" href="newCSS/myCSS.css">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
</head>
<body class="myBody">
	<nav class="navbar navbar-dark navbar-expand-sm fixed-top gradient">
		<div class="container">
			<span class="navbar-brand">Virtual Wallet</span>
			<div class="navbar-collapse" id="navcol-1">
				<ul class="nav navbar-nav">
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="index.html">Home</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="logout">Disconnetti</a></li>
		        </ul>
			</div>
	        <span><%out.print(session.getAttribute("nome")+" "+(session.getAttribute("cognome"))); %>, benvenuto!</span>
		</div>
	</nav>
	<section class="portfolio-block block-intro section-border">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-2 profile-info gradient myBorder">
					<p>Info utente</p>
					<span>Nome:<%out.print(session.getAttribute("nome")); %></span>
					<span>Cognome:<%out.print(session.getAttribute("cognome")); %></span>
					<span>E-mail:<%out.print(session.getAttribute("email")); %></span>
				</div>
	   	 		<div class="col-sm-10 gradient myBorder">
	        		<p>Il tuo conto ammonta a:</p>
	        		<!--"€-:--." -->
	        		<div class="grid amount" style="background-image:url(&quot;Images/grid.png&quot;);">&#8364;<%out.print(session.getAttribute("saldo")); %></div>
	        		<a class="btn btn-primary" role="button" href="storico.html">Visualizza Storico</a>
	        		<a class="btn btn-primary" role="button" href="ricarica.html">Ricarica importo</a>
	    	    	<a class="btn btn-primary" role="button" href="transazione.html">Effettua transazione</a>
		    	</div>
			</div>
		</div>
	</section>
</body>
</html>