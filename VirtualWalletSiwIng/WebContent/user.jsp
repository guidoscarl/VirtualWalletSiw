<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Utente di Virtual Wallet</title>
	<link rel="stylesheet" href="newCSS/myCSS.css">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="js/loader.js"></script>
</head>
<body class="myBody">
	<nav class="navbar navbar-dark navbar-expand-sm gradient">
		<div class="container">
			<span class="navbar-brand">Virtual Wallet</span>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
        		<span style="color:white;">Naviga nel sito!</span>
        	</button>
			<div class="navbar-collapse" id="navcol-1">
				<ul class="nav navbar-nav">
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="home.jsp">Home</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="logout">Disconnetti</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="en/account.jsp">Switch to English</a></li>
		        </ul>
			</div>
			<div class="searchBar">
				<input type="text" placeholder="Cerca utenti">
				<button type="submit"><i class="fa fa-search"></i></button>
			</div>
	        <a class="links" href="account.jsp"><%out.print(session.getAttribute("nome")+" "+(session.getAttribute("cognome"))); %>, benvenuto!</a>
		</div>
	</nav>
	<section class="portfolio-block section-border">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 profile-info gradient myBorder">
					<h1>Profilo di</h1>
					<span>Nome:</span>
					<p><%out.print(session.getAttribute("nome")); %></p>
					<span>Cognome:</span>
					<p><%out.print(session.getAttribute("cognome")); %></p>
				</div>
	   	 		<div class="col-sm-9 gradient myBorder">
	       			<a class="btn btn-primary" role="button" href="viewHistory" onclick="activeLoader();">Aggiungi agli amici</a>
	        		<a class="btn btn-primary" role="button" href="transaction.jsp">Effettua transazione</a>
			    </div>
		    </div>
		</div>
		<div class="lds-dual-ring" id="loader" style="visibility:hidden"></div>
	</section>
</body>
</html>