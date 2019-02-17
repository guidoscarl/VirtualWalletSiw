<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo Utente</title>
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
					<h1>Info utente</h1>
					<span>Nome:</span>
					<p><%out.print(session.getAttribute("nome")); %></p>
					<span>Cognome:</span>
					<p><%out.print(session.getAttribute("cognome")); %></p>
					<span>E-mail:</span>
					<p style="font-size:1.00vw;"><%out.print(session.getAttribute("email")); %></p>
				</div>
	   	 		<div class="col-sm-9 gradient myBorder">
        			<p>Il tuo conto ammonta a:</p>
		       		<div class="amount">&#8364;<%out.print(session.getAttribute("saldo")); %></div>
	       			<a class="btn btn-primary" role="button" href="viewHistory" onclick="activeLoader();">Visualizza Storico</a>
	       			<a class="btn btn-primary" role="button" href="recharge.jsp">Ricarica importo</a>
	        		<a class="btn btn-primary" role="button" href="transaction.jsp">Effettua transazione</a>
			    </div>
		    </div>
		</div>
		<div class="lds-dual-ring" id="loader" style="visibility:hidden"></div>
	</section>
	<section class="portfolio-block section-border">
		<p>Il tuo social network</p>
		<div class="container">
			<div class="row">
				<div class="friendList">
					<p style="color:black"><strong>Amici</strong></p>
					<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;"><a>first friend</a></div>
            		<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;"><a>second friend</a></div>
            		<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;"><a>another friend</a></div>
				</div>
				<div class="friendList">
					<p style="color:black"><strong>Ricevute</strong></p>
					<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;">
						<a>first friend</a>
						<button class="friendButton" style="background-image:url(&quot;Images/accept.png&quot;);"></button>
						<button class="friendButton" style="background-image:url(&quot;Images/deny.png&quot;);"></button>
					</div>
					<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;">
						<a>second friend</a>
						<button class="friendButton" style="background-image:url(&quot;Images/accept.png&quot;);"></button>
						<button class="friendButton" style="background-image:url(&quot;Images/deny.png&quot;);"></button>
					</div>
					<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;">
						<a>another friend</a>
						<button class="friendButton" style="background-image:url(&quot;Images/accept.png&quot;);"></button>
						<button class="friendButton" style="background-image:url(&quot;Images/deny.png&quot;);"></button>
					</div>
				</div>
				<div class="friendList">
					<p style="color:black"><strong>Inviate</strong></p>
					<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;"><a>first friend</a></div>
            		<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;"><a>second friend</a></div>
            		<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;"><a>another friend</a></div>
				</div>
			</div>
		</div>
	</section>
	<script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
	
</body>
</html>