function search(){
	var searchedd=$("#myInput").val();
	var list=$("#myList");
	
	$.ajax({
		type: "POST",
		 url: "search",
		 data: {searched: searchedd},
		 success: function(data){
			 
			 list.html(data);
		 }
	});
}