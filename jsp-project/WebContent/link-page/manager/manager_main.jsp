<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_main</title>
<link href="" rel="stylesheet">
<link href="/lib/css/bootstrap.min.css" rel="stylesheet">
<link href="/lib/css/manager_main.css" rel="stylesheet">
<script src="/lib/script/jquery-3.4.1.js"></script>
<script src="/lib/script/bootstrap.min.js"></script>
<script src="/lib/script/manager.js"></script>
</head>
<body>
<%
	String inc = "manager_member_select.jsp";
		if(request.getParameter("inc") != null){
			inc = request.getParameter("inc");
		}
%>
<form name="frm" id="headFrm" method="post">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 manager_main_background">
                <div class="col-xs-4 col-xs-offset-4">
                    <div id='logo' class="manager_logo">
                        <span>seecha</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 manager_memu_title">
                <div class="row">
                    <div class="col-xs-3 member_manager_menu">
                        <button type="button" class="btn btn-primary btn-lg btn-block member_manager" id='btn_member_select'>회원 관리</button>
                    </div>
                    <div class="col-xs-3 movie_manager_menu" >
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle movie_manager" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                  영화 관리
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                <li role="presentation"><input type='button' id='btn_content_select' value='검색'></li>
                                <li role="presentation"><input type='button' id='btn_content_insert' value='추가'></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-3 comment_manager_menu">
                        <button type="button" class="btn btn-primary btn-lg btn-block comment_manager" id='btn_comment_select'>코멘트 관리</button>
                    </div>
                    <div class="col-xs-3 movieActor_manager_menu" >
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle movie_manager" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                  출연진 관리
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                <li role="presentation"><input type='button' id='btn_movieActor_select' value='검색'></li>
                                <li role="presentation"><input type='button' id='btn_movieActor_insert' value='추가'></li>
                            </ul>
                        </div>
                    </div>
            	</div>
            </div>
        </div>
    </div>
</form>
	<div class="col-xs-12 main_content">
		<div class="row">
			<jsp:include page="<%=inc %>" />
		</div>
	</div>
	<script>
		btnFunc()
	</script>
</body>
</html>