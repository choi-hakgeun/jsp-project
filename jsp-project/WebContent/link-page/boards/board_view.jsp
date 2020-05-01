<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_view</title>
<script src='/lib/script/jquery-3.4.1.js'></script>
<link href="/lib/css/bootstrap.min.css" rel="stylesheet">
<link href="/lib/css/bd_view.css" rel="stylesheet">
<script src="/lib/script/bd_view.js"></script>

</head>
<body>
	
	
	<div class="container"	>
		<div class="row" style="background-color: rgba(0,0,0,0.6)">
			
			<div style="height: 50px"></div>
			<span class="col-xs-12" style="font-size: 20px; font-weight: 700; color:white;">${vo.n_title }</span>
			<div align="right" id="who">
				<span >닉네임 ${vo.m_name}</span>
				<span >|   작성일 ${vo.n_date }</span>
				<span >|   조회 ${vo.n_count }</span>
			</div>
			<hr width="97%">
			<div id="content" class="col-xs-12">
				<span style="color:white; background-color: rgba(0,0,0,0.5);">${vo.n_content }</span>
			</div>
			<form id="frm_viewbrd" name="frm_viewbrd" method="post">
				<input type="hidden" name="brd_title" value="${vo.n_title }">
				<input type="hidden" name="brd_content" value="${vo.n_content }">
				<input type="hidden" name="brd_serial" value="${vo.n_serial }">
			</form>
		</div>
	

		<div align="right" id="Btns">
			<button type='button' id="modifyBtn">수정</button>
			<button type='button' id="deleteBtn">삭제</button>
		</div>

		<!-- 댓글 -->
		<div class="row" style="background-color: rgba(0,0,0,0.6);">
			<c:if test="${vo.n_category == 3 }">
				<hr>		
				<div class="col-xs-11">
					<span style="font-size:20px; color: white;">댓글</span>
				</div>	
				<div class="col-xs-1">
					<div class="glyphicon glyphicon-repeat" aria-hidden="true" id="refreshRpl" style="font-size: 15px; color: white; cursor: pointer;" onclick="refresh();"></div>
					
				</div>
			
			
				<!-- 기존 댓글 -->
				<c:forEach var="rpl" items="${rplList }" varStatus = "cnt">
					<form id="oldRpl_frm" name="oldRpl_frm" method="post">
						<div class="col-xs-12">
							<div class="col-xs-3">
								<img src="${rpl.r_photo }" onerror="this.src='/lib/images/userPhoto/default.png'" width="90px" height="90px">
								<span style="color:white; font-size: 20px;"><c:out value="${rpl.m_name }"/> </span>
							</div>
							<div class="col-xs-9">
								<span class="col-xs-12" style="color:white;"><c:out value="${rpl.r_reply }"/> </span>
								<span id = "rpl_bot">
									<span class="col-xs-11" style="color:white;">${rpl.r_time }</span>
									<!-- <span class="col-xs-1"><a id="rpl_modify">수정</a></span> -->
									<span class="col-xs-1" style="color:white; cursor: pointer;"><a id="rpl_delete" onclick="del();">삭제</a></span>
								</span>
							</div>
						</div>
						<input type="hidden" name="serial" value="${rpl.r_serial }">
						<input type="hidden" name="txt" value="${rpl.r_reply }">
						<input type="hidden" name="curId" id="curId">
						<input type="hidden" name="r_id" value="${rpl.r_id }">
						
					</form>
				</c:forEach>
			
					
				
				<!-- 댓글 기입창 -->
				<form id="rpl_frm" name="rpl_frm" method="post">
					<textarea rows="5px" cols="150px" class="col-xs-12" name="rpltxt" style="resize: none" name="rpl_text"></textarea>
					<div class="col-xs-12" align="right">
						<button type="button" id="BtnRpl">등록</button>
					</div>
					<input type="hidden" name="mid" id="mid" >
					<input type="hidden" name="serial" value="${vo.n_serial }">
				</form>
				
			</c:if>
		</div>
		
	</div>

	
	<script type="text/javascript">
		md();
		var mid = sessionStorage.getItem("mId");
		$("#mid").val(mid);
		$("#curId").val(mid);
		
		if(mid != '${vo.n_mid}'){
			$('#modifyBtn').hide();
			$('#deleteBtn').hide();
		}
		
		
		
		
	</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/lib/script/bootstrap.min.js"></script>
</body>
</html>