<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Wallet - Registrazione</title>
	<link rel="stylesheet" href="newCSS/myCSS.css">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
    <script src="js/checkEmail.js"></script>
    <script src="js/contactUs.js"></script>
    <script src="js/loader.js"></script>
    <script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
	    <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico">
	
</head>

<body class="myBody">
    <nav class="navbar navbar-dark navbar-expand-sm gradient">
        <div class="container">
        	<span class="navbar-brand">Virtual Wallet</span>
        	<button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
        		<span style="color:white;">Naviga nel sito!</span>
        	</button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="home.jsp">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="sign-in.html">Accedi</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="portfolio-block">
        <div class="container">
            <h2>Registrazione</h2>
            <form style="background-color:white" method="post" action="SignupServlet">
                <div class="form-group"><label for="name">Nome</label><input class="form-control" type="text" name="name" id="name"></div>
                <div class="form-group"><label for="surname">Cognome</label><input class="form-control" type="text" name="surname" id="surname"></div>
                <div class="form-group"><label for="email" >Email</label><input class="form-control" type="email" name="email" id="email"></div>
                
                <div class="form-group"><label for="password">Password</label><input class="form-control" type="password" name="password" id="password"></div>
                <div class="form-group"><label for="password">Conferma password</label><input class="form-control" type="password" id="passwordConf" oninput="checkPassword();">
                	<p id="controlPass" class="errorMessage" style="visibility:hidden;">La password non corrisponde.</p>
                </div>
        		<div class="form-group"><label for="born-date">Data di nascita</label><input class="form-control" type="date" id="born-date"></div>
        		<div class="form-group"><p  class="errorMessage" style="visibility:hidden;" id="control"></p></div>
				<div class="button"><button class="btn btn-primary btn-block" type="button" id="button" onclick="activeLoader();signUp();">Registrati</button></div>
        	</form>
        	<div class="lds-dual-ring" id="loader" style="visibility:hidden"></div>
        	
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