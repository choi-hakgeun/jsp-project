<%@page import="java.util.List"%>
<%@page import="bean.ContentVo"%>
<%@page import="bean.SCContentVo"%>
<%@page import="bean.SCDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.a{
	position: relative;
    top: 80px;
}
.b{
	height: 100px;
}
.c{
	height: 400px;
	width: 100%;
}
#d{
	height: 30px;
	margin: 10px;
	border-bottom: 1px solid #eee;
}
#e{
	height: 30px;
	margin: 10px;
	border-bottom: 1px solid #eee;
}
#f{
	height: 30px;
	margin: 10px;
	border-bottom: 1px solid #eee;
}
#g{
	height: 100px;
	margin: 10px;
	border-bottom: 1px solid #eee;
}
.mv-findTop-title {
    font-size: 27px;
    font-weight: bold;
    margin-top: 9px;
    border-bottom: 1px solid #eee;
}
#title{
	font-size: large;
    width: 30%;
    color: darkgrey;
}
#c_name, #c_other, #c_genre, #c_story{
	position: relative;
    width: 70%;
    top: -38px;
    left: 115px;
    background-color: white;
    border-style: none;
}
</style>
</head>
    <script src="/lib/script/jquery-3.4.1.js"></script>
    <link href="/lib/css/bootstrap.min.css" rel="stylesheet">
	<script src="/lib/script/bootstrap.min.js"></script>
    <link href="/lib/css/top.css" rel="stylesheet">
<body>
	<%@ include file="/link-page/contentPage_top.html" %>
<div class="container a">
    <div class="row">
        <div class="col-sm-12 b">
        <div class="mv-findTop-title">기본정보</div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1 c">
        		<div id="d">
        			<label id="title">제목</label>
        			<input class="form-control" name="c_name" id="c_name" type="text" value="${ vo.c_name }" readonly>
        		</div>
        		<div id="e">
        			<label id="title">기타정보</label>
        			<input class="form-control" name="c_other" id="c_other" type="text" value="${ vo.c_other }" readonly>
        		</div>
        		<div id="f">
        			<label id="title">장르</label>
        			<input class="form-control" name="c_genre" id="c_genre" type="text" value="${ vo.c_genre }" readonly>
        		</div>
        		<div id="g">
        			<label id="title">줄거리</label><br/>
        			<textarea class="form-control" rows="3" name="c_story" id="c_story" readonly>
		        	${ vo.c_story }
                      </textarea>
        		</div>
        	</div>
        	<form name="frm_1" id="frm_1" method="post">        	
        		<input type="hidden" name="c_id" value="${ vo.c_id }" />
        	</form>
    </div>
</div>
</body>
</html>