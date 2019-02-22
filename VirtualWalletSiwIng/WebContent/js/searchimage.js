function searchIm(email){
	var flickerAPI = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&tags=" + $("#searched").val();
	var html="";
	$.ajax({
	url: flickerAPI,
	dataType: "jsonp", 
	jsonpCallback: 'jsonFlickrFeed', 
	success: function (result, status, xhr) {
	$.each(result.items, function (i, item) {
	html+="<img src=\""+item.media.m+"\" height=\"300\" width=\"300\">";
	var but="<button class=\"friendButton\" id=\"confbutton${rec.id }\" style=\"background-image:url(&quot;Images/accept.png&quot;);\" onclick=\"var source='"+item.media.m+"';changeImage('"+email+"',source);\"  ></button>";
	html+=but;
	if (i === 10) {
	$("#formim").html(html);
	return false;
	
	}
	});
	},
	error: function (xhr, status, error) {
	console.log(xhr)
	$("#outputDiv").html("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText)
	}
	});
}

function changeImage(email,source){
	$.ajax({
		method:"POST",
		url:"ChangeImage",
		data:{src:source,em:email},
		success:function(data){
			$.confirm({
			    title: 'Fatto',
			    content: 'Immagine del profilo aggiornata correttamente',
			    buttons: {
			        home: function () {
			        	$(location).attr("href","account");
			        },
			    }
			});
		}
	});
}