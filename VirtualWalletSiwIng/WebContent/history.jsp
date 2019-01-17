<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Storico</title>
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
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="index.jsp">Home</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="logout">Disconnetti</a></li>
		        </ul>
			</div>
	        <span>"nome", benvenuto!</span>
		</div>
	</nav>
	<section class="portfolio-block section-border">
		<div class="container gradient myBorder">
			<p>Storico transazioni di "nome" - "cognome"</p>		
		</div>
	</section>
	<section class="portfolio-block">
		<div class="col-sm-12 gradient">
			<div class="row">
				<div class="col-md-6 myBorder">
					<p class="section-border" style="color:white; text-align:left; font-size:1.5em;">Effettuate</p>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-2 colTableEmpty">DATA</div>
							<div class="col-sm-2 colTableEmpty">NOME DESTINATARIO</div>
							<div class="col-sm-2 colTableEmpty">COGNOME DESTINATARIO</div>
							<div class="col-sm-4 colTableEmpty">E-MAIL DESTINATARIO</div>
							<div class="col-sm-2 colTableEmpty">IMPORTO</div>
							<div class="col-sm-2 colTableTransaction myBorder">data</div>
							<div class="col-sm-2 colTableTransaction myBorder">nome</div>
							<div class="col-sm-2 colTableTransaction myBorder">cognome</div>
							<div class="col-sm-4 colTableTransaction myBorder">email@email.com</div>
							<div class="col-sm-2 colTableTransaction myBorder" style="color:red">amount</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 myBorder">
					<p class="section-border" style="color:white; text-align:left; font-size:1.5em;">Ricevute</p>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-2 colTableEmpty">DATA</div>
							<div class="col-sm-2 colTableEmpty">NOME MITTENTE</div>
							<div class="col-sm-2 colTableEmpty">COGNOME MITTENTE</div>
							<div class="col-sm-4 colTableEmpty">E-MAIL MITTENTE</div>
							<div class="col-sm-2 colTableEmpty">IMPORTO</div>
							<div class="col-sm-2 colTableTransaction myBorder">data</div>
							<div class="col-sm-2 colTableTransaction myBorder">nome</div>
							<div class="col-sm-2 colTableTransaction myBorder">cognome</div>
							<div class="col-sm-4 colTableTransaction myBorder">email@email.com</div>
							<div class="col-sm-2 colTableTransaction myBorder" style="color:green;">amount</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</section>

</body>
</html>