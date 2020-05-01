/**
 * http://usejsdoc.org/
 */

let test = function(mId){
	$.ajax({
		type : 'get',
		url : "commentLike.sc",
		data:{
			'mId' : mId ,
			"cId" : $('#commentHiddenCid').val() ,
			"sendMid" : sessionStorage.getItem("mId")
		}, // end of data
		success:function(data){
			if(data == "false"){
				alert("자신의 코멘트는 좋아할수없습니다");
			} else {
				document.getElementById(mId).innerText = data;
			}
		} // end of success
	})
}
