<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_general</title>
<script src='/lib/script/jquery-3.4.1.js'></script>
<link href="/lib/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/lib/css/board_e.css" />
<script type="/lib/script/board.js"></script>
<script src='/lib/script/bd_select.js'></script>
<link href="/lib/css/jquery.fallingsnow.css" rel="stylesheet">
<script src="/lib/script/jquery.fallingsnow.js"></script>
<script src="/lib/script/jquery.fallingsnow.min.js"></script>
</head>
<body>
	

		<div class="container" style="background: rgba(255,255,255,0.9); height: 700px; border-radius: 10px 10px 10px 10px;" >
		<h3>자유게시판</h3>
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
			
			<c:forEach var="vo" items="${BDlistG }">
				<div class="item" onclick="viewG('${vo.n_serial}')">
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
	</div>
	
	<div id="paging">
		<div align="center">
			<c:if test="${p.nowPage > p.blockSize }">
				<input type="button" value="처음" onclick="goPageG(1)">
			</c:if>
			<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
				<input type="button" value="${i }" ${(i==p.nowPage)? "class='here'" : "" } onclick="goPageG(${i})">
			</c:forEach>
			<c:if test="${p.nowPage < p.totPage }">
				<input type="button" value="다음" onclick="goPageG(${p.nowPage+1})">
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