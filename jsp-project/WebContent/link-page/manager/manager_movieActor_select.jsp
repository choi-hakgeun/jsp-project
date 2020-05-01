<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_movieActor</title>

<link href="../../lib/css/manager_movieActor_select.css" rel="stylesheet">

</head>
<body>
<form name="frm" id="frm" method="post">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 manager_movieActor_select_main">
                <div class="row">
                    <div class="col-xs-12 manager_movieActor_select_find_form">
                        <div class="row">
                            <div class="col-xs-10 col-xs-offset-1">
                                <div class="col-lg-6 movieActor_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="${ param.findStr }">
                                        <input type="hidden" name="a_id" id="a_id" />
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button" name="btn_movieActor_find" id="btn_movieActor_find">
                                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                            </button>
                                        </span>
                                    </div><!-- /input-group -->
                                </div><!-- /.col-lg-6 -->
                            </div>
                        </div><!-- /.row -->
                    </div>
                    <div class="col-xs-12 manager_movieActor_select_title">
                        <div class="row">
                            <div id="title">
                                <span class="a_id">아이디</span>
                                <span class="a_position">역할</span>
                                <span class="a_name">이름</span>
                                <span class="a_work">출연작</span>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="row">
                            	<c:forEach var="vo" items="${ list }">
                                	<div id="result" onclick="movieActor_view('${ vo.a_id}')">
                                    	<span class="a_id">${ vo.a_id }</span>
                                    	<span class="a_position">${ vo.a_position }</span>
                                    	<span class="a_name">${ vo.a_name }</span>
                                    	<span class="a_work">${ vo.a_work }</span>
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