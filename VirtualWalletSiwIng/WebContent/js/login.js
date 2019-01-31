function login(){
	
	alert("oklogin");
	var emaill =$("#email").val();
	var passwordd =$("#password").val();
	
	
	$.ajax({
		method:"post",
		url: "signin",
		datatype:"JSON",
		data:{email:emaill,password:passwordd},
		success: function(data){
			
			if(data=="ok")
				$(location).attr("href","account.jsp");
			
			else if(data=="no"){
				$("#error").css("visibility","visible");
			}
				
		}
	});
		
	
}



