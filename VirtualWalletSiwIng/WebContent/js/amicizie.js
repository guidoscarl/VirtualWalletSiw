function accetta(id){
	
	var number=id;
	$.ajax({
		method:"POST",
		url:"accetta",
		datatype:"JSON",
		data:{id:number},
		success:function(data){
			
			var r=document.getElementById(id);
			if(r!==null){
				r.style.display="none";
				}
				
				var delButton = $("#delbutton"+id);
				if(delButton.length){
					delButton.css("display","none");
				}
				var confButton= $("#confbutton"+id);
				if(confButton.length){
					confButton.css("display","none");
					$.alert({
					    title: 'Amicizia confermata!',
					    content: 'Richiesta di amicizia accettata correttamente'
					});
				}
			
		}
	});
	
	
}

function rifiuta(id){
	alert("rifiuta");
	var number=id;
	$.ajax({
		method:"POST",
		url:"rifiuta",
		datatype:"JSON",
		data:{id:number},
		success:function(data){
			
			var r=document.getElementById(id);
			if(r!==null){
			r.style.display="none";
			}
			
			var delButton = $("#delbutton"+id);
			if(delButton.length){
				delButton.css("display","none");
			}
			var confButton= $("#confbutton"+id);
			if(confButton.length){
				confButton.css("display","none");
				$.alert({
				    title: 'Richiesta rifiutata!',
				    content: 'Richiesta di amicizia respinta correttamente'
				});
			}
			
		}
	});
}

function deleteRequest(id){
	var number=id;
	$.ajax({
		method:"POST",
		url:"rifiuta",
		datatype:"JSON",
		data:{id:number},
		success:function(data){
			
			var r=document.getElementById(id);
			if(r!==null){
			r.style.display="none";
			}
			
			var delButton = $("#ref"+id);
			if(delButton.length){
				delButton.css("display","none");
				$.alert({
				    title: 'Richiesta annullata!',
				    content: 'Richiesta di amicizia annullata correttamente'
				});
			}
			
			
		}
	});
	
}

function deleteFromProfile(id){
	deleteRequest(id);
	$.confirm({
	    title: 'Rimosso dagli amici',
	    content: 'Rimozione avvenuta correttamente',
	    buttons: {
	        home: function () {
	        	$(location).attr("href","account");
	        },
	    }
	});
}

function deleteReqFromProfile(id){
	deleteRequest(id);
	$.confirm({
	    title: 'Richiesta annullata',
	    content: 'Richiesta di amicizia annullata correttamente',
	    buttons: {
	        home: function () {
	        	$(location).attr("href","account");
	        },
	    }
	});
}

function rejectFromProfile(id,email){
	
	var ind ="viewProfile?email=".concat(email);
	rifiuta(id);
	$.confirm({
	    title: 'Richiesta rifiutata',
	    content: 'Richiesta di amicizia rifiutata correttamente',
	    buttons: {
	        home: function () {
	        	$(location).attr("href",ind);
	        },
	    }
	});
}

function acceptFromProfile(id,email){
	
	alert("acceptfrompt");
	var ind ="viewProfile?email=".concat(email);
	accetta(id);
	$.confirm({
	    title: 'Richiesta accettata',
	    content: 'Richiesta di amicizia accettata correttamente',
	    buttons: {
	        home: function () {
	        	$(location).attr("href",ind);
	        },
	    }
	});
	
}
