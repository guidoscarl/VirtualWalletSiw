<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - History</title>
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
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="../viewHistory" onclick="activeLoader();">Cambia in italiano</a></li>
		        </ul>
			</div>
			<a class="links" href="account.jsp"><c:out value="${nome} ${cognome }">No name</c:out>, benvenuto!</a>
			
		</div>
		<div class="lds-dual-ring" id="loader"  style="visibility:hidden" ></div>
		
	</nav>
	
	<section class="portfolio-block section-border">
		<div class="container gradient myBorder">
			<p>Transaction history of <%out.print(session.getAttribute("nome")+" "+(session.getAttribute("cognome"))); %></p>		
		</div>
	</section>
	<section class="portfolio-block">
		<div class="row gradient">
			<div class="col-md-6 myBorder">
				<p class="section-border" style="color:white; font-size:1.5em;">Send</p>
				<table>
					<tr>
						<th class="col-xs-2 colTableEmpty">DATE</th>
						<th class="col-xs-2 colTableEmpty">RECEIVER NAME</th>
						<th class="col-xs-2 colTableEmpty">RECEIVER SURNAME</th>
						<th class="col-xs-4 colTableEmpty">RECEIVER E-MAIL</th>
						<th class="col-xs-2 colTableEmpty">AMOUNT</th>
					</tr>
					<c:forEach items="${transazioniM}" var="trans" >
						<tr>
							<td class="colTableTransaction myBorder">data</td>
							<td class="colTableTransaction myBorder">${trans.nomeDestinatario }</td>
							<td class="colTableTransaction myBorder">${trans.cognomeDestinatario }</td>
							<td class="colTableTransaction myBorder">${trans.email }</td>
							<td class="colTableTransaction myBorder" style="color:red">-${trans.importo}€</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-md-6 myBorder">
				<p class="section-border" style="color:white; font-size:1.5em;">Receiver</p>
				<table>
					<tr>
						<th class="col-xs-2 colTableEmpty">DATE</th>
						<th class="col-xs-2 colTableEmpty">SENDER NAME</th>
						<th class="col-xs-2 colTableEmpty">SENDER SURNAME</th>
						<th class="col-xs-4 colTableEmpty">SENDER E-MAIL</th>
						<th class="col-xs-2 colTableEmpty">AMOUNT</th>
					</tr>
					<c:forEach items="${transazioniD}" var="trans" >
						<tr>
							<td class="colTableTransaction myBorder">data</td>
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
	<script src="../bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="../bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
</body>
</html>