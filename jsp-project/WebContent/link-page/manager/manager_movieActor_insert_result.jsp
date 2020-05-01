<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-12 text-center">
	<%
		String msg = (String)request.getAttribute("msg");
	%>
	<h3><%=msg %></h3>
	<form name="frm" id="frm" method="post">
		<button type="button" class="btn btn-default btn-lg" id="btn_movieActor_back">뒤로</button>
		<input type="hidden" name="findStr" value="${ findStr }" />
	</form> 
</div>
<script>
	btnFunc()
</script>
