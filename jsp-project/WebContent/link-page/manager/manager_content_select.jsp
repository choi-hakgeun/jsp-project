<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_content</title>

<link href="/lib/css/manager_content_select.css" rel="stylesheet">

</head>
<body>
<form name="frm" id="frm" method="post">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 manager_content_select_main">
                <div class="row">
                    <div class="col-xs-12 manager_content_select_find_form">
                        <div class="row">
                            <div class="col-xs-10 col-xs-offset-1">
                                <div class="col-lg-6 content_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="findStr" placeholder="${ param.findStr }" id="${ param.findStr }">
                                        <input type="hidden" name="c_id" id="c_id"/>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button" name="btn_content_find" id="btn_content_find">
                                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                            </button>
                                        </span>
                                    </div><!-- /input-group -->
                                </div><!-- /.col-lg-6 -->
                            </div>
                        </div><!-- /.row -->
                    </div>
                    <div class="col-xs-12 manager_content_select_title_form">
                        <div class="row">
                            <div id="manager_content_select_title">
                                <span class="c_id">콘텐츠 아이디</span>
                                <span class="c_name">콘텐츠 제목</span>
                                <span class="c_category">콘텐츠 분류</span>
                                <span class="c_genre">콘텐츠 장르</span>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="row">
                            	<c:forEach var="vo" items="${ list }">
                                	<div id="content_result" class="item" onclick="content_view('${ vo.c_id }')">
                                    	<span class="c_id">${ vo.c_id }</span>
                                    	<span class="c_name">${ vo.c_name }</span>
                                    	<span class="c_category">${ vo.c_category }</span>
                                		<span class="c_genre">${ vo.c_genre }</span>
                                	</div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
btnFunc()
</script>
</form>
</body>
</html>