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
		<div class="row gradient">
			<div class="col-md-6 myBorder">
				<p class="section-border" style="color:white; font-size:1.5em;">Effettuate</p>
				<table>
					<tr>
						<th class="col-xs-2 colTableEmpty">DATA</th>
						<th class="col-xs-2 colTableEmpty">NOME DESTINATARIO</th>
						<th class="col-xs-2 colTableEmpty">COGNOME DESTINATARIO</th>
						<th class="col-xs-4 colTableEmpty">E-MAIL DESTINATARIO</th>
						<th class="col-xs-2 colTableEmpty">IMPORTO</th>
					</tr>
					<c:forEach items="${transazioniM}" var="trans" >
						<tr>
							<td class="colTableTransaction myBorder">${trans.data }</td>
							<td class="colTableTransaction myBorder">${trans.nomeDestinatario }</td>
							<td class="colTableTransaction myBorder">${trans.cognomeDestinatario }</td>
							<td class="colTableTransaction myBorder">${trans.email }</td>
							<td class="colTableTransaction myBorder" style="color:red">-${trans.importo}€</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-md-6 myBorder">
				<p class="section-border" style="color:white; font-size:1.5em;">Ricevute</p>
				<table>
					<tr>
						<th class="col-xs-2 colTableEmpty">DATA</th>
						<th class="col-xs-2 colTableEmpty">NOME MITTENTE</th>
						<th class="col-xs-2 colTableEmpty">COGNOME MITTENTE</th>
						<th class="col-xs-4 colTableEmpty">E-MAIL MITTENTE</th>
						<th class="col-xs-2 colTableEmpty">IMPORTO</th>
					</tr>
					<c:forEach items="${transazioniD}" var="trans" >
						<tr>
							<td class="colTableTransaction myBorder">${trans.data }</td>
							<td class="colTableTransaction myBorder">${trans.nomeMittente}</td>
							<td class="colTableTransaction myBorder">${trans.cognomeMittente}</td>
							<td class="colTableTransaction myBorder">${trans.email }</td>
							<td class="colTableTransaction myBorder" style="color:green">+${trans.importo}€</td>
						</tr>
					</c:forEach>
				</table>
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