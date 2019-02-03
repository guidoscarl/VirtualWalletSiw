function login(){
	
	var emaill =$("#email").val();
	var passwordd =$("#password").val();
	
	
	$.ajax({
		method:"post",
		url: "signin",
		datatype:"JSON",
		data:{email:emaill,password:passwordd},
		success: function(data){
			
			 if(data=="no"){
					$("#error").css("visibility","visible");
					
				}
				 
			 else{
						$(location).attr("href","account.jsp");
						
					}
				
		}
	});
		
	
}



