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

function checkEmail(){
	
}