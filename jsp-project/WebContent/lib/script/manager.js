let btnFunc = function(){
	if('#btn_member_Find' != null){
		$('#btn_member_Find').click(function(){
			$('#frm').attr('action', 'select.hkMm').submit();
		})
	}

	if('#btn_content_find' != null){
		$('#btn_content_find').click(function(){
			$('#frm').attr('action', 'select.hkMcon').submit();
		})
	}
	
	if('#btn_comment_find' != null){
		$('#btn_comment_find').click(function(){
			$('#frm').attr('action', 'select.hkMcom').submit();
		})
	}
	
	if('#btn_movieActor_find' != null){
		$('#btn_movieActor_find').click(function(){
			$('#frm').attr('action', 'select.hkMmov').submit();
		})
	}
	
	if ('#btn_member_select' != null){
		$('#btn_member_select').click(function(){
			$('#headFrm').attr('action', 'select.hkMm').submit();
		})
	}

	if('#btn_content_select' != null){
		$('#btn_content_select').click(function(){		
			$('#headFrm').attr('action', 'select.hkMcon').submit();
		})
	}

	if('#btn_content_insert' != null){
		$('#btn_content_insert').click(function(){
			$('#headFrm').attr('action', 'insert.hkMcon').submit();
		})
	}

	if('#btn_comment_select' != null){
		$('#btn_comment_select').click(function(){
			$('#headFrm').attr('action', 'select.hkMcom').submit();
		})
	}

	if('#btn_movieActor_select' != null){
		$('#btn_movieActor_select').click(function(){
			$('#headFrm').attr('action', 'select.hkMmov').submit();
		})
	}

	if('#btn_movieActor_insert' != null){
		$('#btn_movieActor_insert').click(function(){
			$('#headFrm').attr('action', 'insert.hkMmov').submit();
		})
	}

	if('#btn_member_modi'!= null){
		$('#btn_member_modi').click(function(){
			$('#frm').attr('action', 'modify.hkMm').submit();		
		})
	}

	if('#btn_member_del' != null){
		$('#btn_member_del').click(function(){
			$('#frm').attr('action', 'deleteR.hkMm').submit();		
		})
	}

	if('#btn_member_update' != null){
		$('#btn_member_update').click(function(){
			$('#frm').attr('action', 'modifyR.hkMm').submit();
		})
	}

	if('#btn_member_back' != null){
		$('#btn_member_back').click(function(){
			$('#frm').attr('action', 'select.hkMm').submit();
		})
	}

	if('#btn_content_modi' != null){
		$('#btn_content_modi').click(function(){
			$('#frm_con').attr('action', 'modify.hkMcon').submit();
		})
	}

	if('#btn_content_back' != null){
		$('#btn_content_back').click(function(){
			$('#frm_con').attr('action', 'select.hkMcon').submit();
		})
	}
	
	if('#btn_content_back' != null){
		$('#btn_content_back').click(function(){
			$('#frm_con').attr('action', 'select.hkMcon').submit();
		})
	}

	if('#btn_content_back' != null){
		$('#btn_content_back').click(function(){
			$('#frm').attr('action', 'select.hkMcon').submit();
		})
	}
	
	if('#btn_content_del' != null){
		$('#btn_content_del').click(function(){
			$('#frm').attr('action', 'deleteR.hkMcon').submit();
		})
	}

	if('#btn_content_update' != null){
		$('#btn_content_update').click(function(){
			$('#frm').attr('action', 'modifyR.hkMcon').submit();
		})
	}

	if('#btn_content_register' != null){
		$('#btn_content_register').click(function(){
			$('#frm').attr('action', 'insertR.hkMcon').submit();
		})
	}

	if('#btn_comment_modi' != null){
		$('#btn_comment_modi').click(function(){
			$('#frm').attr('action', 'modify.hkMcom').submit();		
		})
	}

	if('#btn_comment_back' != null){
		$('#btn_comment_back').click(function(){
			$('#frm').attr('action', 'select.hkMcom').submit();
		})
	}
	if('#btn_comment_update' != null){
		$('#btn_comment_update').click(function(){
			$('#frm').attr('action', 'modifyR.hkMcom').submit();
		})
	}

	if('#btn_comment_del' != null){
		$('#btn_comment_del').click(function(){
			$('#frm').attr('action', 'deleteR.hkMcom').submit();
		})
	}

	if('#btn_movieActor_register' !=null ){
		$('#btn_movieActor_register').click(function(){
			$('#frm').attr('action', 'insertR.hkMmov').submit();
		})
	}

	if('#btn_movieActor_back' != null){
		$('#btn_movieActor_back').click(function(){
			$('#frm').attr('action', 'select.hkMmov').submit();
		})
	}

	if('#btn_movieActor_modi' != null){
		$('#btn_movieActor_modi').click(function(){
			$('#frm').attr('action', 'modify.hkMmov').submit();
		})
	}

	if('#btn_movieActor_update' != null){
		$('#btn_movieActor_update').click(function(){
			$('#frm').attr('action', 'modifyR.hkMmov').submit();
		})
	}

	if('#btn_movieActor_del' != null){
		$('#btn_movieActor_del').click(function(){
			$('#frm').attr('action', 'deleteR.hkMmov').submit();
		})
	}
	
	if('#btnContentFile' != null){
		$('#btnContentFile').change(function(event){
			let ele = event.target;
			let url = ele.files[0];
			
			let reader = new FileReader();
			reader.readAsDataURL(url);
			
			reader.onload = function(ev){
				let img = new Image();
				img.src = ev.target.result;
				$('#c_image').attr('src', img.src);
			}
		})
	}
	
	if('#btnMovieActorFile' != null){
		$('#btnMovieActorFile').change(function(event){
			let ele = event.target;
			let url = ele.files[0];
			
			let reader = new FileReader();
			reader.readAsDataURL(url);
			
			reader.onload = function(ev){
				let img = new Image();
				img.src = ev.target.result;
				$('#a_photo').attr('src', img.src);
			}
		})
	}

}

let member_view = function(m_mId){
	$('#m_mId').val(m_mId);
	$('#frm').attr('action', 'view.hkMm').submit();
}

let content_view = function(c_id){
	$('#c_id').val(c_id);
	$('#frm').attr('action', 'view.hkMcon').submit();
}

let comment_view = function(com_mId){
	$('#com_mId').val(com_mId);
	$('#frm').attr('action', 'view.hkMcom').submit();
}

let movieActor_view = function(a_id){
	$('#a_id').val(a_id);
	$('#frm').attr('action', 'view.hkMmov').submit();
}