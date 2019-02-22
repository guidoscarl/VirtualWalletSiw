<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo Utente</title>
	<link rel="stylesheet" href="newCSS/myCSS.css">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <script src="js/loader.js"></script>
    <script src="js/search.js"></script>
    <script src="js/amicizie.js"></script>
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
				<button type="submit"><i class="fa fa-search"></i></button>
			</div>
	        <a class="links" href="signin"><c:out value="${nome} ${cognome}">No name</c:out>, benvenuto!</a>
	        <a href="mailbox.jsp" style="padding-left:1%"><i class="ion ion-email" style="text-size:2rem; color:white"></i></a>
		</div>
	</nav>
	<ul class="list-group" id="myList"></ul>
	<section class="portfolio-block section-border">
		<div class="container gradient myBorder">
			<p style="text-align:center">La tua mailbox</p>
			<div class="row" style="padding:10px 10px">
				<div class="col-md-7 col-lg-7"><span>Messaggio</span></div>
				<div class="col-md-3 col-lg-3"><span>Mittente</span></div>
				<div class="col-md-2 col-lg-2"><span>Data</span></div>
				<c:forEach items="${messages}" var="mess">
					<div class="myBorder col-md-7 col-lg-7"><span style="word-break:break-all">${mess.value }</span></div>
					<div class="myBorder col-md-3 col-lg-3"><a style="color:white" href="viewProfile?email=${mess.sender }">${mess.sender }</a></div>
					<div class="myBorder col-md-2 col-lg-2"><span>${mess.date }</span></div>
				</c:forEach>
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
</body>
</html>