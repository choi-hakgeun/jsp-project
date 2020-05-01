<%@page import="bean.he_dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>main_page</title>
	<script src='./lib/script/jquery-3.4.1.js'></script>
	<link href="./lib/css/bootstrap.css" rel="stylesheet">
	<link href="./lib/css/main_page.css" rel="stylesheet">
	<script src='./lib/script/main_page.js'></script>
	<script src="./lib/script/he_main.js"></script>
	<script src="./lib/script/naveridlogin_js_sdk_2.0.0.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

</head>

<body>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="./lib/script/bootstrap.min.js"></script>

	<!-- 메인로고 -->
	<div class="container-fluid" id="logo"
		style="background: transparent URL(./lib/images/mainPage_image/MAIN_TOP.jpg) no-repeat center center/cover">
		<div class="row">


			<div align="right" class="main-header" id="main-header">

				<button type="button" class="btn btn-outline-danger" id='btnLogin' data-toggle="modal"
					data-target="#login-Modal"
					style="font-weight: bold; background-color: rgba(255, 0, 0, 0); color: white; height: 30px;">로그인</button>
				<button type="button" class="btn btn-light" id='btnSign'
					style="font-weight: bold; background-color: #ff2f6e; color: white;" data-toggle="modal"
					data-target="#join-Modal">회원가입</button>

				<span class="input-group-addon span1" id="logout-span2"> <span class="glyphicon glyphicon-off pink"
						aria-hidden="true" id="logout" data-toggle="modal" data-toggle="tooltip" data-placement="bottom"
						title="로그아웃" data-target="#logout-modal"> </span>
				</span> <span class="input-group-addon span2" id="logout-span" data-toggle="tooltip"
					data-placement="bottom" >
					<a href="javascript:select()"><img src="./lib/images/default_profile.png" class="img-circle"
							id="profile-image"></a>
				</span>


				<!-- 로그아웃 모달 시작 -->
				<div class="modal fade" id="logout-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<p class="text-center login_logo">seecha</p>
							</div>

							<div class="modal-body">
								<p class="text-center logout-text">정말 로그아웃 하시겠습니까?</p>
							</div>


							<div class="modal-footer logout-btns">
								<button type="button" class="btn btn-default" data-dismiss="modal"
									id='logout_no'>아니오</button>
								<button type="button" class="btn btn-primary" id='logout_yes'
									onclick='btn_logout_yes()'>네</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달끝 -->

			</div>
			<script>
				top_button();
			</script>

			<div class="row text-center">
				<span class="logo_text" style="font-weight: 700;">SEECHA</span>
			</div>
		</div>
	</div>


	<!-- 내용 -->
	<div class="container-fluid" style="background-color: #FAFAFA;" id="middle_sec">
		<div class="row">
			<!-- 검색창 -->
			<div class="col-xs-12 text-center">
				<form id="frm" name="frm" method="post">
					<div class="form-group">

						<div class="input-group form-group-lg" id="input-group">
							<span class="input-group-addon"><span id='gly_search' class="glyphicon glyphicon-search"
									aria-hidden="true"></span></span> <input type="search" autocomplete="off"
								class="form-control" name="findStr" id="findStr" placeholder="작품 제목,배우,감독을 검색해보세요.">
							<div id="suggetion_box"></div>
						</div>

					</div>
				</form>
			</div>

			<!-- 검색보조창 -->
			<div align="center" id='subBar' style="display: none;">
				<div class="panel panel-default" id='subBarC' style="width: 668px; height: 327px;">
					<div class="left_bar">
						<span style="font-weight: bold; font-size: 20px;">최근검색어</span><button id="del">전체삭제</button>
						<div id="recent_serch"></div>
					</div>
					<div class="right_bar">
						<span style="font-weight: bold; font-size: 20px">트렌드</span>
						<div id="trend">


						</div>

					</div>
				</div>
			</div>

			<!--자동완성-->
			<div align="center" id='completeBar' style="display: none;">
				<div class="panel panel-default" id='complete' style="width: 668px;">




				</div>
			</div>

			<br> <br> <br>
			<!-- 내용창 -->
			<!-- 판넬창 -->
			<div class="row text-center row-fluid">
				<div align="center">
					<div class="panel panel-default" id="panel_findStr"
						style="width: 668px; height: 136px; background-color: #FAFAFA;">
						<br> <a href="/link-page/main_board.jsp"><img class="img-responsive center-block"
								src="./lib/images/mainPage_image/icons.png"></a>
						<div class="row text-center" style="margin-top: 7px;">
							<div style="float: none; margin: 0 auto s; color: #4a4a4a; font-weight: bold;">
								<span>영화,TV,도서를 검색하고</span><br> <span>5억 개의 평점과 리뷰를
									만나보세요.</span> <br>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div align="center">
				<iframe width="668" height="400" src="https://www.youtube.com/embed/P6d6_Nik29U" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>

			<!-- 나머지 내용 -->
			<div class="row text-center">
				<div
					style="float: none; margin: 0 auto; padding-top: 58px; font-size: 12px; color: #787878; font-weight: bold;">
					<span>지금 씨챠 앱을 다운로드하고,</span><br> <span>내 취향에 딱 맞는 영화
						드라마 도서 추천을 받아보세요.</span><br> <br>
				</div>
			</div>
			<div class="row text-center">
				<a href="https://play.google.com/store/apps/details?id=com.frograms.watcha" target="_blank"><img
						src="./lib/images/mainPage_image/googlePlay.png" height="35px" width="auto"></a> <a
					href="https://apps.apple.com/app/id644185507" target="_blank"><img
						src="./lib/images/mainPage_image/appStore.png" height="35px" width="auto"></a> <br> <br> <br>
				<br>
			</div>

		</div>
	</div>

	<!-- footer -->

	<footer class="container">
		<div align="center" style="width: 800px; padding-top: 29px;">
			<span>지금까지 </span><span style="color: orange;">★ 323,310,203개의
				평가가 </span><span>쌓였어요.</span>
			<div align="right">
				<button type="button" class="btn btn-info btn-circle"
					onclick="window.open('https://twitter.com/watcha_app')">
					<img src="./lib/images/mainPage_image/twitter.png" style="max-width: 70%">
				</button>
				<i class="fa fa-link"></i>
				<button type="button" class="btn btn-primary btn-circle"
					onclick="window.open('https://www.facebook.com/watchaplay/')">
					<img src="./lib/images/mainPage_image/facebook.png" style="max-width: 80%">
				</button>
				<i class="fa fa-link"></i>
				<button type="button" class="btn btn-default btn-circle"
					onclick="window.open('https://team.watcha.com/blog/')">
					<img src="./lib/images/mainPage_image/instagram.png" style="max-width: 70%">
				</button>
				<i class="fa fa-link"></i>
			</div>

			<br> <br>
			<div align="left" id="ft_txt">
				> <span>서비스 이용약관</span><br> <span>개인정보 처리방침</span><br> <span>사업자
					등록번호 (123-123123)</span>

			</div>
			<div align="right">
				<button type="button" data-toggle="modal" data-target="#lang-change" id="language"
					class="btn btn-default">▼ 한국어</button>
			</div>


		</div>

	</footer>

	<!-- 언어 바꾸기 -->
	<div class="modal fade" id="lang-change" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content" id='modal-lang'>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true" style="color: #ff2f6e">X</span>
					</button>
					<div align="center">
						<h3>언어</h3>
					</div>
				</div>
				<div class="modal-body" style='cursor: pointer;' id='language_modal'>
					<p style="font-size: 20px;" id='kor1'>한국어</p>
					<p style="font-size: 20px;" id='kor2'>KOREAN</p>
					<p style="font-size: 20px;" id='kor3'>韓國語</p>
				</div>
			</div>
		</div>
	</div>

	<!--회원가입 실패 모달  -->
	<div class="modal fade" id="join_false" aria-hidden="true" style="display: none; z-index: 1060;">
		<div class="modal-dialog" style="position: relative; top: 185px; width: 323px;">
			<div class="modal-content">
				<div class="modal-header" style="border: none;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center; font-size: 16px;">
					<span>이미 가입된 이메일 입니다!</span>
				</div>
				<div class="modal-footer" style="text-align: center">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="color: #ff2f6e; border: none; font-weight: bold;">닫기</button>
				</div>

			</div>
		</div>
	</div>

	<!-- 로그인 실패 모달  -->
	<div class="modal fade" id="login_false" aria-hidden="true" style="display: none; z-index: 1060;">
		<div class="modal-dialog" style="position: relative; top: 185px; width: 323px;">
			<div class="modal-content">
				<div class="modal-header" style="border: none;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center; font-size: 16px;">
					<span>이메일이나 비밀번호를 확인해주세요!</span>
				</div>
				<div class="modal-footer" style="text-align: center">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="color: #ff2f6e; border: none; font-weight: bold;">닫기</button>
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
								<div id="email_text"></div>
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
									data-target="#find_pwd">비밀번호를
									잊어버리셨나요?</button>
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
							data-target="#login_false" id="b_f" style="display: none"></button>

					</form>

				</div>
				<div class="modal-footer">
					<div id="naverIdLogin"></div>
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
								<div id="name_text"></div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<input type="email" class="form-control j_m" id="main_join_email" name="main_join_email"
									placeholder="이메일">
								<div id="email_text2"></div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<input type="text" class="form-control j_m" id="main_join_phone" name="main_join_phone"
									placeholder="핸드폰번호">
								<div id="phone_text"></div>
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
				<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#join_false"
					id="j_f" style="display: none"></button>
			</div>
		</div>
	</div>
	<!-- 비밀번호 변경 모달  -->
	<div class="modal fade" id="find_pwd" aria-hidden="true" style="display: none; z-index: 1060;">
		<div class="modal-dialog" style="position: relative; top: 96px; width: 371px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 style="font-weight: bold;">비밀번호 재설정</h2>
				</div>
				<div class="modal-body" style="font-size: 16px;">
					<div style="font-weight: bold; margin-bottom: 7px;">비밀번호를
						잊으셨나요?</div>
					<div style="font-size: 13px; color: #aaa; margin-bottom: 7px; font-weight: bold;">가입했던
						이메일을 적어주세요</div>
					<div style="font-size: 13px; color: #aaa; margin-bottom: 38px; font-weight: bold;">입력하신
						이메일 주소로 비밀번호를 보낼게요</div>
					<form class="form-horizontal" id='pwdFind_modal_form' name='pwdFind_modal_form' method="post">
						<div class="form-group">
							<div class="col-xs-12">
								<input type="email" class="form-control j_m" id="find_pwd_email" name="find_pwd_email"
									placeholder="example@google.com">
								<div id="email_text3"></div>
							</div>
						</div>
					</form>
					<div>
						<button type="button" class="btn btn-default btn-lg btn-block" id='btn_find_pwd_send'>비밀번호 이메일로
							보내기</button>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="color: #ff2f6e; border: none; font-weight: bold;">닫기</button>
					<button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
						data-target="#pwdFind_result" id="f_r" style="display: none"></button>
				</div>

			</div>
		</div>
	</div>
	<!-- 비밀번호 변경 결과-->
	<div class="modal fade" id="pwdFind_result" aria-hidden="true" style="display: none; z-index: 1070;">
		<div class="modal-dialog" style="position: relative; top: 185px; width: 323px;">
			<div class="modal-content">
				<div class="modal-header" style="border: none;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center; font-size: 16px;">
					<div id="find_result_text"></div>
				</div>
				<div class="modal-footer" style="text-align: center">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="color: #ff2f6e; border: none; font-weight: bold;">닫기</button>
				</div>

			</div>
		</div>
	</div>

	<form id="m_main_frm" method="post">
		<input type="hidden" name="mId" id="m_main_frm_mId" />
	</form>

	<script>
		btnFunc();
		let view = function (find) {
			$('#findStr').val(find);
			$('#frm').attr('action', 'Content_select.mm').submit();
			if (localStorage.getItem("findStr") == null) {
				var arr = new Array();
				arr.push(find);
				localStorage.setItem("findStr", JSON.stringify(arr));
			} else {
				var arr = JSON.parse(localStorage.getItem("findStr"));
				if (arr.length > 5) {
					arr.splice(0, 1);
					arr.push(find);
					localStorage.setItem("findStr", JSON.stringify(arr));
				} else {
					arr.push(find);
					localStorage.setItem("findStr", JSON.stringify(arr));
				}
			}

		}

		$('#findStr').click(function () {
			$('#subBar').show();
			$('#completeBar').hide();
			if (localStorage.getItem("findStr") != null) {
				var arr = new Array();
				arr = JSON.parse(localStorage.getItem("findStr"));
				let str = "";
				for (var i = 0; i < arr.length; i++) {
					let d = arr[i];
					str += '<div class="sub">' +
						'<div class="input-group" id="rc">' +
						'<input type="button" autocomplete="off"class="form-control" name="findStr" id="findStr3" value="' +
						d + '" onclick="view(' + '\'' + d +
						'\'' + ')">' + '</div>' +
						'</div>'
				}

				$('#recent_serch').html(str);
			}
				$.getJSON('/link-page/trend.jsp', function (json) {
					let str2 = ""
					if (json.length > 0) {
						for (let j = 0; j < json.length; j++) {
							let td = json[j];
							str2 += '<div class="sub">' +
								'<div class="input-group" id="td">' +
								'<input type="button" autocomplete="off"class="form-control" name="findStr" id="findStr3" value="' +
								td.trend + '" onclick="view(' + '\'' + td.trend +
								'\'' + ')">' + '</div>' +
								'</div>'
						}
						$('#trend').html(str2);
					}

				})
		})

		$('#findStr').focusout(function () {
			if ($('#del' + ':hover').length) {
				return;
			}
			if ($('#rc' + ':hover').length) {
				return;
			}

			if ($('#td' + ':hover').length) {
				return;
			}
			if ($('#findStr').val() == "") {
				$('#subBar').hide();
				$('#completeBar').hide();
			}
		})

		$('#findStr').keyup(function () {
			$('#subBar').hide();
			$('#completeBar').show();
			let param = $('#frm').serialize();
			$.getJSON('/link-page/findStr_complete.jsp', param, function (json) {
				let str = ""
				if (json.length > 0) {
					for (let i = 0; i < json.length; i++) {
						let d = json[i];
						str += '<div class="cmp"><div class="input-group" id="cmpB">' +
							'<span class="input-group-addon"><span id="gly_search" class="glyphicon glyphicon-search"' +
							'aria-hidden="true"></span></span> <input type="button" autocomplete="off"' +
							'class="form-control" name="findStr" id="findStr2" value="' +
							d.find +
							'" onclick="view(' +
							'\'' +
							d.find +
							'\'' +
							')">' +
							'<div id="suggetion_box"></div>' +
							'</div>' +
							'</div>'
					}
					$('#complete').html(str);
				}
			})
		})

		var lan = "▼ 한국어";
		$(document).ready(function () {
			$('#language').html(lan);
		})

		$('#kor1').click(function () {
			var k = confirm('정말 한국어로 바꾸시겠습니까?');
			if (k == true) {
				lan = "▼ 한국어";
				$('#lang-change').modal('hide');
			}
		})

		$('#kor2').click(function () {
			var k = confirm('정말 Korean으로 바꾸시겠습니까?');
			if (k == true) {
				lan = "▼ KOREAN";
				$('#language').html(lan);
				$('#lang-change').modal('hide');
			}
		})

		$('#kor3').click(function () {
			var k = confirm('정말 韓國語로 바꾸시겠습니까?');
			if (k == true) {
				lan = "▼ 韓國語";
				$('#language').html(lan);
				$('#lang-change').modal('hide');
			}
		})
		$('#del').click(function(){
			if(localStorage.getItem('findStr')!= null){
				localStorage.removeItem('findStr');
				$('#recent_serch').html("");
			}
		})
		main_login();
		main_join();
		btn_logout_after();
		login_form_check();
		login_btn_attr();
		join_form_check();
		join_btn_attr();
		findPwd_form_check();
		find_pwd();
	</script>
	<script src="./lib/script/member.js"></script>
	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId({
			clientId: "srD_3hOx7PFIuYIDdNAf",
			callbackUrl: "http://192.168.0.30:8888/link-page/naverLogin.jsp",
			isPopup: true,
			/* 팝업을 통한 연동처리 여부 */
			loginButton: {
				color: "green",
				type: 1,
				height: 60
			}
			/* 로그인 버튼의 타입을 지정 */
		}); /* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
	</script>

</body>

</html>