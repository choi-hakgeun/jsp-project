/**
 * 
 */

let btnFunc = function() {
	// 검색창
	if($('#findStr99') != null){
		$('#findStr99').keydown(function(key) {
			let find = $('#findStr99').val();
			if(key.keyCode == 13){	
				if(localStorage.getItem("findStr") == null){
					var arr = new Array();
					arr.push(find);
					localStorage.setItem("findStr",JSON.stringify(arr));
				}else{
					var arr =JSON.parse(localStorage.getItem("findStr"));
					if(arr.length >5){
						arr.splice(0,1);					
						arr.push(find);
						localStorage.setItem("findStr",JSON.stringify(arr));
					}else{						
						arr.push(find);
						localStorage.setItem("findStr",JSON.stringify(arr));	
					}
				}
				
				$('#frm').attr('action','Content_select.mm').submit();

			}			
		})
	}
	
	if($('#findStr') != null){
		$('#findStr').keydown(function(key) {
			let find = $('#findStr').val();
			if(key.keyCode == 13){
				if(localStorage.getItem("findStr") == null){
					var arr = new Array();
					arr.push(find);
					localStorage.setItem("findStr",JSON.stringify(arr));
				}else{
					var arr =JSON.parse(localStorage.getItem("findStr"));
					if(arr.length >5){
						arr.splice(0,1);					
						arr.push(find);
						localStorage.setItem("findStr",JSON.stringify(arr));
					}else{						
						arr.push(find);
						localStorage.setItem("findStr",JSON.stringify(arr));	
					}
				}
				$('#frm').attr('action','Content_select.mm').submit();

			}			
		})
	}
} // end of btnFunc

