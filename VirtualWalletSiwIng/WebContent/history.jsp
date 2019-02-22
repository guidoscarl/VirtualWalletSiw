<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo Utente - Storico</title>
	<link rel="stylesheet" href="newCSS/myCSS.css">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
    <script src="js/loader.js"></script>
    <script src="js/contactUs.js"></script>
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
		        </ul>
			</div>
			<a class="links" href="signin"><c:out value="${nome} ${cognome }">No name</c:out>, benvenuto!</a>
			<a href="mailbox.jsp" style="padding-left:1%"><i class="ion ion-email" style="text-size:2rem; color:white"></i></a>
		</div>
		<div class="lds-dual-ring" id="loader"  style="visibility:hidden" ></div>
		
	</nav>
	<section class="portfolio-block section-border">
		<div class="container gradient myBorder">
			<p>Storico transazioni di <c:out value="${nome} ${cognome}">No name</c:out></p>		
		</div>
	</section>
	<section class="portfolio-block">
		<div class="container gradient">
			<div class="row">
				<div class="col-md-6 myBorder">
					<p class="section-border" style="color:white; font-size:1.5em;">Effettuate</p>
					<div class="row" style="padding:10px 10px">
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>DATA</span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>NOME DESTINATARIO</span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>COGNOME DESTINATARIO</span></div>
						<div class="col-md-4 col-lg-4 colTableEmpty"><span>E-MAIL DESTINATARIO</span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>IMPORTO</span></div>
						<c:forEach items="${transazioniM}" var="trans" >
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.data }</span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.nomeDestinatario }</span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.cognomeDestinatario }</span></div>
							<div class="col-md-4 col-lg-4 colTableTransaction myBorder"><span>${trans.email }</span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder" style="color:red">-${trans.importo}€</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-md-6 myBorder">
					<p class="section-border" style="color:white; font-size:1.5em;">Ricevute</p>
					<div class="row" style="padding:10px 10px">
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>DATA</span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>NOME MITTENTE</span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>COGNOME MITTENTE</span></div>
						<div class="col-md-4 col-lg-4 colTableEmpty"><span>E-MAIL MITTENTE</span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>IMPORTO</span></div>
						<c:forEach items="${transazioniD}" var="trans" >
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.data }</span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.nomeMittente}</span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.cognomeMittente}</span></div>
							<div class="col-md-4 col-lg-4 colTableTransaction myBorder"><span>${trans.email }</span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder" style="color:green">+${trans.importo}€</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer class="gradient">
        <div class="container space-padding">
            <div class="links">
            	<a style="cursor:pointer" onclick="contactUs();">Contact us</a>
            </div>
        </div>
    </footer>
	<script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>

</body>
</html>