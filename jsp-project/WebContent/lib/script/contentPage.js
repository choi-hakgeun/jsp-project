



// 코멘트 더 보기 했을때 액션
let commentMore = function(cId) {
	$('#cId').val(cId);
	$('#frm2').submit();
}

// 별점에 마우스 호버시 액션
$('.rating-group span').hover(function() {
	let index = $(this).index() + 1;
	// $(".hover-stars-group").attr("class", "hover-stars-group"+index);
	$(".hover-stars-group").addClass("hover-stars-group" + index);

}, function() {
	let index = $(this).index() + 1;
	$(".hover-stars-group").removeClass("hover-stars-group" + index);
}) // end of hover


// 별점을 눌렀을때 액션
$('.rating-group span').click(function() {
	if(sessionStorage.getItem("mId") != null){
		var index = $(this).index() + 1;
		let array = $(".hover-stars-group").attr("class").split(" ");
		let cId = $('#cId').val();
		var category;
		
		if($('#category').val() == '드라마'){
			category = 1;
		} else {
			category = 0;
		}
		
		if ($(".hover-stars-group").hasClass("active" + index)) {
			$(".hover-stars-group").removeClass("active" + index);
			$.ajax({
				type : 'post',
				url : 'newInterest.sc',
				data : {
					mId : sessionStorage.getItem("mId"),
					'cId' : cId,
					score : 0,
					create : 'no',
					category : category
				},
				success : function(data) {
				}
			}) // end of ajax
			$('.rating-comment').attr("style", "display:none;");
		} else if($(".hover-stars-group").attr('class').indexOf("active") >= 0) {
			$(".hover-stars-group").removeClass("active1");
			$(".hover-stars-group").removeClass("active2");
			$(".hover-stars-group").removeClass("active3");
			$(".hover-stars-group").removeClass("active4");
			$(".hover-stars-group").removeClass("active5");
			$(".hover-stars-group").addClass("active" + index);
			$.ajax({
				type : 'post',
				url : 'newInterest.sc',
				data : {
					mId : sessionStorage.getItem("mId"),
					'cId' : cId,
					score : index,
					create : 'no',
					category : category
				},
				success : function(data) {
				}
			}) // end of ajax
			$('.rating-comment').attr("style", "display:block;")
		} else {
			$(".hover-stars-group").addClass("active" + index);
			$.ajax({
				type : 'post',
				url : 'newInterest.sc',
				data : {
					mId : sessionStorage.getItem("mId"),
					'cId' : cId,
					score : index,
					create : 'new',
					category : category
				},
				success : function(data){
				} // end of success
			}) // end of ajax
			$('.rating-comment').attr("style", "display:block;")
		} // end of if else
	} else {
		alert("로그인을 해주세요~")
	} // end of if else
}) // end of star click


$(document).ready(function(){
	$('#btnInterest').click(function(){
		$('#interest-modal-want').click();
	})

	$('#interest-modal-want').on('click', function(){

		if(sessionStorage.getItem("mId")!= null){
			let category = 0;
			
			if($('#category').val() == '드라마'){
				category = 1;
			} else {
				category = 0;
			} // end of if
			
			$.ajax({
				type : 'post',
				url : '/contentPage',
				data : {
					mId : sessionStorage.getItem("mId"),
					cId : $('#cId').val(),
					interest : '2' ,
					create : "c",
					'category' : category
				}, // end of data
				success : function(data){
					$('#interest_setting').modal('hide');
				} // end of success
			}) // end of ajax
		} else {
			alert("로그인을 해주세요");
			$('#interest_setting').modal('hide');
		}
	}) // end of on
	
		$('#interest-modal-ing').on('click', function(){
			if(sessionStorage.getItem("mId")!=null){
				let category = 0;
				
				if($('#category').val() == '드라마'){
					category = 1;
				} else {
					category = 0;
				} // end of if
				
				$.ajax({
					type : 'post',
					url : '/contentPage',
					data : {
						mId : sessionStorage.getItem("mId"),
						cId : $('#cId').val(),
						interest : '1' ,
						create : "c",
						'category' : category
					}, // end of data
					success : function(data){
						$('#interest_setting').modal('hide');
					} // end of success
				}) // end of ajax
			} else {
				alert("로그인을 해주세요");
				$('#interest_setting').modal('hide');
			}
		
	}) // end of on
	
	$('#interest-none').on('click', function(){
		if(sessionStorage.getItem("mId")!=null){
			let category = 0;
			
			if($('#category').val() == '드라마'){
				category = 1;
			} else {
				category = 0;
			} // end of if
			
			$.ajax({
				type : 'post',
				url : '/contentPage',
				data : {
					mId : sessionStorage.getItem("mId"),
					cId : $('#cId').val(),
					interest : '3' ,
					create : "c",
					'category' : category
				}, // end of data
				success : function(data){
					$('#interest_setting').modal('hide');
				} // end of success
			}) // end of ajax
		} else {
			alert("로그인을 해주세요");
			$('#interest_setting').modal('hide');
		}
	}) // end of on
	
	// 코멘트 textarea 작성시
	$('#comment-textarea').keyup(function(){
		if($('#comment-textarea').val().trim() != ""){
			$('.insert-comment-ok').addClass("insert-comment-ok-create-button")
		} else {
			$('.insert-comment-ok-create-button').removeClass("insert-comment-ok-create-button")
		}
	})// 코멘트 textarea 작성시 끝
	$(document).on('click','.insert-comment-ok-create-button',function(){
		console.log($('#comment-textarea').val().trim());
				$.ajax({
					type : 'post',
					url : "newComment.sc",
					data : {
						mId : sessionStorage.getItem('mId'),
						cId : $('#cId').val(),
						content : $('#comment-textarea').val().trim()
					}
				}) // end of ajax
				$('#insert-comment').modal('hide');
			})
	
}) // end of ready
