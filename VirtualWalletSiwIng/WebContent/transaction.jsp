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
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
    <script src="js/checkImport.js"></script>
</head>
<body class="myBody">
	<nav class="navbar navbar-dark navbar-expand-sm fixed-top gradient">
		<div class="container">
			<span class="navbar-brand">Virtual Wallet</span>
			<div class="navbar-collapse" id="navcol-1">
				<ul class="nav navbar-nav">
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="home.jsp">Home</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="logout">Disconnetti</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="en/transaction.jsp">Switch to English</a></li>
		        </ul>
			</div>
	        <a class="links" href="account.jsp"><c:out value="${nome} ${cognome }">No name</c:out>, benvenuto!</a>
		</div>
	</nav>
	<section class="portfolio-block">
        <div class="container">
            <div class="heading"><h2>Transazione</h2></div>
            <form style="background-color:white" method="post" action="transaction">
                <!-- Aggiungere identificativi???-->
                <p style="color:black"><i>Inserisci nella form qui sotto il nome, il cognome e l'e-mail dell'utente destinatario e l'importo con il quale effettuare la transazione.</i></p>
                <div class="form-group"><label for="name">Nome</label><input class="form-control" type="text" name="name" id="nome"></div>
                <div class="form-group"><label for="surname">Cognome</label><input class="form-control" type="text" name="surname" id="cognome"></div>
                <c:choose>
                	<c:when test="${emailFlamingo != null}">
   						 <div class="form-group"><label for="email">Email</label><input class="form-control" type="email" name="email" id="email" value="${emailFlamingo }" disabled="disabled" ></div>
  					</c:when>
  					
  					<c:when test="${emailFlamingo == null}">
   						 <div class="form-group"><label for="email">Email</label><input class="form-control" type="email" name="email" id="email" value="sessionnontrovata" ></div>
  					</c:when>
                
                
                
                </c:choose>
                <div class="form-group"><label for="importo">Importo</label><input class="form-control" type="text" name="importo" id="import" oninput="checkImport();" saldo="${saldo }">
                <p style="color:red; visibility:hidden;" id="error" >Saldo non sufficiente</p>
                <button type="button" class="btn btn-primary btn-block" type="button" style="visibility:hidden" onclick="doRecharge();" id="buttonRC" >Effettua ricarica</button>
                </div>
				<div class="button"><button class="btn btn-primary btn-block" type="button" id="buttonTR" onclick="doTransaction();">Effettua transazione</button></div>
        	</form>
        </div>
    </section>
    <script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
</body>
</html>