/**
 * 
 */

let viewE = function(serial) {
	
	$('#serial').val('e'+serial);
	$('#frm_select').attr('action', 'Board_view.sb').submit();
}
let viewG = function(serial) {
	
	$('#serial').val('g'+serial);
	$('#frm_select').attr('action', 'Board_view.sb').submit();
	

	
}
let viewN = function(serial) {
	
	$('#serial').val('n'+serial);
	$('#frm_select').attr('action', 'Board_view.sb').submit();
}
let viewQ = function(serial) {
	
	$('#serial').val('q'+serial);
	$('#frm_select').attr('action', 'Board_view.sb').submit();
}

let goPageE = function(nowPage){
	$('#nowPage').val(nowPage);
	$('#frm_select').attr('action', 'Board_selectE.sb').submit();
}

let goPageG = function(nowPage){
	$('#nowPage').val(nowPage);
	$('#frm_select').attr('action', 'Board_selectG.sb').submit();
}
let goPageN = function(nowPage){
	$('#nowPage').val(nowPage);
	$('#frm_select').attr('action', 'Board_selectN.sb').submit();
}
let goPageQ = function(nowPage){
	$('#nowPage').val(nowPage);
	$('#frm_select').attr('action', 'Board_selectQ.sb').submit();
}

