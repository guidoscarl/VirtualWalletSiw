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
	<script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico">
    
    <script src="js/loader.js"></script>
    <script src="js/search.js"></script>
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
			<div class="searchBar">
				<input id="myInput" type="text" placeholder="Cerca utenti" oninput="search();">
			</div>
			<a class="links" href="signin"><c:out value="${nome} ${cognome }">No name</c:out>, benvenuto!</a>
			<a href="mailBox" class="mailIcon"><i class="ion ion-email"></i></a>
	        <c:if test="${haveMes!=null }">
				<img src="Images/notific.png" alt="notific" height="13" width="13">
			</c:if>
		</div>
		<div class="lds-dual-ring" id="loader"  style="visibility:hidden" ></div>
	</nav>
	<ul class="list-group" id="myList"></ul>
	<section class="portfolio-block section-border">
		<div class="container gradient myBorder">
			<p>Storico transazioni di <c:out value="${nome} ${cognome}">No name</c:out></p>		
		</div>
	</section>
	<section class="portfolio-block">
		<div class="container gradient">
			<div class="row">
				<div class="col-md-6 myBorder">
					<p class="section-border">Effettuate</p>
					<div class="row historySpacer" >
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>DATA</span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>NOME </span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>COGNOME </span></div>
						<div class="col-md-4 col-lg-4 colTableEmpty"><span>E-MAIL </span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>IMPORTO</span></div>
						<c:forEach items="${transazioniM}" var="trans" >
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.data }</span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.nomeDestinatario }</span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.cognomeDestinatario }</span></div>
							<div class="col-md-4 col-lg-4 colTableTransaction myBorder"><span><a href="viewProfile?email=${trans.email }">${trans.email }</a></span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder" style="color:red">-${trans.importo}€</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-md-6 myBorder">
					<p class="section-border">Ricevute</p>
					<div class="row historySpacer">
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>DATA</span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>NOME </span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>COGNOME </span></div>
						<div class="col-md-4 col-lg-4 colTableEmpty"><span>E-MAIL </span></div>
						<div class="col-md-2 col-lg-2 colTableEmpty"><span>IMPORTO</span></div>
						<c:forEach items="${transazioniD}" var="trans" >
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.data }</span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.nomeMittente}</span></div>
							<div class="col-md-2 col-lg-2 colTableTransaction myBorder"><span>${trans.cognomeMittente}</span></div>
							<div class="col-md-4 col-lg-4 colTableTransaction myBorder"><span><a href="viewProfile?email=${trans.email }">${trans.email }</a></span></div>
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
            	<a onclick="contactUs();">Contact us</a>
            </div>
        </div>
    </footer>
	

</body>
</html>