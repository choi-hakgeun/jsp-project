<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-12 text-center">
	<h3>${ msg }</h3>
	<form name="frm" id="frm" method="post">
		<input type='hidden' name="findStr" value="${ param.findStr }" />
		<button type="button" class="btn btn-default btn-lg" name="btn_member_modi_back" id="btn_movieActor_back">뒤로</button>
	</form>
</div>
<script>
btnFunc()
</script>
