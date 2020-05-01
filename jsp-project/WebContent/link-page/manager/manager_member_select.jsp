<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_member</title>

<link href="/lib/css/manager_member_select.css" rel="stylesheet">

</head>
<body>
<form name="frm" id="frm" method="post">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 manager_member_select_main">
                <div class="row">
                    <div class="col-xs-12 manager_member_select_find_form">
                        <div class="row">
                            <div class="col-xs-10 col-xs-offset-1">
                                <div class="col-lg-6 member_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="findStr" placeholder="${ param.findStr }" value="${ param.findStr }">
                                        <input type="hidden" name="m_mId" id="m_mId"/>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button" name="btn_member_Find" id="btn_member_Find">
                                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                            </button>
                                        </span>
                                    </div><!-- /input-group -->
                                </div><!-- /.col-lg-6 -->
                            </div>
                        </div><!-- /.row -->
                    </div>
                    <div class="col-xs-12 manager_member_select_title">
                        <div class="row">
                            <div id="title">
                                <span class="m_mId">이메일</span>
                                <span class="m_name">회원명</span>
                                <span class="m_phone">연락처</span>
                                <span class="m_date">등록일</span>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="row">
                           		<c:forEach var="vo" items="${ list }">
                            		<div id="result" class="item" onclick="member_view('${ vo.m_mId }')">
                                    	<span class="m_mId">${ vo.m_mId }</span>
                                    	<span class="m_name">${ vo.m_name }</span>
                                    	<span class="m_phone">${ vo.m_phone }</span>
                                    	<span class="m_date">${ vo.m_date }</span>
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