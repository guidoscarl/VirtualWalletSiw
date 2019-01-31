function makeRecharge(){
	var email=$("#email").val();
	var pass=$("#password").val();
	var importoo=$("#importo").val();
	var sessionEmail=$("#email").attr("email");
	var sessionPass=$("#password").attr("password");
	var saldoo=$("#password").attr("saldo");
	if(email!=sessionEmail || pass!=sessionPass){
		$("#error").css("visibility","visible");
	}
	else{
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
}