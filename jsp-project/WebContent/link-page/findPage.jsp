<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>부트스트랩 101 템플릿</title>

<!-- 부트스트랩 -->
<link href="../lib/css/bootstrap.min.css" rel="stylesheet">
<link href="../lib/css/findPage.css" rel="stylesheet">
<script src="/lib/script/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="/lib/css/top.css" />
</head>

<body class=bd>
	<input type="hidden" name="findStr99" id="findStr99" value="${findStr }" />
	<%@ include file="top.html"%>
				<div style="position: relative;top: 90px;">
					<div class="container-fluid" >
						<div class="row" id="v">
							<div class="col-xs-12">
								<h4>상위 검색 결과</h4>
								<div class="tf">
									<!-- 상위 검색 결과 전체 묶는 div(최대 10개) -->
									
									<c:forEach var='v' begin="0" end="9" items="${list }">
										<div class="tf-s ${hidden }">
											<a href="javascript:goContents('${v.c_id }')" class="thumbnail">
												<img src="${v.c_image}" class="tf-img">
												<div class="mv-sf">
													<div class="mv-title"><c:out value="${v.c_name }"/></div>
													<div class="mv-year">${v.date}</div>
													<div class="mv-genre"><c:out value="${v.c_genre }"/> </div>
												</div>
											</a>
										</div>
									</c:forEach>
									
								</div>
								<hr />
							</div>

						</div>
					</div>
	

		<div class="container-fluid">
			<!-- 영화 검색결과  -->
			<div class="row" id="v">
				<div class="col-xs-12">
					<header>
						<!-- 타이틀 -->
						<h4>영화</h4>
						<div class="more">
							<a id="movie-more"> 더보기 </a>
						</div>
					</header>
					<div class="movie">
						<!-- 검색 결과 -->
						<div class="row">
							<ul class="mv-ul">
								
								<c:forEach var="mv" items="${list }">
								<c:if test="${mv.c_category == 0 }">
								<li>
									<div class="mv-1">
										<a href="javascript:goContents('${mv.c_id }')" class="thumbnail">
											<div class="mv-pic">
												<img src="${mv.c_image }" class="img-rounded">
											</div>
											<div class="mv-des">
												<div class="mv-des-title"><c:out value="${mv.c_name }"></c:out></div>
												<div class="mv-des-year">${mv.date }</div>
											</div>
											
										</a>
									</div>
									
								</li>
								</c:if>
								</c:forEach>

							</ul>

						</div>
						<hr />
					</div>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<!-- 드라마 검색결과 , 영화 검색결과와 구조 거의 같음  -->
			<div class="row" id="v">
				<div class="col-xs-12">
					<header>
						<h4>드라마</h4>
						<div class="more">
							<a id="drama-more"> 더보기 </a>
						</div>
					</header>
					<div class="drama">
						<div class="row">
							<ul class="mv-ul">
							
								<c:forEach var="dm" items="${list }">
								<c:if test="${dm.c_category == 1 }">
								<li>
									<div class="mv-1">
										<a href="javascript:goContents('${dm.c_id }')" class="thumbnail">
											<div class="mv-pic">
												<img src="${dm.c_image }" class="img-rounded">
											</div>
											<div class="mv-des">
												<div class="mv-des-title"><c:out value="${dm.c_name }"></c:out></div>
												<div class="mv-des-year">${dm.date }</div>
											</div>
										</a>
									</div>
								</li>
								</c:if>
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<form id="frm2" action="/contentPage" method="get">
		<input type="hidden" name="mId" id="mId"/>
		<input type="hidden" name="cId" id="cId"/>
	</form>
	
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="../lib/script/bootstrap.min.js"></script>
		<script src="/lib/script/findPage2.js"></script>
</body>

</html>