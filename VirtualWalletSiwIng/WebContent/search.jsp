<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ricerca di Virtual Wallet</title>
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
				<input type="text" placeholder="Search..">
				<button type="submit"><i class="fa fa-search"></i></button>
			</div>
	        <a class="links" href="account.jsp"><%out.print(session.getAttribute("nome")+" "+(session.getAttribute("cognome"))); %>, benvenuto!</a>
		</div>
	</nav>
	 <section class="portfolio-block">
        <div class="container results">
            <p style="border-bottom: 1px solid; border-color: #d1d1d1; color:black"><strong>Risultati</strong></p>
            <!-- Da inserire con le servlet per la ricerca di utenti -->
            <div style="border-bottom: 1px solid; border-color: #d1d1d1;"><a>first user found</a></div>
            <div style="border-bottom: 1px solid; border-color: #d1d1d1;"><a>second user found</a></div>
            <div style="border-bottom: 1px solid; border-color: #d1d1d1;"><a>another user found</a></div>
        </div>
    </section>
</body>
</html>