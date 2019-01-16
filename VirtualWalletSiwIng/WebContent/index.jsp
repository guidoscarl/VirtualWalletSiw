<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<style>
		.myBody {
			background-color: #6741D1;
		}
		#firstP,#slogan {
			color: white;
		}
	</style>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Wallet</title>
	<!-- <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css"> -->
   	<!-- Usare il css qui sotto per vedere il sito normale, sto lavorando sul css per capire come modificarlo per restare conformi al template originale -->
   	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
   	<link rel="stylesheet" href="css/myCss.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
</head>

<body class = "myBody">
    <nav class="navbar navbar-dark navbar-expand-md fixed-top gradient">
        <div class="container">
        	<span class="navbar-brand">Unical Wallet</span>
        	<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav">
        		<span>Naviga nel sito!</span>
        		<span class="navbar-toggler-icon"></span>
        	</button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="index.html">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="projects-grid-cards.html">Projects</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="cv.html">CV</a></li>
                    <% 
                    if(session.getAttribute("logged")==null)
                    	out.print("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active\" href=\"sign-in.html\">Login</a></li>");
                    %>
                </ul>
            </div>
        </div>
    </nav>
    <main class="page lanidng-page">
        <section class="portfolio-block block-intro">
            <div class="container">
                <div class="avatar" style="background-image:url(&quot;assets/img/avatars/test.jpg&quot;);"></div>
                <div class="about-me">
                	<%
                		if(session.getAttribute("logged")==null)
                			out.print("<p id=\"firstP\">Il portafoglio virtuale <strong>Unical Wallet</strong> permetter� senza problemi acquisti e transazioni tra utenti e siti web che approvano il nostro progetto! </p><a class=\"btn btn-primary\" role=\"button\" href=\"sign-up\">Iscriviti</a>");
                		else
                			out.print("<p id=\"firstP\">Il portafoglio virtuale <strong>Unical Wallet</strong> permetter� senza problemi acquisti e transazioni tra utenti e siti web che approvano il nostro progetto! </p><a class=\"btn btn-primary\" role=\"button\" href=\"account.jsp\">Il mio profilo</a>");

                	%>
                </div>
            </div>
        </section>
        <section class="portfolio-block photography">
            <div class="container">
                <div class="row no-gutters">
                	<!--  Aggiungere funzioni sullo zoom delle immagini??? -->
                    <div class="col-md-6 col-lg-4 item zoom-on-hover"><!--<a href="#"> --><img class="img-fluid image" src="assets/img/nature/exchange.jpg"><!-- </a> --></div>
                    <div class="col-md-6 col-lg-4 item zoom-on-hover"><!--<a href="#"> --><img class="img-fluid image" src="assets/img/nature/transaction.jpg"><!-- </a> --></div>
                    <div class="col-md-6 col-lg-4 item zoom-on-hover"><!--<a href="#"> --><img class="img-fluid image" src="assets/img/nature/chart.jpg"><!-- </a> --></div>
                </div>
            </div>
        </section>
        <section class="portfolio-block call-to-action border-bottom">
            <!-- <div class="container"> Questo blocco serviva solo per un nuovo bottone "iscrivimi" tra le foto e lo slogan
                <div class="d-flex justify-content-center align-items-center content">
                    <h3>Like what you see?</h3><button class="btn btn-outline-primary btn-lg" type="button">Hire me</button></div>
            </div> -->
        </section>
        <section class="portfolio-block skills">
            <div class="container">
                <div class="heading">
                    <h2 id="slogan">Custodisci i tuoi risparmi in totale sicurezza!</h2>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card special-skill-item border-0">
                            <div class="card-header bg-transparent border-0"><i class="icon ion-ios-star-outline"></i></div>
                            <div class="card-body">
                                <h3 class="card-title">Conserva!</h3>
                                <p class="card-text">Custodisci il tuo denaro! Nessuno potr� toccarlo se non te. </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card special-skill-item border-0">
                            <div class="card-header bg-transparent border-0"><i class="icon ion-ios-lightbulb-outline"></i></div>
                            <div class="card-body">
                                <h3 class="card-title">Trasferisci!</h3>
                                <p class="card-text">Trasferisci il tuo denaro a chi preferisci. Amici o parenti potranno riceverlo</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card special-skill-item border-0">
                            <div class="card-header bg-transparent border-0"><i class="icon ion-ios-gear-outline"></i></div>
                            <div class="card-body">
                                <h3 class="card-title">Totale sicurezza!</h3>
                                <p class="card-text">� tutto in totale sicurezza! Solo tu potrai accedere al tuo proprio portafoglio</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <section class="portfolio-block website gradient">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-12 col-lg-5 offset-lg-1 text">
                    <h3>Sostieni il nostro progetto</h3>
                    <p>Il portafoglio virtuale � nato per conservare in totale sicurezza il proprio denaro e fare in modo che solo il proprietario potr� accedervi e scambiarlo con chi vuole lui!</p>
                </div>
                <div class="col-md-12 col-lg-5">
                    <div class="portfolio-laptop-mockup">
                        <div class="screen">
                            <div class="screen-content" style="background-image:url(&quot;assets/img/tech/image6.png&quot;);"></div><!-- cambiare immagine -->
                        </div>
                        <div class="keyboard"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="page-footer">
        <div class="container">
            <div class="links"><a style="color:white" href="#">About us</a><a style="color:white" href="#">Contact us</a><a style="color:white" href="#">Projects</a></div>
            <div class="social-icons"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-instagram-outline"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a></div>
        </div>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>