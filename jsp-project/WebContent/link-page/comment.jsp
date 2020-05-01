<%@page import="bean.SCCommentVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.SCDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>부트스트랩 101 템플릿</title>
<!--  comment 20.03.24 -->
<!-- 부트스트랩 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<link href="../lib/css/bootstrap.min.css" rel="stylesheet">
	<link href="../lib/css/comment.css" rel="stylesheet">
	<link href="../lib/css/comment_top.css" rel="stylesheet">
	<script src="/lib/script/bootstrap.min.js"></script>
	<script src="/lib/script/comment.js"></script>
</head>
<body>
<%@include file="/link-page/comment_top.jsp" %>
	<%
		String cId = request.getParameter("cId");
		SCDao dao = new SCDao();
		List<SCCommentVo> list = dao.commentSelect(cId);
		request.setAttribute("list", list);
	%>
	<!-- comment_top 부분 start -->

	<!-- comment_top 부분 end -->
	<div class="container-fluid comment_title_start">

		<div class="row">
			<div class="col-xs-12">
				<div>
				
					<c:forEach var="item" items="${list }">
						<div class="row">
							<div class="col-xs-6 col-xs-offset-3 comment_border">
								<div class="row comment_box">
									<div class="comment_title_border">
										<div class="col-xs-9 comment_title">
											<div class="col-xs-3">
												<div>
													<a class="btn btn-default profile-img" href="#"	role="button"> 
														<c:choose>
															<c:when test="${item.photo == null }">
																<img src="/lib/images/기본이미지.png" class="img-circle" />
															</c:when>
															<c:otherwise>
																<img src="${item.photo }" class="img-circle" />
															</c:otherwise>
														</c:choose>
													</a>
												</div>
											</div>
											<div class="col-xs-6">
												<div id="title_border">
													<h4 id="title">${item.mId }</h4>
												</div>
											</div>
										</div>
										<div class="col-xs-3 comment_star">

											<c:choose>
												<c:when test="${item.interest == 1 }">
													<div id="star" style="width:100px">
														<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
														<span>보는중</span> </div>
												</c:when>
												<c:otherwise>
													<div id="star">
														<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
														<span>${item.score }</span> </div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="col-xs-12 comment_result text-center">
										<div id='result text-center'>
											<span>${item.content }</span>
										</div>
									</div>
									<div class="col-xs-12 comment_like_border">
										<div id="like_comment">
											<span class="glyphicon glyphicon-thumbs-up"
												aria-hidden="true"></span> <em id="${item.mId }">${item.like }</em>
										</div>
									</div>
									<div class="col-xs-12 like_button">
										<div id="like">
											<button type="button" id="btn_like" onclick="test('${item.mId}');">좋아요</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="commentHiddenCid" id="commentHiddenCid" value="${param.cId }" />
</body>
</html>