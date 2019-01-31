
function signUp(){
	
	var emaill =$("#email").val();
	var passwordd =$("#password").val();
	var namee=$("#name").val();
	var surnamee=$("#surname").val();
	
	
	if(emaill=="" || passwordd=="" || namee=="" || surnamee==""){
		$("#control").text("Campi obbligatori.");
		$("#control").css("visibility","visible");
	}
	
	else{
	
	$.ajax({
		method:"post",
		url: "SignupServlet",
		datatype:"JSON",
		data:{email:emaill,password:passwordd,name:namee,surname:surnamee},
		success: function(data){
			
			if(data=="ok"){
				$.confirm({
				    title: 'Fatto',
				    content: 'Registrazione effettuata correttamente',
				    buttons: {
				        home: function () {
				        	$(location).attr("href","home.jsp");
				        },
				    }
				});
			}
				
			else{
				
				$("#control").text("Indirizzo email gia' presente nel sistema.");
				$("#control").css("visibility","visible");
			}
				
		}
	});
	}
}

function checkPassword(){
	var pass=$("#password").val();
	var passConf=$("#passwordConf").val();
	if(pass!=passConf){
		$("#controlPass").css("visibility","visible");
		$("#button").attr("disabled","disabled");
	}
	else{
		
			$("#controlPass").css("visibility","hidden");
			$("#button").removeAttr("disabled");
		}
}