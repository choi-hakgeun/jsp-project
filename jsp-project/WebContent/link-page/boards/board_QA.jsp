<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_QA</title>
<script src='/lib/script/jquery-3.4.1.js'></script>
<link href="/lib/css/bootstrap.min.css" rel="stylesheet">
<script src='/lib/script/bd_select.js'></script>
<link rel="stylesheet" href="/lib/css/board_e.css" />

</head>
<body>
	
	<div class="container" style="background: rgba(255,255,255,0.9); height: 700px; border-radius: 10px 10px 10px 10px;">
		<h3>Q&A</h3>
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
				<div class="item" onclick="viewQ('${vo.n_serial}')" >
					<div class="col-xs-2">
						<span>${vo.n_serial }</span>
					</div>
					<div class="col-xs-4">
						<span style="white-space:nowrap; width:50px; text-overflow: ellipsis; overflow: hidden;">${vo.n_title }</span>
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
					<c:choose>
						<c:when test="${vo.answer == 0 }">
							<button type="button" class="btn btn-default" style="background-color:gray; color:white; cursor: default;">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 대기
							</button>
						</c:when>
						<c:when test="${vo.answer == 1 }">
							<button type="button" class="btn btn-default" style="background-color:#8181F7; color:white; cursor: default;">
								<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 완료
							</button>
						</c:when>
					</c:choose>
				</div>
				<hr width="97%">
			</c:forEach>
		</div>
	</div>
		<div align="center">
			<div id="paging">
			<c:if test="${p.nowPage > p.blockSize }">
				<input type="button" value="처음" onclick="goPageQ(1)">
			</c:if>
			<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
				<input type="button" value="${i }" ${(i==p.nowPage)? "class='here'" : "" } onclick="goPageQ(${i})">
			</c:forEach>
			<c:if test="${p.nowPage < p.totPage }">
				<input type="button" value="다음" onclick="goPageQ(${p.nowPage+1})">
			</c:if>
		</div>
	</div>
	
	<form id="frm_select" name="frm_select" method="post">
		<input type="hidden" id="serial" name="serial" value="${vo.n_serial }">
		<input type="hidden" id="nowPage" name="nowPage" value="${empty param.nowPage? 1 : param.nowPage }">
	</form>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/lib/script/bootstrap.min.js"></script>
</body>
</html>