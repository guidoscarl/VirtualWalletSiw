function accetta(id){
	
	var number=id;
	$.ajax({
		method:"POST",
		url:"accetta",
		datatype:"JSON",
		data:{id:number},
		success:function(data){
			
			var r=document.getElementById(id);
			r.style.display="none";
			var delButton = $("#delbutton"+id);
			delButton.css("display","none");
			var confButton= $("#confbutton"+id);
			confButton.css("display","none");
			$.alert({
			    title: 'Amicizia confermata!',
			    content: 'Richiesta di amicizia accettata correttamente'
			});
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
			r.style.display="none";
			var delButton = $("#delbutton"+id);
			delButton.css("display","none");
			var confButton= $("#confbutton"+id);
			confButton.css("display","none");
			$.alert({
			    title: 'Richiesta rifiutata!',
			    content: 'Richiesta di amicizia respinta correttamente'
			});
		}
	});
}