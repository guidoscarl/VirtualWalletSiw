function checkEmail(){
	
	
	var email=$("#email").val();
	$("#button").removeAttr("disabled");
	
	if(email==""){
		
		$("#button").attr("disabled","disabled");
		$("#control").text("Inserisci un indirizzo e-mail valido");
		$("#control").css("visibility","visible");
		
	}
	else{
		$("#control").css("visibility","hidden");
	$.ajax({
		type: "POST",
		url: "checkDate",
		data:{em:email},
		success: function(data){
			
			if(data=="exist"){
				$("#control").text("Indirizzo email gia' presente nel sistema");
				$("#control").css("visibility","visible");
				$("#button").attr("disabled","disabled");
			}
			else{
				$("#button").removeAttr("disabled");
				$("#control").css("visibility","hidden");
			}
			
		}
	});
	}
}