let select = function() {
	let mId = sessionStorage.getItem("mId");
	
	if(mId == 'admin@admin.com'){
		alert("관리자로 로그인 하셨습니다");
		location.href = '/link-page/manager/manager_main.jsp'
	} else {
		$('#m_main_frm_mId').val(mId); 	
		$('#m_main_frm').attr('action', 'select.hg').submit();
	}
}

let m_btnFunc = function(){
	/*if( $('#btn_main_login')!=null){ 
		$('#btn_main_login').click(function(){			
			alert("1234");
			$('#login_modal_form').attr('action', 'login.hg').submit();			
		})
	}*/
	
	
	if( $('#m_btnView')!=null){ 
		$('#m_btnView').click(function(){			
			$('#member_view_modal').on('show.bs.modal');			
		})
	}
	
	if( $('#m_btnModify')!=null){
		$('#m_btnModify').click(function(){
			let mId = sessionStorage.getItem("mId");
			$('#m_modify_mId').val(mId);
			let formData = $('#m_modify_frm')[0];
			let data = new FormData(formData);
			console.log(data);
			
			$.ajax({
				type:'post',
				url:'modifyR.hg',
				'data' : data,
				contentType : false,
				processData : false,
				success : function(){
					$('#testModal').modal('show');
				}
			})
			
			
			/*let mId = sessionStorage.getItem("mId");
			$('#m_modify_mId').val(mId);
			$('#m_modify_frm').attr('action', 'modifyR.hg').submit();*/
			
			/*var form = $("#m_modify_frm")[0];
			var formData = new FormData(form);
			formData.append("file", $("#exampleInputFile")[0].file[0]);
			$.post('/link-page/m_modify.jsp', d, function(data) {
			}*/
		})
	}
	
	$('#member_modifyR_modal').click(function(){
		setTimeout(function() {
			select();
			}, 1500);
	});
	
	if($('#m_btnDelete')!=null){
		$('#m_btnDelete').click(function(){
			let d = $('#m_delete_frm').serialize();
			$.post('/link-page/m_delete.jsp', d, function(data) {
				if($.trim(data)=="true"){
					$('#d_t').trigger("click");
				}else{					
					$('#d_f').trigger("click");
				}
			})
		})
	}	
	
	$('#member_delete_modal3').click(function(){
		$('#m_delete_frm').attr('action', 'deleteR.hg').submit();
		sessionStorage.removeItem("mId"); //세션스토리지 아이디 삭제
		location.replace('index.jsp'); //기존정보 삭제 후 인덱스 페이지로(뒤로가기불가)		
	})
	
	if($('#exampleInputFile') !=null ){
		$('#exampleInputFile').change(function (event){
			let ele = event.target
			let url = ele.files[0];
			
			let reader = new FileReader();
			reader.readAsDataURL(url);
			
			reader.onload = function(e){
				let img = new Image();
				img.src = e.target.result;				
				$('#mPhoto').attr('src', img.src);
			}
			
		})
	}
}