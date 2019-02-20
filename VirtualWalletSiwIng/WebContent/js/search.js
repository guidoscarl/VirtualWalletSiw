function search(){
	var searchedd=$("#myInput").val();
	if(searched !=""){
	var list=$("#myList");
	//alert(list.html());
	
	$.ajax({
		type: "POST",
		 url: "search",
		 data: {searched: searchedd},
		 success: function(data){
			 
			 list.html(data);
		 }
	});
}
	
}