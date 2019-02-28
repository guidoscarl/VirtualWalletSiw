function makeRecharge(){
	var email=$("#email").val();
	var pass=$("#password").val();
	var importoo=$("#importo").val();
	var sessionEmail=$("#email").attr("email");
	var sessionPass=$("#password").attr("password");
	var saldoo=$("#password").attr("saldo");
	$.ajax({
			method:"post",
			url:"recharge",
			datatype:"JSON",
			data:{email:sessionEmail,saldo:saldoo,importo:importoo},
			success:function(data){
				if(data=="ok")
					$(location).attr("href","confirm.html");
			}
		});
	
}

function close_popup() {
	var pop_up=$("#popup-form");
	pop_up.css("display","none");
}

function open_popup() {
	var email=$("#email").val();
	var pass=$("#password").val();
	var importoo=$("#importo").val();
	var sessionEmail=$("#email").attr("email");
	var sessionPass=$("#password").attr("password");
	var saldoo=$("#password").attr("saldo");
	if(email!=sessionEmail || pass!=sessionPass){
		$("#error").css("visibility","visible");
	} else {
		$("#error").css("visibility","hidden");
		var pop_up=$("#popup-form");
		pop_up.css("display","block");		
	}
}