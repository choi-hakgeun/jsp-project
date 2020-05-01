<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main_board</title>
<script src='/lib/script/jquery-3.4.1.js'></script>
<link href="/lib/css/bootstrap.min.css" rel="stylesheet">
<link href="/lib/css/main_board.css" rel="stylesheet">
<script src="/lib/script/board.js"></script>
<link href="/lib/css/jquery.fallingsnow.css" rel="stylesheet">
<script src="/lib/script/jquery.fallingsnow.js"></script>
<script src="/lib/script/jquery.fallingsnow.min.js"></script>
</head>
<body style="background-image: url('/lib/images/stark.jpg'); background-repeat: no-repeat; background-attachment:fixed;" >
<%
	String board = "/link-page/boards/board_first.jsp";
	if(request.getParameter("board") != null){
		board = request.getParameter("board");
	}
	
%>
	
	
	
	<!-- 로고 -->
	<div class="container-fluid" id="logo" 
		 style="background:transparent URL(/lib/images/mainPage_image/MAIN_TOP.jpg) no-repeat center center /cover">
		<div align="right" style="margin-right: 80px;">
			<div class="main-header" id="main-header" style="width: 50px; height: 50px;">
		 		<span class="input-group-addon span1" id="logout-span2" style="color:red; font-size:33px; background-color: rgba(0,0,0,0); border:none;"> 
		 			<span class="glyphicon glyphicon-off pink" aria-hidden="true" id="logout"
						data-toggle="modal" data-toggle="tooltip" data-placement="bottom"
						title="로그아웃" data-target="#logout-modal">
					</span>
				</span> 
				<span class="input-group-addon span2" style="background-color: rgba(0,0,0,0); border:none;" id="logout-span" data-toggle="tooltip" data-placement="bottom" title="..'s page">
					<a href="javascript:select()">
						<img src="/lib/images/default_profile.png" class="img-circle"id="profile-image" style="width:33px; height: 33px;">
					</a>
				</span>
			</div>
		</div>
	 	<div align="center">
			<span class="logo_text" style="font-weight: 700; cursor: pointer; position:relative; bottom: 20px;" onclick="location.href='/index.jsp'" >SEECHA</span>
		</div>
		
		<!-- 메뉴바 -->
		<div class="row" id="menuBar">
		
			<form id="bd_frm" name="bd_frm" method="post">
				<div class="form-group " id="btnmenu">
						<div class="input-group col-xs-12 text-center" >
								<div class="col-xs-3">
									<input type="button"  id="notice" name="notice" value="공지사항" >
								</div>
								<div class="col-xs-3">
									<input type="button"  id="QA" name="QA" value="Q&A">
								</div>
								<div class="col-xs-3">
									<input type="button"  id="general" name="general" value="자유게시판">
								</div>
								<div class="col-xs-3">
									<input type="button"  id="event" name="event" value="이벤트">
								</div>
						</div>
				</div>
			</form>
		</div>
		
	</div>
		
	
	<!-- 게시판 -->

	<div class="container-fluid" id="board_content" style="height: 700px;">
		<jsp:include page="<%=board %>"/>
	</div>
	
	
	<div class="container" id="board_btn">
		<div align="right">
			<button type="button" class="btn btn-default" id="btn_bd_Insert" onclick="location.href='main_board.jsp?board=/link-page/boards/board_insert.jsp'">글 등록</button>
		</div>
	</div>
	
	
		<div  class="container" align="right" style="position:relative; bottom:130px;" id="chat_con">
			<div class="row">
				<div id="chat_div" style="border: 2px solid white; width: 340px; height: 219px; position: fixed; right: 2px; background-color: black;">
					<header style="background-color: #5882FA; cursor:pointer; color:black; font-size:10px; height: 12px; text-align: left;" onclick="slide();">
						<span>채팅창</span>
					</header>
					<form id="chat_frm" name="chat_frm" type="post">
						<div style="height: 177px; overflow: auto; text-align: left; color:white;" id="chat_center">
							
							
							
						</div>
						<div id="chat_type">
							<input type="text" name="chat_txt" id="chat_txt" style="width:288px;">
							<input type="button" id="chatBtn"  value="전송" onclick="chat_submit();">
						</div>
						<input type="hidden" id="chat_id" name="chat_id">
					</form>
				</div>
			</div>
		</div>
	
	
	<script>
	$(document).ready(function(){
		setInterval("updateTime()", 5000);
		
	});
	
	$('#chat_center').scrollTop($(document).height());
	
	
	
	Func();
	let n = 0;
	
	let slide = function(){
		
		if(n == 0){
			$('#chat_center').hide();
			$('#chat_type').hide();
			$('#chat_div').css('height','16px');
			$('#chat_con').css('bottom','-70px');
			n = 1;
		}else{
			$('#chat_center').show();
			$('#chat_type').show();
			$('#chat_div').css('height','219px');
			$('#chat_con').css('bottom','130px');
			n = 0;
		}
		
	}
	
	var mId = sessionStorage.getItem("mId");
	if(mId == null){
		alert("회원 전용 게시판입니다!! 로그인 후 접속해주세요.");
		location.href="/index.jsp";
	}
	
	$('#chat_id').val(mId);
	
	</script>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../lib/script/bootstrap.min.js"></script>
</body>
</html>