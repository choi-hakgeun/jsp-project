/**
 * 
 */

let mR = function(){
	
	$('#mdfBtn').click(function(){
		console.log("클릭");
		$('#frm_mdfbrd').attr('action', 'Board_modifyR.sb').submit();
	})
}

