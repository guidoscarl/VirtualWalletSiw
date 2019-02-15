<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Wallet</title>
    <link rel="stylesheet" href="newCSS/myCSS.css">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
    <script src="bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
    <script src="js/contactUs.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
</head>

<body class="myBody">
    <nav class="navbar navbar-dark navbar-expand-sm gradient">
        <div class="container">
        	<span class="navbar-brand">Virtual Wallet</span>
        	<button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
        		<span style="color:white;">Naviga nel sito!</span>
        		<!-- <span class="navbar-toggler-icon"></span> -->
        	</button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="home.jsp">Home</a></li>
                    <% 
                    if(session.getAttribute("logged")==null)
                    	out.print("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active\" href=\"sign-in.html\">Accedi</a></li>");
                    else
                    	out.print("<li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active\" href=\"logout\">Disconnetti</a></li>");
                    %>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="en/home.jsp">Switch to english</a></li>
                </ul>
            </div>
        </div>
    </nav>
	<section class="portfolio-block">
	    <div class="container myBorder">
	        <div class="avatar" style="background-image:url(&quot;Images/test.jpg&quot;);"></div>
	        <div>
	        	<p>Il portafoglio virtuale <strong>Virtual Wallet</strong> permetter� senza problemi acquisti e transazioni tra utenti e siti web che approvano il nostro progetto! </p>
	        	<%
                		if(session.getAttribute("logged")==null)
                			out.print("<a class=\"btn btn-primary\" style=\"border-radius:50px\" role=\"button\" href=\"sign-up\">Iscriviti</a>");
                		else
                			out.print("<a class=\"btn btn-primary\" style=\"border-radius:50px\" role=\"button\" href=\"account.jsp\">Il mio profilo</a>");
				%>
	        </div>
	    </div>
	</section>
	<section class="section-border">
	    <div class="container">
	        <div class="row space-padding">
	            <div class="col-lg-4"><img class="img-fluid image" src="Images/exchange.jpg"></div>
	            <div class="col-lg-4"><img class="img-fluid image" src="Images/transaction.jpg"></div>
	            <div class="col-lg-4"><img class="img-fluid image" src="Images/chart.jpg"></div>
	        </div>
	    </div>
	</section>
	<section class="section-border">
	    <div class="container space-padding">
	    	<div class="heading" style="text-align:center;color:white;">
	         <h1 class="space-padding">Custodisci i tuoi risparmi in totale sicurezza!</h1>
	    	</div>
	        <div class="row">
	            <div class="col-md-4">
	                <div class="card custom-card">
	                    <div class="card-body">
	                        <div class="card-header custom-card"><h3>Conserva</h3></div>
	                        <div class="card-body custom-card">
	                        	<!-- <h3 class="card-title">Conserva</h3> -->
	                        	<p class="card-text custom-card">Custodisci il tuo denaro! Nessuno potr� toccarlo se non te.</p>
	                        </div>
	                  	</div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="card">
	                    <div class="card-body">
	                        <div class="card-header"><h3>Trasferisci</h3></div>
	                        <div class="card-body">
	<!-- 	                           	<h3 class="card-title">Trasferisci</h3> -->
	                        	<p class="card-text">Trasferisci il tuo denaro a chi preferisci. Amici o parenti potranno riceverlo.</p>
	                        </div>
	                  	</div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="card">
	                    <div class="card-body">
	                        <div class="card-header"><h3>Totale sicurezza!</h3></div>
	                        <div class="card-body">
	<!-- 	                           	<h3 class="card-title">Totale sicurezza!</h3> -->
	                        	<p class="card-text">� tutto in totale sicurezza! Solo tu potrai accedere al tuo portafoglio.</p>
	                        </div>
	                  	</div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col"></div>
                <div class="col"></div>
            </div>
        </div>
    </section>
    <footer class="gradient">
        <div class="container space-padding">
            <div class="links">
            	<a href="#" onclick="contactUs();">Contact us</a>
            </div>
        </div>
    </footer>
</body>

</html>