<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo utente - Ricarica</title>
	<link rel="stylesheet" href="newCSS/myCSS.css">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico">
    <script src="js/recharge.js"></script>
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
	</nav>
	<ul class="list-group" id="myList"></ul>
	<section class="portfolio-block">
        <div class="container">
            <div class="heading"><h2>Ricarica</h2></div>
            <form style="background-color:white" method="post" action="recharge" >
                <p><i>Inserisci nella form qui sotto la tua e-mail e la tua password per verificare i tuoi dati e l'importo da ricaricare</i></p>
                <div class="form-group"><label for="email">Email</label><input class="form-control" type="email" name="email" id="email" email="${email }"></div>
                <div class="form-group"><label for="password">Password</label><input class="form-control" type="password" name="password" id="password" password="${password }" saldo="${saldo }"></div>
                <div class="form-group"><label for="name">Importo</label><input class="form-control" type="text" name="importo" id="importo"></div>
				<div class="button"><button class="btn btn-primary btn-block" type="button" onclick="open_popup();">Continua</button></div>
				<div class="form-group">
        			<p class="errorMessage" style="visibility:hidden;" id="error">Nome utente o password sbagliati.</p>
        		</div>
        	</form>
        </div>
    </section>
    <div class="creditCardForm  this-credit-card" id="popup-form">
	    <div class="credit-content">
		    <div class="heading">
		        <span onclick="close_popup();" class="closing">&times;</span>
		        <h1>Dettagli di pagamento</h1>
		    </div>
		    <div class="payment">
		        <form>
		            <div class="form-group owner">
		                <label for="owner">Intestatario</label>
		                <input type="text" class="form-control" id="owner">
		            </div>
		            <div class="form-group CVV">
		                <label for="cvv">CVV</label>
		                <input type="text" class="form-control" id="cvv">
		            </div>
		            <div class="form-group" id="card-number-field">
		                <label for="cardNumber">Numera della carta</label>
		                <input type="text" class="form-control" id="cardNumber">
		            </div>
		            <div class="form-group" id="expiration-date">
		                <label>Data di scadenza</label>
		                <select>
		                    <option value="01">Gennaio</option>
		                    <option value="02">Febbraio</option>
		                    <option value="03">Marzo</option>
		                    <option value="04">Aprile</option>
		                    <option value="05">Maggio</option>
		                    <option value="06">Giugno</option>
		                    <option value="07">Luglio</option>
		                    <option value="08">Agosto</option>
		                    <option value="09">Settembre</option>
		                    <option value="10">Ottobre</option>
		                    <option value="11">Novembre</option>
		                    <option value="12">Decembre</option>
		                </select>
		                <select>
		                    <option value="16"> 2016</option>
		                    <option value="17"> 2017</option>
		                    <option value="18"> 2018</option>
		                    <option value="19"> 2019</option>
		                    <option value="20"> 2020</option>
		                    <option value="21"> 2021</option>
		                </select>
		            </div>
		            <div class="form-group" id="credit_cards">
		                <img src="Images/visa.jpg" id="visa">
		                <img src="Images/mastercard.jpg" id="mastercard">
		                <img src="Images/amex.jpg" id="amex">
		            </div>
		            <div class="form-group" id="pay-now">
		                <button type="button" class="btn btn-default" id="confirm-purchase" onclick="makeRecharge();">Ricarica</button>
		            </div>
		        </form>
		    </div>
		</div>
	</div>
    <footer class="gradient">
        <div class="container space-padding">
            <div class="links">
            	<a onclick="contactUs();">Contact us</a>
            </div>
        </div>
    </footer>
    <script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
</body>
</html>