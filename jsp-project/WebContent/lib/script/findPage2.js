/**
 * http://usejsdoc.org/
 */

let goContents = function(cid){
	$('#cId').val(cid);
	$('#mId').val(sessionStorage.getItem("mId"));
	$('#frm2').submit();
}

$(document).ready(function(){
	$('#movie-more').attr("href","/link-page/more-movie.jsp?category=0&cName="+$('#findStr').val());
	$('#drama-more').attr("href","/link-page/more-drama.jsp?category=1&cName="+$('#findStr').val());
})