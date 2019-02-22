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
			</div>
	        <a class="links" href="signin"><c:out value="${nome} ${cognome}">No name</c:out>, benvenuto!</a>
	        <a href="mailBox" style="padding-left:1%"><i class="ion ion-email" style="text-size:2rem; color:white"></i></a>
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
					<h1>Info utente</h1>
					<span>Nome:</span>
					<p><c:out value="${nome}">Null</c:out></p>
					<span>Cognome:</span>
					<p><c:out value="${cognome}">Null</c:out></p>
					<span>E-mail:</span>
					<p style="font-size:1.00vw;"><c:out value="${email}">Null</c:out></p>
				</div>
				<div class="col-sm-3 profile-info gradient myBorder">
					<img src="Images/userprofile.jpg" alt="profile" height="100" width="100"></img>
					<a style="margin-top:5px" class="btn btn-primary" role="button" href="search.jsp">Cambia la foto con Flickr</a>
				</div>
	   	 		<div class="col gradient myBorder">
        			<p>Il tuo conto ammonta a:</p>
		       		<div class="amount">&#8364;<c:out value="${saldo}">Nessun saldo disponibile</c:out></div>
	       			<a class="btn btn-primary" role="button" href="viewHistory" onclick="activeLoader();">Visualizza Storico</a>
	       			<a class="btn btn-primary" role="button" href="recharge.jsp">Ricarica importo</a>
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
					<div class="friendBlock">
						<c:forEach items="${friends}" var="fr" >
							<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;">
            				<a href="viewProfile?email=${fr.emailReceiver }">${fr.emailReceiver }</a>
							<button><i class="ion ion-cash" style="color:green" onclick="var receiver='${fr.emailReceiver}'; transaction(receiver);"></i></button>
						</div>
						</c:forEach>
            			
        	    		
					</div>
				</div>
				<div class="friendList">
					<p style="color:black"><strong>Ricevute</strong></p>
					<div class="friendBlock">
						<c:forEach items="${received}" var="rec" >
							<a id="${rec.id }" href="viewProfile?email=${rec.emailSender }">${rec.emailSender }</a>
							<button class="friendButton" id="confbutton${rec.id }" style="background-image:url(&quot;Images/accept.png&quot;);" onclick="var id=${rec.id}; accetta(id);"  ></button>
							<button class="friendButton" id="delbutton${rec.id }" style="background-image:url(&quot;Images/deny.png&quot;);" onclick="var id=${rec.id}; rifiuta(id);"></button>
						</c:forEach>
					</div>
				</div>
				<div class="friendList">
					<p style="color:black"><strong>Inviate</strong></p>
					<div class="friendBlock">
						<c:forEach items="${sended}" var="rec" >
							<div class="friend" style="border-top: 1px solid; border-color: #d1d1d1;">
								<a id="${rec.id }" href="viewProfile?email=${rec.emailReceiver }">${rec.emailReceiver }</a>
								<button id="ref${rec.id }" onclick="var id=${rec.id}; deleteRequest(id);"><i class="ion ion-close-circled" style="color:red"></i></button>
							</div>
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
</body>
</html>