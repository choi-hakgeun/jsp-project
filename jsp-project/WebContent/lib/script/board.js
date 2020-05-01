/**
 * 
 */

let Func= function(){
	
	//select
	$('#general').click(function() {
		$('#bd_frm').attr('action', 'Board_selectG.sb').submit();
	})
	$('#event').click(function() {
		$('#bd_frm').attr('action', 'Board_selectE.sb').submit();
	})
	$('#notice').click(function() {
		$('#bd_frm').attr('action', 'Board_selectN.sb').submit();
	})
	$('#QA').click(function() {
		$('#bd_frm').attr('action', 'Board_selectQ.sb').submit();
	})
	
	
	
	
	
}

function updateTime(){
	console.log("업데이트");
	let str = "";
	$.ajax({
		url:"/link-page/chatnow.jsp",
		type: "post",
		data: {},
		success:function(data){
			var obj = JSON.parse(data);
			
			$.each(obj, function(index, d){
					str += '<span style="color:white;" id="chat_id">';
					str	+= d.id;
					str	+= '</span>';
					str += ': ';
					str	+= '<span style="color:white;" id="chat_con">';
					str	+= d.content;
					str	+= '</span>';
					str	+= '<br/>';
				
			});
			$('#chat_center').html(str);
		}
	})
	
/*	$.getJSON("/link-page/chatnow.jsp",function(data){
		console.log("채팅 온");
			let str = "";
			
			$.each(data, function(index, d){
					str += '<span style="color:white;" id="chat_id">';
					str	+= d.id;
					str	+= '</span>';
					str	+= '<span style="color:white;" id="chat_con">';
					str	+= d.content;
					str	+= '</span>';
					str	+= '<br/>';
				
			});
			
			$('#chat_center').html(str);
			console.log("채팅나와");
		
	})*/
	
	
}
	


let chat_submit = function(){
	var queryString = $("#chat_frm").serialize();
	
	$.ajax({
		type : 'post',
		url : '/link-page/chat.jsp',
		data : queryString,
		dataType : 'json',
		success : function(json){
			let str = "";
			if(json.length > 0){
				for(let i = 0; i<json.length; i++){
					let d = json[i];
					str += '<span style="color:white;" id="chat_id">'
						+ d.ch_id
						+ '</span>'
						+ '<span style="color:white;" id="chat_con">'
						+ d.ch_content
						+ '</span>'
						+ '<br/>'
				}
				$('#chat_center').html(str);
			}
		}
	})
	$("#chat_txt").val('');
}



