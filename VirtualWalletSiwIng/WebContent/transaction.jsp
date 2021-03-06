<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Transazione</title>
	<link rel="stylesheet" href="newCSS/myCSS.css">
	<script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico">
    
    <script src="js/checkImport.js"></script>
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
	        <a class="links" href=account><c:out value="${nome} ${cognome }">No name</c:out>, benvenuto!</a>
	        <a href="mailBox" class="mailIcon"><i class="ion ion-email"></i></a>
	        <c:if test="${haveMes!=null }">
				<img src="Images/notific.png" alt="notific" height="13" width="13">
			</c:if>
		</div>
	</nav>
	<ul class="list-group" id="myList"></ul>
	<section class="portfolio-block">
        <div class="container">
            <div class="heading"><h2>Transazione</h2></div>
            <form style="background-color:white" method="post" action="transaction">
                <p><i>Inserisci nella form qui sotto l'importo con il quale effettuare la transazione.</i></p>
                <c:if test="${emailUs!=null }">
                	<c:if test="${nameUs!=null }">
                		<div class="form-group"><label for="name">Nome</label><input class="form-control" type="text" name="name" id="nome" value="${nameUs }" disabled="disabled"></div>
                	</c:if>
                	<c:if test="${surnameUs!=null }">
                		<div class="form-group"><label for="surname">Cognome</label><input class="form-control" type="text" name="surname" id="cognome" value="${surnameUs }" disabled="disabled"></div>
                	</c:if>
                	<div class="form-group"><label for="email">Email</label><input class="form-control" type="email" name="email" id="email" value="${emailUs }" disabled="disabled" ></div>
					<div class="form-group"></div>
	                <div class="form-group"><label for="importo">Importo</label><input class="form-control" type="text" name="importo" id="import" oninput="checkImport();" saldo="${saldo }">
	                	<p class="errorMessage" style="visibility:hidden;" id="error" >Saldo non sufficiente</p>
	                	<button type="button" class="btn btn-primary btn-block" type="button" style="visibility:hidden" onclick="doRecharge();" id="buttonRC" >Effettua ricarica</button>
	                </div>
					<div class="button"><button class="btn btn-primary btn-block" type="button" id="buttonTR" onclick="doTransaction();">Effettua transazione</button></div>
                </c:if>
        	</form>
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