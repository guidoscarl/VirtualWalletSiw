<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Transaction</title>
	<link rel="stylesheet" href="../newCSS/myCSS.css">
    <link rel="stylesheet" href="../bootstrap-4.1.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="../bootstrap-4.1.0-dist/fonts/ionicons.min.css">
    <script src="../js/checkImport.js"></script>
</head>
<body class="myBody">
	<nav class="navbar navbar-dark navbar-expand-sm fixed-top gradient">
		<div class="container">
			<span class="navbar-brand">Virtual Wallet</span>
			<div class="navbar-collapse" id="navcol-1">
				<ul class="nav navbar-nav">
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="home.jsp">Home</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="logout">Logout</a></li>
			        <li class="nav-item" role="presentation"><a class="nav-link active" href="../transaction.jsp">Cambia in italiano</a></li>
		        </ul>
			</div>
	        <a class="links" href="account.jsp"><%out.print(session.getAttribute("nome")+" "+(session.getAttribute("cognome"))); %>, welcome!</a>
		</div>
	</nav>
	<section class="portfolio-block">
        <div class="container">
            <div class="heading"><h2>Transaction</h2></div>
            <form style="background-color:white" method="post" action="transaction">
                <!-- Tenere per la registrazione di un nuovo account <div class="form-group"><label for="subject">Subject</label><select class="form-control" id="subject"><option value="" selected="">Choose Subject</option><option value="1">Subject 1</option><option value="2">Subject 2</option><option value="3">Subject 3</option></select></div> -->
                <!-- Aggiungere identificativi???-->
                <p style="color:black"><i>Inserisci nella form qui sotto il nome, il cognome e l'e-mail dell'utente destinatario e l'importo con il quale effettuare la transazione.</i></p>
                <div class="form-group"><label for="name">Name</label><input class="form-control" type="text" name="name" id="nome"></div>
                <div class="form-group"><label for="surname">Surname</label><input class="form-control" type="text" name="surname" id="cognome"></div>
                <div class="form-group"><label for="email">Email</label><input class="form-control" type="email" name="email" id="email" onInput="checkEmail();" ></div>
                <div class="form-group"><label for="importo">Import</label><input class="form-control" type="text" name="importo" id="import" oninput="checkImport();" saldo="${saldo }">
                <p style="color:red; visibility:hidden;" id="error" >Balance not sufficient.</p>
                <button type="button" class="btn btn-primary btn-block" type="button" style="visibility:hidden" onclick="doRecharge();" id="buttonRC" >Make Recharge</button>
                </div>
				<div class="button"><button class="btn btn-primary btn-block" type="button" id="buttonTR" onclick="doTransaction();">Make transaction</button></div>
        	</form>
        </div>
    </section>
    <script src="../bootstrap-4.1.0-dist/js/jquery.min.js"></script>
    <script src="../bootstrap-4.1.0-dist/js/bootstrap.min.js"></script>
</body>
</html>