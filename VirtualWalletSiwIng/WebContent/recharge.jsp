<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PROFILO UTENTE</title>
	<link rel="stylesheet" href="newCSS/myCSS.css">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="bootstrap-4.1.0-dist/fonts/ionicons.min.css">
</head>
<body class="myBody">
	<nav class="navbar navbar-dark navbar-expand-sm fixed-top gradient">
		<div class="container">
			<span class="navbar-brand">Virtual Wallet</span>
			<div class="navbar-collapse" id="navcol-1">
				<ul class="nav navbar-nav">
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="index.html">Home</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="#">Disconnetti</a></li>
		        </ul>
			</div>
	        <a class="links" href="account.jsp"><%out.print(session.getAttribute("nome")+" "+(session.getAttribute("cognome"))); %>, benvenuto!</a>
		</div>
	</nav>
	<section class="portfolio-block">
        <div class="container">
            <div class="heading"><h2>Ricarica</h2></div>
            <form style="background-color:white" method="post" action="recharge" >
                <!-- Tenere per la registrazione di un nuovo account <div class="form-group"><label for="subject">Subject</label><select class="form-control" id="subject"><option value="" selected="">Choose Subject</option><option value="1">Subject 1</option><option value="2">Subject 2</option><option value="3">Subject 3</option></select></div> -->
                <!-- Aggiungere identificativi???-->
                <p><i>Inserisci nella form qui sotto la tua e-mail e la tua password per verificare i tuoi dati e l'importo da ricaricare</i></p>
                <div class="form-group"><label for="email">Email</label><input class="form-control" type="email" name="email"></div>
                <div class="form-group"><label for="password">Password</label><input class="form-control" type="password" name="password"></div>
                <div class="form-group"><label for="name">Importo</label><input class="form-control" type="text" name="importo"></div>
				<div class="button"><button type="submit" class="btn btn-primary btn-block" type="button">Effettua ricarica</button></div>
        	</form>
        </div>
    </section>
</body>
</html>