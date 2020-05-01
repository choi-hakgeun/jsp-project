let my_movies = function(){
	$('#rank5_more').click(function (){
		movies_more_frm.score.value = "5"
		$('#movies_more_frm').attr('action','my_movies_more.he').submit();
	})
	
	$('#rank4_more').click(function (){
		movies_more_frm.score.value = "4"
		$('#movies_more_frm').attr('action','my_movies_more.he').submit();
	})
	
	$('#rank3_more').click(function (){
		movies_more_frm.score.value = "3"
		$('#movies_more_frm').attr('action','my_movies_more.he').submit();
	})
	
	$('#rank2_more').click(function (){
		movies_more_frm.score.value = "2"
		$('#movies_more_frm').attr('action','my_movies_more.he').submit();
	})
	
	$('#rank1_more').click(function (){
		movies_more_frm.score.value = "1"
		$('#movies_more_frm').attr('action','my_movies_more.he').submit();
	})
}