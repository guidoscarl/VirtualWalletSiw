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
	<script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-message-box@3.0.0/dist/messagebox.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-message-box@3.0.0/dist/messagebox.min.css">
	<script src="js/search.js"></script>
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
				<input id="myInput" type="text" placeholder="Cerca utenti" oninput="search();">
			</div>
			<a class="links" href="signin"><c:out value="${nome} ${cognome}">No name</c:out>, benvenuto!</a>
			<a href="mailBox" class="mailIcon"><i class="ion ion-email"></i></a>
	        <c:if test="${haveMes!=null }">
				<img src="Images/notific.png" alt="notific" height="13" width="13">
			</c:if>
		</div>
	</nav>
	<ul class="list-group" id="myList"></ul>
	<section class="portfolio-block section-border">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 profile-info gradient myBorder">
					
					
					
					
					<div id="f2_container">
						<div id="f1_card" class="shadow">
						  <div class="front face">
						   	<h1>I suoi dati</h1>
						  </div>
						  <div class="back face center">
						     	<span>Nome:</span>
								<p><c:out value="${nomeUs}">No name</c:out></p>
								<span>Cognome:</span>
								<p><c:out value="${cognomeUs}">No name</c:out></p>
						  </div>
						</div>
					</div>
				</div>
				<div class="col-sm-3 profile-info gradient myBorder">
					<c:if test="${imageUs=='default' }">
						<img src="Images/userprofile.jpg" alt="profile" height="100" width="100"></img>
					</c:if>
					<c:if test="${imageUs!='default' }">
						<img src="${imageUs }" alt="profile" height="200" width="200"></img>
					</c:if>
				</div>
				<c:if test="${status=='active' }">
					<div class="col gradient myBorder">
						<a id="transButton" class="btn btn-primary" role="button" href="Transaction?emailUs=${emailUs }&nameUs=${nomeUs}&surnameUs=${cognomeUs}">Effettua transazione</a>
						<a class="btn btn-primary" role="button" href="#" onclick="var id=${number}; deleteFromProfile(id);">Rimuovi dagli amici</a>
						
					</div>
					
				</c:if>
				<c:if test="${status =='sended' }">
					<div class="col gradient myBorder">
						<p>Richiesta in attesa di essere accettata</p>
						<a class="btn btn-primary" role="button" href="#" onclick="var id=${number}; deleteFromProfile(id);">Cancella richiesta</a>
					</div>
				</c:if>
				<c:if test="${status =='received' }">
					<div class="col gradient myBorder">
						<a class="btn btn-primary" role="button" href="#" onclick="var em='${emailUs}'; var id=${number };  acceptFromProfile(id,em);">Accetta Richiesta</a>
						<a class="btn btn-primary" role="button" href="#" onclick="var em='${emailUs}'; var id=${number };  rejectFromProfile(id,em);">Rifiuta Richiesta</a>
					</div>
				</c:if>
				<c:if test="${status =='notexist' }">
					<div class="col gradient myBorder">
						<a class="btn btn-primary" role="button" href="#" onclick="var em='${emailUs}'; sendRequest(em);">Invia richiesta</a>
					</div>
				</c:if>
		    </div>
		    
		</div>
		<div class="lds-dual-ring" id="loader" style="visibility:hidden"></div>
		<c:if test="${status=='active' }">
		<div id="f3_container">
						<div id="f1_card" class="shadow">
						  <div class="front face">
						   	<img src="Images/contatta.jpg" width="300" height="100">
						  </div>
						  <div class="back face center">
						    <a id="messageButton" class="btn btn-primary" role="button" href="#" onclick="var sender='${email}'; var receiver='${emailUs }'; sendMessage(sender,receiver);">Invia messaggio</a>
						  </div>
						</div>
					</div>
		</c:if>
	</section>
	<section >
	    <div class="container">
	    <div id="carouselExampleControls" class="carousel slide space-padding" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="Images/transazioni.png" alt="First slide">
       
    </div>
    <div class="carousel-item">
      <img class="d-block w-100"src="Images/Interagisci.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100"  src="Images/ricarica.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
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