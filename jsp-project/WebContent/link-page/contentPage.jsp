<%@page import="java.util.ArrayList"%>
<%@page import="bean.SCCommentVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.SCDao"%>
<%@page import="bean.SCContentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Content Page</title>
    <!-- 부트스트랩 -->
    <script src="/lib/script/jquery-3.4.1.js"></script>
    <link href="/lib/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/lib/fonts/glyphicons-halflings-regular.eot">
    <script src="/lib/script/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/lib/css/contentPage.css">
	<link rel="stylesheet" href="/lib/css/top2.css" />
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
<style>
#moreContent {
	border-style: none;
	background-color: white;
}
</style>
</head>

<body>

	<%
		String mId = request.getParameter("mId");
		String cId = request.getParameter("cId");
		SCDao dao = new SCDao();
		SCContentVo star = dao.starCheck(mId, cId);
		request.setAttribute("star", star);
	 %>
	<script>
	$(document).ready(function(){
		$('#mId').val(sessionStorage.getItem('mId'));
		
		if(${star.score}>0){ 
			$('.hover-stars-group').addClass("active"+${star.score});
			$('.rating-comment').attr("style","display:block;")
		}
	}) // end of ready
		</script>

    <div class="content-main">
	<%@ include file="/link-page/contentPage_top.html" %>
            <div class="jumbotron text-center" style="background-image: url('${pVo.longPhoto}');"></div>
            <div class="row content-head">
                <div class="content-info">
                    <div class="content-thumb">
                        <img src="${cVo.image}">
                    </div>
                    <div class="headInfo">
                        <h1 class="content-name">${cVo.cName }</h1>
                        <div class="content-date">${cVo.date} ・ ${cVo.category } ・ ${cVo.genre }</div>
                        <div class="rating">평점 ${cVo.score }점(${cVo.ratingCount})명</div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-lg btn-default btn-interest" id="btnInterest">
                                <div class="actionBtn">
                                    <div class="plus_icon"></div>
                                    <div class="intText">보고싶어요.</div>
                                </div>
                            </button>
                            <button type="button" class="btn btn-lg btn-default btn-interest2" id="btnInterest_more"  data-toggle="modal" data-target="#interest_setting">
                                <div class="actionBtn">
                                    <div class="carrot_icon">▼</div>
                                </div>
                            </button>
                        </div>
                        <div class="rating-group">
                            <span class="blank-stars"></span>
                            <span class="blank-stars"></span>
                            <span class="blank-stars"></span>
                            <span class="blank-stars"></span>
                            <span class="blank-stars"></span>
                            <div class="hover-stars-group">
                                <span class="hover-stars"></span>
                                <span class="hover-stars"></span>
                                <span class="hover-stars"></span>
                                <span class="hover-stars"></span>
                                <span class="hover-stars"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <div class="container">
            <div class="row">
                <div class="leftinfo col-xs-9">
                	<!-- 히든 코멘트 남기는 창 -->
	               		<div class="row">
		                	<div class="rating-comment">
		                		<div class="rating-message col-xs-9">코멘트 남겨주세요</div>
		                		<input class="col-xs-3" type="button" value="코멘트 남기기" id="rating-comment-button" data-toggle="modal" data-target="#insert-comment"/>
		                	</div>
	                	</div>
	                <!-- 히든 코멘트 끝 -->
	                <!-- 기본정보 시작 -->
                    <div class="row">
                        <div class="left-info-context-data">
                            <div class="row left-info-context-data-head">
                                <div class="col-xs-8 ">
                                    <h4>기본정보</h4>
                                </div>
                                <div class="col-xs-2 col-xs-offset-2 text-right info-more">
                                    <button id="moreContent">더보기</button>
                                </div>
                            </div>
                            <div class="left-info-context-data-body">
                                <div class="left-info-context-data-body-head">
                                    <h3 class="">${cVo.cName }</h3>
                                    <div class="">${cVo.genre }</div>
                                    <div>${cVo.story }</div>
                                </div>
                                <div class="left-info-context-data-body-context"></div>
                            </div>
                        </div>
                    </div>
                    <!-- 기본정보 끝 -->
                    <!-- 출연진 시작 -->
                    <div class="row">
                        <hr style="margin-top: 10px; margin-bottom: 10px;">
                        <div class="actor-head row">
                            <div class="actor-head-title col-xs-10">출연/제작</div>
                            <div class="actor-more col-xs-2 text-right">
                            	<a href="/link-page/actorList.jsp?cId=${cVo.cId }">더보기</a>
                            </div>
                        </div>
                        <div class="actor-list-frame">
                            <ul class="actor-list">
                            
								<c:forEach var="item" items="${aList }">
									<li class="actor-li">
										<a href="/link-page/actors.jsp?aId=${item.aId }&aName=${item.aName}">
											<div class="actor-info">
												<img src="${item.photo }">
												<div class="actor-work">
													<div class="actor">${item.aName }</div>
													<div class="position">${item.position }</div>
												</div>
											</div>
										</a>
									</li>
								</c:forEach>
								
                            </ul>
                        </div>
                    </div>
                    <!-- 출연진 끝 -->
                    <!-- 그래프 시작 -->
                    <div class="row">
                        <hr style="margin-top: 10px; margin-bottom: 10px;">
                        <div class="rating-section">
                            <div class="rating-head">
                                <h2 class="col-xs-10" style="margin: 0px;">별점 그래프</h2>
                                <span class="col-xs-2 text-right">평균★${cVo.score }점<br>(${cVo.ratingCount})명</span>
                            </div>
                            <div class="rating-body" id="rating-body">
                                그래프가 출력될 공간
                            </div>
                        </div>
                    </div>
                    <!-- 그래프 끝 -->
                    
                    <!-- 코멘트 시작 -->
                    <div class="row">
                        <hr style="margin-top: 10px; margin-bottom: 10px;">
                        <div class="comment-section">
                            <div class="comment-head">
                                <div class="col-xs-10 comment-list">코멘트 ${fn:length(cList) }</div>
                                <div class="col-xs-2 comment-more text-right"><a href="javascript:commentMore('${cVo.cId }')">더보기</a></div>
                            </div>
                            <div class="comment-content">
                                <ul class=" comment-content-ul text-center">
                                
                                    <c:forEach var="item" items="${cList }" begin="0" end="1">
	                                    <li class="comment-block">
	                                        <div class="comment-block-head">
	                                            <div class="comment-block-head-id">
	                                                <c:choose>
	                                                	<c:when test="${item.photo == null }">
	                                                	<img class="member-img" src="/lib/images/son.jpg">
	                                                	</c:when>
	                                                	<c:otherwise><img class="member-img" src="${item.photo }"></c:otherwise>
	                                                </c:choose>
	                                                ${item.mId }
	                                            </div>
	                                            <div class="comment-block-head-rating">
	                                                <c:choose>
	                                                	<c:when test="${item.interest == 1 }">
	                                                		★보는중
	                                                	</c:when>
	                                                	<c:otherwise>
	                                                		★${item.score }
	                                                	</c:otherwise>
	                                                </c:choose>
	                                            </div>
	                                        </div>
	                                        <div class="comment-block-body">
	                                            <div class="comment-block-body-content">
	                                                ${item.content }
	                                            </div>
	                                        </div>
	                                        <div class="comment-block-like">
	                                            <span class="glyphicon glyphicon-thumbs-up"></span>
	                                            ${item.like }
	                                        </div>
	                                        <div class="comment-block-btn-like">
	                                            좋아요
	                                        </div>
	                                    </li>
                                    </c:forEach>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 배우정보 끝 -->
                </div>

                <!--우측-->
                <div class="rightinfo col-xs-3 col-xs-offset-1">
                    <div class="row">
                        <div class="trail-section">
                            <div class="trail-section-movie">
                                <iframe class="trail-section-movie-player" src="${cVo.preview }"></iframe>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <hr style="margin-top: 10px; margin-bottom: 10px;">
                        <div class="gallery-section">
                            <div class="gallery-section-title">
                                <h3>갤러리</h3>
                                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner" role="listbox">
                                      <div class="item active">
                                        <img src="${pVo.gallery1 }">
                                      </div>
                                  	
                                      <div class="item">
                                      	<img src="${pVo.gallery2 }">
                                      </div>
                                      
                                      <div class="item">
                                      	<img src="${pVo.gallery3 }">
                                      </div>
                                      
                                      <div class="item">
                                      	<img src="${pVo.gallery4 }">
                                      </div>
                                  
                                    <!-- Left and right controls -->
                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                      <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                      <span class="sr-only">Next</span>
                                    </a>
                                  </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    
    <form id="frm2" name="frm" action="/link-page/comment.jsp">
    	<input type="hidden" name="cId" id="cId" value="${cVo.cId }"/>
    	<input type="hidden" name="category" id="category" value="${cVo.category }" />
    </form>

	<script src="/lib/script/contentPage.js"></script>
	
	<div class="modal fade" id="interest_setting" aria-hidden="true" style="display: none; z-index: 1070;">
		<div class="modal-dialog" style="position:relative;top:185px;width:323px;">
			<div class="modal-content">
				<div class="modal-header" style="border:none;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;font-size: 16px;">
					<div id="interest-btn">
						<div class="row">
							<button type="button" class="btn btn-lg btn-default" id="interest-modal-want" style="width:48%;">보고싶어요</button>
							<button type="button" class="btn btn-lg btn-default" id="interest-modal-ing" style="width:48%;">보는중</button>
						</div>
						<div class="row" style="cursor: pointer;">
							<span style="display: inline-block;">코멘트 작성하기</span>
							<span class="glyphicon glyphicon-comment"></span>
						</div>
						<div class="row" style="cursor: pointer;" id="interest-none">
							<span style="display: inline-block;">관심없어요</span>
							<span class="glyphicon glyphicon-ban-circle"></span>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="color:#ff2f6e; border:none; font-weight:bold;">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="insert-comment" aria-hidden="true" style="display: none; z-index: 1070;">
		<div class="modal-dialog" style="position:relative;top:185px;">
			<div class="modal-content comment-modal">
				<div class="modal-header comment-header" style="border:none;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: left;">
						<span aria-hidden="true" style="color:#ff2f6e;">&times;</span>
					</button>
					<div style="display: inline-block; margin-left: 85px;">${cVo.cName }</div>
					<div class="insert-comment-ok" style="display: inline-block; float: right; color: #aaaaaa;">코멘트 작성하기</div>
				</div>
				<div class="modal-body" style="text-align: center; font-size: 16px;">
					<div id="comment-content">
						<textarea name="comment-textarea" id="comment-textarea" cols="30" rows="10" style="resize: none;"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<form id="frm2">
		<input type="hidden" name="mId" id="mId" />
		<input type="hidden" name="cId" id="cId" value="${param.cId }"/>
	</form>
	<script>
		$('#moreContent').click(function(){
			$('#frm2').attr('method', 'post');
			$('#frm2').attr('action','moreContent.hkMcon').submit();
		});
		
		
		google.charts.load('current', {'packages':['bar']});
		google.charts.setOnLoadCallback(drawStuff);	
		
		function drawStuff() {
			var data = google.visualization.arrayToDataTable([
		         ['', ''],
		         ['1', ${cntVo.cnt1}],            // RGB value
		         ['2', ${cntVo.cnt2}],            // English color name
		         ['3', ${cntVo.cnt3}],
		         ['4', ${cntVo.cnt4}],
		         ['5', ${cntVo.cnt5}], 
		         
		      ]);
			
			var options = {
					width: 600,
			        height: 200,
			        bar: {groupWidth: "30%"},
			        legend: { position: "none" },
			        series: {
			            0: { color: '#ffdd63' },
			      
			        }
			      };
	        var chart = new google.charts.Bar(document.getElementById('rating-body'));
	        // Convert the Classic options to Material options.
	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      };
		


	</script>
</body>
</html>