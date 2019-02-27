<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        	</button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="home.jsp">Home</a></li>
                   <c:if test="${logged==null }">
                   		<li class="nav-item" role="presentation"><a class="nav-link active" href="sign-in.html">Accedi</a></li>
                   </c:if>
                    
                    <c:if test="${logged!=null }">
                    	<li class="nav-item" role="presentation"><a class="nav-link active" href="logout">Disconnetti</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
	<section class="portfolio-block">
	    <div class="container ">
	        <div class="avatar"></div>
	        <div>
	        	<p>Il portafoglio virtuale <strong>Virtual Wallet</strong> permetterà senza problemi acquisti e transazioni tra utenti e siti web che approvano il nostro progetto! </p>
	        	
	        	  	<c:if test="${logged==null }">
           				<a class="btn btn-primary myRoundButton" role="button" href="sign-up">Iscriviti</a>
           			</c:if>
           			 <c:if test="${logged!=null }">
                    	<a class="btn btn-primary myRoundButton" role="button" href="signin">Il mio profilo</a>
                    </c:if>
                		
                			
				
	        </div>
	    </div>
	</section>
	<section >
	    <div class="container">
	    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="Images/transazioni.png" alt="First slide">
       
    </div>
    <div class="carousel-item">
      <img class="d-block w-100"src="Images/Interagisci.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100"  src="Images/ricarica.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	        
	    </div>
	    </section>
	
	<section class="section-border">
	    <div class="container space-padding">
	        <h1 class="space-padding">Custodisci i tuoi risparmi in totale sicurezza!</h1>
	        <div class="row">
	            <div class="col-md-4">
					<div id="f1_container">
						<div id="f1_card" class="shadow">
						  <div class="front face">
						    <img src="Images/conserva.jpg" class="card-flip-image" width="300px" height="250px">
						  </div>
						  <div class="back face center">
						     	<h1>Custodisci il tuo denaro!</h1> 
					      		<p>Tieni sempre aggiornato il tuo saldo con pochi click.</p> 
						  </div>
						</div>
					</div>
	                
	            </div>
	            <div class="col-md-4">
					<div id="f1_container">
						<div id="f1_card" class="shadow">
						  <div class="front face">
						    <img src="Images/sicurezza.jpg" class="card-flip-image" width="300px" height="250px">
						  </div>
						  <div class="back face center">
						     	<h1>Non avrai problemi!</h1> 
					      		<p>È tutto in totale sicurezza! Solo tu potrai accedere al tuo portafoglio.</p>  
						  </div>
						</div>
					</div>
	                
	            </div>
	               
					<div id="f1_container">
						<div id="f1_card" class="shadow">
						  <div class="front face">
						    <img src="Images/trasferisci.jpg" class="card-flip-image" width="300px" height="250px">
						  </div>
						  <div class="back face center">
						     	<h1>Trasferisci!</h1> 
					      		<p>Trasferisci il tuo denaro a chi preferisci. Scambiare denaro con gli amici non è mai stato così semplice.</p> 
						  </div>
						</div>
					</div>
					
	            </div>
	           
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