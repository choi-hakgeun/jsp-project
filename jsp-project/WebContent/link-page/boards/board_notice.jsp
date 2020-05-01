<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_notice</title>
<script src='/lib/script/jquery-3.4.1.js'></script>
<link href="/lib/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/lib/css/board_e.css" />
<script src='/lib/script/bd_select.js'></script>	

</head>
<body>


	<div class="container" style="background: rgba(255,255,255,0.9); height: 700px; border-radius: 10px 10px 10px 10px;">
		<h3>공지사항</h3>
		<hr>
		<div class="row" id="bdTop">
			<div class="col-xs-2">
				<span>번호</span>
			</div>
			<div class="col-xs-4">
				<span>제목</span>
			</div>
			<div class="col-xs-2">
				<span>작성자</span>
			</div>
			<div class="col-xs-2">
				<span>작성일</span>
			</div>
			<div class="col-xs-1">
				<span>조회</span>
			</div>
		</div>
		<hr>
		<!-- 글 내용 -->
		<div class="row" id="bdCenter">
			
			<c:forEach var="vo" items="${BDlist }">
				<div class="item" onclick="viewN('${vo.n_serial}')" >
					<div class="col-xs-2">
						<span>${vo.n_serial }</span>
					</div>
					<div class="col-xs-4">
						<span>${vo.n_title }</span>
					</div>
					<div class="col-xs-2">
						<span>${vo.m_name }</span>
					</div>
					<div class="col-xs-2">
						<span>${vo.n_date }</span>
					</div>
					<div class="col-xs-1">
						<span>${vo.n_count }</span>
					</div>
				</div>
				<hr width="97%">
			</c:forEach>
		</div>
		
		
	<div id="paging">
		<div align="center">
			<c:if test="${p.nowPage > p.blockSize }">
				<input type="button" value="처음" onclick="goPageN(1)">
			</c:if>
			<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
				<input type="button" value="${i }" ${(i==p.nowPage)? "class='here'" : "" } onclick="goPageN(${i})">
			</c:forEach>
			<c:if test="${p.nowPage < p.totPage }">
				<input type="button" value="다음" onclick="goPageN(${p.nowPage+1})">
			</c:if>
		</div>
	</div>
		
		
	</div>
	<form id="frm_select" name="frm_select" method="post">
		<input type="hidden" id="serial" name="serial" value="${vo.n_serial }">
		<input type='hidden' name='nowPage' id='nowPage' value='${empty param.nowPage? 1 : param.nowPage }'> 
		
	</form>
	
	



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/lib/script/bootstrap.min.js"></script>
</body>
</html>