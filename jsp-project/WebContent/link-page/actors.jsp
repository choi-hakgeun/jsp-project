<%@page import="bean.SCContentVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.SCDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>seecha</title>

    <!-- 부트스트랩 -->
    <link href="/lib/css/bootstrap.min.css" rel="stylesheet">
    <link href="/lib/css/rank.css" rel="stylesheet">
    <link href="/lib/css/myPlusTop.css" rel="stylesheet">
    <link href="/lib/css/top.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../lib/script/bootstrap.min.js"></script>
 
 
</head>
<body>
<%
	String aId = request.getParameter("aId");
	String aName = request.getParameter("aName");
	SCDao dao = new SCDao();
	List<SCContentVo> list = dao.actorsContent(aId);
	request.setAttribute("list", list);
%>
 <%--  <header class="hd">
        <nav class="navbar navbar-default navbar-fixed-top"><!--상단 고정 위한 nav class -->
            <div class="container-fluid"><!--로고/검색어/로그아웃/프로필  -->
                <div class="row top">
                    <div class="col-xs-3">
                        <span id="logo">seecha</span>
                    </div>
                    <div class="col-xs-6">
                        <div class="form-group">
                            <div class="input-group  form-group-lg">

                                <span class="input-group-addon"> <span class="glyphicon glyphicon-search"
                                        aria-hidden="true"></span></span>
                                <input type="text" class="form-control" id="findStr" placeholder="작품,배우,감독을 검색해 보세요">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove-circle"
                                        aria-hidden="true"></span></span>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-3 div-2">
                        <div class="form-group">
                            <div class="input-group" id="profile-group">
                                <span class="input-group-addon span1"> <span class="glyphicon glyphicon-off"
                                        aria-hidden="true" id="logout"></span></span>
                                <span class="input-group-addon span2" id="logout-span"><img src="/lib/images/default_profile.png"
                                        class="img-circle" id="profile-image"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid"><!-- 타이틀/뒤로가기 -->
                <div class="row">
                    <div class="col-xs-12">
                        <button type="button" class="btn btn-default" id="mv-findTop-button" aria-label="Left Align">
                            <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span><!--뒤로가기 -->
                      </button> 
                        <div class="mv-findTop-title"><%=aName %></div>
                    </div>
                </div>
            </div>
        </nav>
    </header> --%>
	<%@include file="/link-page/actors_top.jsp" %>


  <!-- Tab panes -->

   
    <div class="rank-saw-img">
        <ul>
			<c:forEach var="item" items="${list }">
				<li>
					<!--검색 결과 1개를 감싸는 li -->
					<div class="rank-plus-1">
						<a href="/contentPage?cId=${item.cId }">
							<div class="rank-plus-pic">
								<img src="${item.image }">
							</div>
							<div class="rank-plus-des">
								<div class="rank-plus-des-title">${item.cName }</div>
								<div class="rank-plus-des-year">★${item.score }</div>
							</div>
						</a>
					</div>
				</li>
			</c:forEach>
		</ul>   	
	</div>

	<script>
	  $(function () {
	    $('#myTab a:last').tab('show')
	  })
	</script>
</body>

</html>