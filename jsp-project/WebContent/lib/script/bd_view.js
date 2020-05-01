/**
 * 
 */
let md = function(){
	$('#modifyBtn').click(function(){
		$('#frm_viewbrd').attr('action', 'Board_modify.sb').submit();
	})

	$('#deleteBtn').click(function(){ // 시리얼값 해야댐
		$('#frm_viewbrd').attr('action', 'Board_delete.sb').submit();
	})

	$('#BtnRpl').click(function(){
		$('#rpl_frm').attr('action', 'Reply_insert.sb').submit();
	});
	
	$('#rpl_modify').click(function(){
		$('#oldRpl_frm').attr('action', 'Reply_modify.sb').submit();
	})
	
}

let del = function(){
	var c =  confirm("삭제하시겠습니까?");
	if(c){
		$('#oldRpl_frm').attr('action', 'Reply_delete.sb').submit();
	}else{
		alert("삭제 취소 ^^");
	}
}

let refresh = function(){
	console.log("댓글 새로고침");
	location.reload();
}

