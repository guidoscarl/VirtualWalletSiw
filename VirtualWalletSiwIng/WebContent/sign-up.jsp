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
</head>

<body class="myBody">
    <nav class="navbar navbar-dark navbar-expand-sm fixed-top gradient">
        <div class="container">
        	<span class="navbar-brand">Virtual Wallet</span>
        	<button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
        		<span style="color:white;">Naviga nel sito!</span>
        		<!-- <span class="navbar-toggler-icon"></span> -->
        	</button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="home.jsp">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="projects-grid-cards.html">Progetto</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="cv.html">CV</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="sign-in.html">Accedi</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="portfolio-block">
        <div class="container">
            <div class="heading"><h2>Registrazione</h2></div>
            <form style="background-color:white" method="post" action="SignupServlet">
                <!-- Tenere per la registrazione di un nuovo account <div class="form-group"><label for="subject">Subject</label><select class="form-control" id="subject"><option value="" selected="">Choose Subject</option><option value="1">Subject 1</option><option value="2">Subject 2</option><option value="3">Subject 3</option></select></div> -->
                <!-- Aggiungere identificativi???-->
                <div class="form-group"><label for="name">Nome</label><input class="form-control" type="text" name="name"></div>
                <div class="form-group"><label for="surname">Cognome</label><input class="form-control" type="text" name="surname"></div>
                <div class="form-group"><label for="email">Email</label><input class="form-control" type="email" name="email"></div>
                <%if((boolean)session.getAttribute("esistente")==true){
                	out.print("<p style=\"color:red;\"> Email già esistente<p>");
                }
                %>
                <div class="form-group"><label for="password">Password</label><input class="form-control" type="password" name="password"></div>
                <div class="form-group"><label for="password">Conferma password</label><input class="form-control" type="password" id="password"></div>
        		<div class="form-group"><label for="born-date">Data di nascita</label><input class="form-control" type="date" id="born-date"></div>
				<div class="button"><button type="submit" class="btn btn-primary btn-block" type="button">Registrati</button></div>
        	</form>
        </div>
    </section>
    <footer class="page-footer gradient">
        <div class="container space-padding">
            <div class="links">
            	<a href="#">About us</a>
            	<a href="#">Contact us</a>
            	<a href="#">Project</a>
            </div>
            
            <div class="social-icons">
            	<a href="#"><i class="icon ion-social-facebook"></i></a>
            	<a href="#"><i class="icon ion-social-instagram-outline"></i></a>
            	<a href="#"><i class="icon ion-social-twitter"></i></a>
            </div>
        </div>
    </footer>
	<script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
</body>

</html>