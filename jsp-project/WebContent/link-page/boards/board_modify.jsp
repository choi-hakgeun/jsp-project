<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_modify</title>
<script src='/lib/script/jquery-3.4.1.js'></script>
<link href="/lib/css/bootstrap.min.css" rel="stylesheet">
<script src='/lib/script/bd_modify.js'></script>
<link href="/lib/css/jquery.fallingsnow.css" rel="stylesheet">
<script src="/lib/script/jquery.fallingsnow.js"></script>
<script src="/lib/script/jquery.fallingsnow.min.js"></script>
</head>
<body>


	<div class="container">
		<div class="row">
			<div align="center">
				<h3>글 수정</h3>
			</div>
			
			<form id="frm_mdfbrd" name="frm_mdfbrd" method="post">
				<div align="center">	
					<input type="text" placeholder="제목" style="width: 850px;" name="title"  value="${vo.n_title}">
				</div>
				<hr width="80%">
				<div align="center">
					<textarea rows="20px" cols="130px" placeholder="나쁜말은 삼가해주세요" name="content" style="resize: none;" ><c:out value="${vo.n_content }"/></textarea>
				</div>
				
				<br>
				<div align="center">
					<input type="button" id="mdfBtn" value="수정">
				</div>
				
				<input type="hidden" name="brd_serial" value="${vo.n_serial }">
				
			</form>
			
		</div>
	</div>
	<script type="text/javascript">
	mR();
	</script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/lib/script/bootstrap.min.js"></script>	
</body>
</html>