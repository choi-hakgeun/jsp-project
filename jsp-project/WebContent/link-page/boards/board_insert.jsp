<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_insert</title>
<script src='/lib/script/jquery-3.4.1.js'></script>
<link href="/lib/css/bootstrap.min.css" rel="stylesheet">
<script src='/lib/script/bd_insert.js'></script>

</head>
<body>

	<div class="container">
		<div class="row">
			<div align="center">
				<h3>글 작성 ${sessionScope.mId }</h3>
			</div>
			
			<form id="frm_addbrd" name="frm_addbrd" method="post">
				<div align="center">
						<select name="category" style="height: 26px;">
							<option value="1" id="cn" style="display:none;">공지사항</option>
							<option value="2">Q&A</option>
							<option value="3" selected>자유게시판</option>
							<option value="4" id="ce" style="display:none;">이벤트</option>
						</select>
						
						
					
					<input type="text" name="brd_title" placeholder="글 제목" style="width: 800px;">
				</div>
				<hr width="80%">
				<div align="center">
					<textarea name="brd_content" rows="20px" cols="130px" style="resize: none;"></textarea>
				</div>
				<br>
				<div align="center">
					<input type="button" id="add_brd" value="등록">
				</div>
				<input type="hidden" id="brd_mid" name="brd_mid"  >
			</form>
			
		</div>
	</div>

<script type="text/javascript">
	insert();
	
	var mid = sessionStorage.getItem("mId");
	$('#brd_mid').val(mid);
	
	if(mid=="seecha@naver.com"){
		$('#cn').show();
		$('#ce').show();
	}else{
		$('#cn').hide();
		$('#ce').hide();
	}
	

</script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/lib/script/bootstrap.min.js"></script>
</body>
</html>