<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>seecha</title>

	<!-- 부트스트랩 -->
	<link href="/lib/css/top.css" rel="stylesheet">
	<link href="/lib/css/myPlusTop.css" rel="stylesheet">
	<script src="../lib/script/he_linkPage.js"></script>
	<script src="../lib/script/main_page.js"></script>
	<script src="../lib/script/member.js"></script>

</head>

<body>
	<header class="hd">
		<nav class="navbar navbar-default navbar-fixed-top">
			<!--상단 고정 위한 nav class -->
			<div class="container-fluid">
				<!--로고/검색어/로그아웃/프로필  -->
				<div class="row top">
					<div class="col-xs-3">
						<a href="../index.jsp"><span id="logo">seecha</span></a>
					</div>
					<div class="col-xs-6">
						<div class="form-group fg">
							<div class="input-group  form-group-lg">

								<span class="input-group-addon"> <span class="glyphicon glyphicon-search"
										aria-hidden="true"></span></span>
								<form id='frm' name='frm' method='post'>
									<input type="text" class="form-control" id="findStr" name='findStr'
										placeholder="작품,배우,감독을 검색해 보세요">
								</form>

							</div>
							<!-- 검색보조 -->
							<div align="center" id="subBar"
								style="display:none;width: 100%;height: 327px;position: absolute;top: 45px;z-index: 1030;">
								<div class="panel panel-default" id="subBarC" style="height: 327px;">
									<div class="left_bar">
										<span style="font-weight: bold; font-size: 20px;">최근검색어</span>
										<div id="recent_serch">
										</div>
									</div>
									<div class="right_bar">
										<span style="font-weight: bold; font-size: 20px">트렌드</span>
										<div id="trend">


										</div>
									</div>
								</div>
							</div>
							<!-- 자동완성 -->
							<div align="center" id='completeBar'
								style="width: 100%;height: 327px;position: absolute;top: 45px;z-index: 1030;display:none">
								<div class="panel panel-default" id='complete'>


								</div>
							</div>
						</div>
					</div>

					<div class="col-xs-3 div-2">
						<div class="form-group">
							<div class="input-group" id="profile-group">
								<button type="button" class="btn btn-outline-danger" id='btnLogin' data-toggle="modal"
									data-target="#login-Modal"
									style="font-weight: bold; background-color: rgba(255, 0, 0, 0);height: 30px;">로그인</button>
								<button type="button" class="btn btn-light" id='btnSign'
									style="font-weight: bold; background-color: #ff2f6e; color: white;"
									data-toggle="modal" data-target="#join-Modal">회원가입</button>

								<span class="input-group-addon span1" id="logout-span2">
									<span class="glyphicon glyphicon-off pink" aria-hidden="true" id="logout"
										data-toggle="modal" data-toggle="tooltip" data-placement="bottom" title="로그아웃"
										data-target="#logout-modal">
									</span>
								</span>
								<span class="input-group-addon span2" id="logout-span" data-toggle="tooltip"
									data-placement="bottom" title="..'s page">
									<a href="/link-page/member_main.jsp"><img src="/lib/images/default_profile.png"
											class="img-circle" id="profile-image"></a>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid">
				<!-- 타이틀/뒤로가기 -->
				<div class="row">
					<div class="col-xs-12">
						<button type="button" class="btn btn-default" id="mv-findTop-button" aria-label="Left Align">
							<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
							<!--뒤로가기 -->
						</button>
						<div class="mv-findTop-title">보는중</div>
					</div>
				</div>
			</div>

		</nav>
	</header>

	<!--회원가입 실패 모달  -->
	<div class="modal fade" id="join_false" aria-hidden="true" style="display: none; z-index: 1060;">
		<div class="modal-dialog" style="position:relative;top:185px;width:323px;">
			<div class="modal-content">
				<div class="modal-header" style="border:none;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body" style="text-align: center;font-size: 16px;">
					<span>이미 가입된 이메일 입니다!</span>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="color:#ff2f6e; border:none; font-weight:bold;">닫기</button>
				</div>

			</div>
		</div>
	</div>

	<!-- 로그인 실패 모달  -->
	<div class="modal fade" id="login_false" aria-hidden="true" style="display: none; z-index: 1060;">
		<div class="modal-dialog" style="position:relative;top:185px;width:323px;">
			<div class="modal-content">
				<div class="modal-header" style="border:none;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body" style="text-align: center;font-size: 16px;">
					<span>이메일이나 비밀번호를 확인해주세요!</span>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="color:#ff2f6e; border:none; font-weight:bold;">닫기</button>
				</div>

			</div>
		</div>
	</div>

	<!-- 로그인 모달  -->
	<div class="modal fade" id="login-Modal" style="display: none; z-index: 1050;" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">
						<p class="text-center login_logo">seecha</p>
					</h4>
				</div>
				<div class="modal-body">
					<div>
						<p class="text-center login_logo2">로그인</p>
					</div>
					<form class="form-horizontal" id='login_modal_form' name='login_modal_form' method="post">
						<div class="form-group">

							<div class="col-xs-12" id="email_check_form">

								<input type="email" class="form-control login-input" id="main_login_email"
									name="main_login_email" placeholder="Email">
								<div id="email_text">

								</div>
							</div>
						</div>
						<div class="form-group">

							<div class="col-xs-12">
								<input type="password" class="form-control login-input" id="main_login_pwd"
									name="main_login_pwd" placeholder="Password">
							</div>
						</div>
						<div>
							<button type="button" class="btn btn-default btn-lg btn-block"
								id='btn_main_login'>로그인</button>
						</div>
						<div>
							<p class="text-center">
								<button type="button" class="btn btn-default" id='btn_find_pwd' data-toggle="modal"
									data-target="#find_pwd">
									비밀번호를 잊어버리셨나요?</button>
							</p>
						</div>
						<div>
							<p class="text-center madal_text">
								계정이 없으신가요?
								<button type="button" class="btn btn-default" id='btn_modal_join' data-toggle="modal"
									data-target="#join-Modal" onclick='modal_hide()'>회원가입</button>
							</p>
						</div>
						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
							data-target="#login_false" id="b_f" style="display:none"></button>

					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입 모달  -->
	<div class="modal fade" id="join-Modal" style="display: none; z-index: 1050;" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">
						<p class="text-center login_logo">seecha</p>
					</h4>
				</div>
				<div class="modal-body">
					<div>
						<p class="text-center login_logo2">회원가입</p>
					</div>
					<form class="form-horizontal" id='join_modal_form' name='login_modal_form' method="post">
						<div class="form-group">
							<div class="col-xs-12">
								<input type="text" class="form-control j_m" id="main_join_name" name="main_join_name"
									placeholder="이름">
								<div id="name_text">

								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<input type="email" class="form-control j_m" id="main_join_email" name="main_join_email"
									placeholder="이메일">
								<div id="email_text2">

								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<input type="text" class="form-control j_m" id="main_join_phone" name="main_join_phone"
									placeholder="핸드폰번호">
								<div id="phone_text">

								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<input type="password" class="form-control j_m" id="main_join_pwd" name="main_join_pwd"
									placeholder="비밀번호">
							</div>
						</div>

						<div>
							<button type="button" class="btn btn-default btn-lg btn-block"
								id='btn_modal_join_sb'>회원가입</button>
						</div>
						<div>
							<p class="text-center madal_text" id="modal_text">
								이미가입하셨나요?
								<button type="button" class="btn btn-default" id='btn_modal_join_Save'
									data-toggle="modal" data-target="#login-Modal" onclick='modal_hide2()'>로그인</button>
							</p>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-lg btn-block" id='btn_modal_naver_login'>네이버 아이디로
						로그인</button>
				</div>
				<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#join_false"
					id="j_f" style="display:none"></button>
			</div>
		</div>
	</div>
	<!-- 비밀번호 변경 모달  -->
	<div class="modal fade" id="find_pwd" aria-hidden="true" style="display: none; z-index: 1060;">
		<div class="modal-dialog" style="position:relative;top: 96px;width: 371px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							aria-hidden="true">&times;</span></button>
					<h2 style="font-weight: bold;">비밀번호 재설정</h2>
				</div>
				<div class="modal-body" style="font-size: 16px;">
					<div style="font-weight: bold;margin-bottom: 7px;">비밀번호를 잊으셨나요?</div>
					<div style="font-size: 13px;color: #aaa;margin-bottom: 7px;font-weight: bold;">가입했던 이메일을 적어주세요</div>
					<div style="font-size: 13px;color: #aaa;margin-bottom: 38px;font-weight: bold;">입력하신 이메일 주소로 비밀번호를
						보낼게요</div>
					<form class="form-horizontal" id='pwdFind_modal_form' name='pwdFind_modal_form' method="post">
						<div class="form-group">
							<div class="col-xs-12">
								<input type="email" class="form-control j_m" id="find_pwd_email" name="find_pwd_email"
									placeholder="example@google.com">
								<div id="email_text3">

								</div>
							</div>
						</div>
					</form>
					<div>
						<button type="button" class="btn btn-default btn-lg btn-block" id='btn_find_pwd_send'>비밀번호 변경
							이메일 보내기</button>
					</div>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="color:#ff2f6e; border:none; font-weight:bold;">닫기</button>
					<button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
						data-target="#pwdFind_result" id="f_r" style="display:none"></button>
				</div>

			</div>
		</div>
	</div>
	<!-- 비밀번호 변경 결과-->
	<div class="modal fade" id="pwdFind_result" aria-hidden="true" style="display: none; z-index: 1070;">
		<div class="modal-dialog" style="position:relative;top:185px;width:323px;">
			<div class="modal-content">
				<div class="modal-header" style="border:none;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body" style="text-align: center;font-size: 16px;">
					<div id="find_result_text"></div>
				</div>
				<div class="modal-footer" style="text-align:center">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="color:#ff2f6e; border:none; font-weight:bold;">닫기</button>
				</div>

			</div>
		</div>
	</div>

	<!-- 로그아웃 모달 시작 -->
	<div class="modal fade" id="logout-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<p class="text-center login_logo">seecha</p>
				</div>

				<div class="modal-body">
					<p class="text-center logout-text">정말 로그아웃 하시겠습니까?</p>
				</div>


				<div class="modal-footer logout-btns">
					<button type="button" class="btn btn-default" data-dismiss="modal" id='logout_no'>아니오</button>
					<button type="button" class="btn btn-primary" id='logout_yes' onclick='btn_logout_yes()'>네</button>
				</div>
			</div>
		</div>
	</div>



	<script>
		top_button();
		main_login();
		main_join();
		btn_logout_after();
		login_form_check();
		login_btn_attr();
		join_form_check();
		join_btn_attr();
		findPwd_form_check();
		find_pwd();
		btnFunc();
		subBar();
		fo();
		compBar();
	</script>




</body>

</html>