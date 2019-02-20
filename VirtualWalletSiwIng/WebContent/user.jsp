<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Utente di Virtual Wallet</title>
	<link rel="stylesheet" href="newCSS/myCSS.css">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <script src="js/loader.js"></script>
    <script src="js/contactUs.js"></script>
    <script src="js/amicizie.js"></script>
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
				<input type="text" placeholder="Cerca utenti">
				<button type="submit"><i class="fa fa-search"></i></button>
			</div>
			<a class="links" href="signin"><c:out value="${nome} ${cognome}">No name</c:out>, benvenuto!</a>
		</div>
	</nav>
	<section class="portfolio-block section-border">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 profile-info gradient myBorder">
					<h1>Profilo di</h1>
					<span>Nome:</span>
					<p><c:out value="${nome}">No name</c:out></p>
					<span>Cognome:</span>
					<p><c:out value="${cognome}">No name</c:out></p>
				</div>
				<c:if test="${status=='active' }">
					<div class="col-sm-9 gradient myBorder">
						<a id="transButton" class="btn btn-primary" role="button" href="transaction.jsp">Effettua transazione</a>
						<a class="btn btn-primary" role="button" href="#" onclick="var id=${number}; deleteFromProfile(id);">Rimuovi dagli amici</a>
						<a id="messageButton" class="btn btn-primary" role="button" href="#">Invia messaggio</a>
						
						
					</div>

				</c:if>
				
				<c:if test="${status =='sended' }">
					<div class="col-sm-9 gradient myBorder">
					<p>Richiesta in attesa di essere accettata</p>
					<a class="btn btn-primary" role="button" href="#" onclick="var id=${number}; deleteFromProfile(id);">Cancella richiesta</a>
					
					</div>
				</c:if>
				
				<c:if test="${status =='received' }">
					<div class="col-sm-9 gradient myBorder">
					
					<a class="btn btn-primary" role="button" href="#" onclick="var em='${emailUs}'; var id=${number };  acceptFromProfile(id,em);">Accetta Richiesta</a>
					<a class="btn btn-primary" role="button" href="#" onclick="var em='${emailUs}'; var id=${number };  rejectFromProfile(id,em);">Rifiuta Richiesta</a>
					
					
					
					</div>
				</c:if>
				
				
				<c:if test="${status =='notexist' }">
					<div class="col-sm-9 gradient myBorder">
					
					<a class="btn btn-primary" role="button" href="send?receiver=${emailUs }">Invia richiesta</a>
					
					
					
					
					</div>
				</c:if>
				
				
	   	 		
		    </div>
		</div>
		<div class="lds-dual-ring" id="loader" style="visibility:hidden"></div>
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