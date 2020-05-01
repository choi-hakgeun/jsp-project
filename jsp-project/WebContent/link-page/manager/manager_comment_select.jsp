<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_comment</title>

<link href="/lib/css/manager_comment_select.css" rel="stylesheet">

</head>
<body>
<form name="frm" id="frm" method="post">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 manager_comment_select_main">
                <div class="row">
                    <div class="col-xs-12 manager_comment_select_find_form">
                        <div class="row">
                            <div class="col-xs-10 col-xs-offset-1">
                                <div class="col-lg-6 comment_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="${ param.findStr }" value="${ param.findStr }">
                                        <input type="hidden" name="com_mId" id="com_mId" />
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button" name="btn_comment_find" id="btn_comment_find">
                                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                            </button>
                                        </span>
                                    </div><!-- /input-group -->
                                </div><!-- /.col-lg-6 -->
                            </div>
                        </div><!-- /.row -->
                    </div>
                    <div class="col-xs-12 manager_comment_select_title">
                        <div class="row">
                            <div id="title">
                                <span class="com_mId">작성한 회원아이디</span>
                                <span class="com_cId">작성된 콘텐츠 아이디</span>
                                <span class="con_content">코멘트 내용</span>
                                <span class="com_like">코멘트 좋아요</span>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="row">
                            	<c:forEach var="vo" items="${ list }">
                                	<div id="result" class="item" onclick="comment_view('${ vo.com_mId}')">
                                    	<span class="com_mId">${ vo.com_mId }</span>
                                    	<span class="com_cId">${ vo.com_cId }</span>
                                    	<span class="con_content">${ vo.con_content }</span>
                                    	<span class="com_like">${ vo.com_like }</span>
                                	</div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
btnFunc()
</script>
</body>
</html>