function checkImport(){
	
	var importo=$("#import").val();
	var saldo=$("#import").attr("saldo");
	
	if(saldo-importo>=0){
		$("#buttonTR").removeAttr("disabled");
		$("#buttonRC").css("visibility","hidden");
		$("#error").css("visibility","hidden");
	}
	else{
		$("#buttonTR").attr("disabled","disabled");
		$("#buttonRC").css("visibility","visible");
		$("#error").css("visibility","visible");
	}
}


function doRecharge(){
	window.location.href="recharge.jsp";
	
}

function doTransaction(){
	
	var importoo=$("#import").val();
	var emaill=$("#email").val();
	var nome=$("#nome").val();
	var cognome=$("#cognome").val();
	
	if(importoo=="" || emaill=="" || nome=="" || cognome==""){
		$("#error").css("visibility","visible");
		$("#error").text("Campi obbligatori.");
	}
	else{
	
	$.ajax({
		method:"post",
		url:"transaction",
		datatype:"JSON",
		data:{email:emaill,importo:importoo},
		success:function(data){
			if(data=="confirm"){
				$(location).attr("href","confirm.html");
			}
			else if(data=="failed"){
				$("#error").text("Indirizzo email destinatario non esistente.");
				$("#error").css("visibility","visible");
			}
			else if(data=="notfriend"){
				$("#error").text("Contatto non presente nella lista amici.");
				$("#error").css("visibility","visible");
			}
		}
	});
	}
}