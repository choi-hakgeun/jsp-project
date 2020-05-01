<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="/lib/css/member_css.css" type='text/css' rel="stylesheet">
<link href="/lib/css/bootstrap.min.css" type='text/css' rel="stylesheet">
<!-- <link href="/lib/css/main_page.css" type='text/css' rel="stylesheet"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/lib/script/bootstrap.min.js"></script>
<link rel="stylesheet" href="/lib/css/top.css" />

</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<script>
		var mId = sessionStorage.getItem("mId");
	</script>
	<!-- top.html -->
	<%@include file="top.html"%>
	<div class="container">
		<div class="row">
			<div class="col-xs-8 col-xs-offset-2">
				<!-- 멤버창 전체그리드 -->
				<div class="row">
					<div class='col-xs-12' id='m'>
						<!-- 멤버창 전체배경 -->
						<div class="row">
							<div class='col-xs-12' id='d'>
								<!-- 멤버창 상단배경 -->
								<div class="row">
									<div class='col-xs-12 text-right' id='a'>
										<!-- 톱니바퀴중접그리드 -->
										<button type='button' class="btn btn-outline-danger "
											data-toggle="modal" data-target="#member_modal"
											style="background-color: rgba(0, 0, 0, 0)">
											<!-- 톱니바퀴이미지 -->
											<span class="glyphicon glyphicon-cog" aria-hidden="true"
												style='font-size: 20px; color: #ffffff;'> </span>
											<!-- 멤버창상단톱니버튼부분 -->
										</button>
									</div>
								</div>
								<div class="row">
									<div class='col-xs-12' id='y'>
										<c:choose>
											<c:when test="${empty vo.mPhoto }">
												<img src="/lib/images/default_profile.png"
													class="img-responsive img-circle" id="i">
												<!-- 프로필이미지 -->
											</c:when>
											<c:otherwise>
												<img src='${vo.mPhoto }'
													class="img-responsive img-circle" id="i">
											</c:otherwise>
										</c:choose>
									</div>
									<!-- 프로필이미지 end id=y -->
								</div>
								<!-- 프로필이미지 row end -->
								<div class="row">
									<div class='col-xs-12' id='f'>
										<form id='m_main_frm' name='m_main_frm' method="post">
											<input type='hidden' id="m_main_frm_mId" name='mId'
												value='${vo.mId }'> <strong><h3
													style="line-height: 10%; font-size: 25px; font-weight: 700;">${vo.mName }</h3></strong></a><br>
											<span style="font-size: 15px; font-weight: 500;">${vo.mProfile }</span></br>
											<hr>
											<input type='button' class='taste_icon' id="taste">
											<hr>
										</form>
									</div>
								</div>
								<div class="row">
									<div class='col-xs-12' id='t'>
										<!-- 맴버창 하단 -->
										<div align="center">
											<button class="btn btn-default" id='movie'
												style="text-align: left; margin-bottom: 10px;">
												<span class='h'>영화</span></br> <span class='h'>★</span> <span
													class='h'>${vo.mMovieCnt }</span></br>
												</br>
												</br>
												</br>
												</br>
												</br>
												</br> <span class='g'>보고싶어요</span> <span class='g'>${vo.mMovieWant }</span>

											</button>
											<button class="btn btn-default" id='tv'
												style="text-align: left; margin-bottom: 10px;">
												<span class='h'>TV</span></br> <span class='h'>★</span> <span
													class='h'>${vo.mTvCnt }</span></br>
												</br>
												</br>
												</br>
												</br>
												</br>
												</br> <span class='g'>보고싶어요</span> <span class='g'>${vo.mTvWant }</span>
											</button>
										</div>
									</div>
									<!-- 맴버창 하단 id=t end-->
								</div>
								<!-- 맴버창 하단 row end-->
							</div>
							<!-- 맴버창 상단배경end id=d -->
						</div>
						<!-- 맴버창 상단배경row end-->
					</div>
					<!-- 맴버창 전체배경 end id=m -->
				</div>
				<!-- 맴버창 전체배경row end-->				
			</div>
			<!-- 멤버창 전체그리드 end-->
		</div>
		<!-- 멤버창 전체그리드 row end-->
	</div>
	<!-- container end -->
<!-- 메인 하단 bottom.jsp -->
<footer class="container" style='position:absolute; bottom:0; width:100%;  height:70px; ' >
		<div align="center">
			<span>지금까지 </span>
			<span style="color: orange;">★ 523,310,203개의 평가가 </span>
			<span>쌓였으면 좋았을텐데.</span>
		</div>
			<div align="right" style="bottom:0px; margin-right:200px;">
				<button type="button" class="btn btn-info btn-circle"
					onclick="window.open('https://twitter.com/watcha_app')">
					<img src="./lib/images/mainPage_image/twitter.png"
						style="max-width: 70%">
				</button>
				<i class="fa fa-link"></i>
				<button type="button" class="btn btn-primary btn-circle"
					onclick="window.open('https://www.facebook.com/watchaplay/')">
					<img src="./lib/images/mainPage_image/facebook.png"
						style="max-width: 70%">
				</button>
				<i class="fa fa-link"></i>
				<button type="button" class="btn btn-default btn-circle"
					onclick="window.open('https://team.watcha.com/blog/')">
					<img src="./lib/images/mainPage_image/instagram.png"
						style="max-width: 70%;">
				</button>
			</div>			
			<div align="center" id="ft_txt">
					<p>seechaⓒ & JHTA All Rights Reserved</p>
					<p>서비스 이용약관</p>
					<p>개인정보 처리방침</p> 
					<p>사업자 등록번호 (123-123123)</p>					
			</div>
			<div align="right" style="margin-right:300px;">
				<button type="button" data-toggle="modal" data-target="#lang-change"
					id="language" class="btn btn-default">▼ 한국어</button>
			</div>


		

	</footer>
	

	
	<!-- member_modal -->
	<div class="modal fade" id="member_modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 600px;">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">공지사항</h4>

					<table class="table table-hover">
						<thead>
							<tr>
								<th class='col-xs-2'>작성일</th>
								<th class='col-xs-10 text-center'>제목</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">2020.02.20</th>
								<td>CPT 스토어 종료 및 CPT 프로젝트 중단 안내</td>
							</tr>
							<tr>
								<th scope="row">2020.02.26</th>
								<td>CPT 스토어 종료 기한 연장 안내</td>
							</tr>
							<tr>
								<th scope="row">2019.12.17</th>
								<td>왓챠플레이 프리미엄 이용권 출시!</td>
							</tr>
						</tbody>
					</table>
					<button type="button" class="btn btn-link btn-lg" ><a href ="../link-page/main_board.jsp">
						<!-- data-dismiss="modal" data-toggle="modal" data-target="#notice_modal" -->
						<h5 class="modal-title">
							<strong>공지사항 더보기</strong>
						</h5></a>
					</button>
				</div>
				<div class="modal-body">
					<h5 class="modal-title">고객센터</h5>					
					<hr>
					<h4 class="modal-title">
						<strong>Q & A</strong>
					</h4>
					<table class="table table-hover">
						<thead>
							<tr>
								<th class='col-xs-2'>작성일</th>
								<th class='col-xs-10 text-center'>제목</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">2020.02.20</th>
								<td>CPT 스토어 종료 및 CPT 프로젝트 중단 안내</td>
							</tr>
							<tr>
								<th scope="row">2020.02.26</th>
								<td>CPT 스토어 종료 기한 연장 안내</td>
							</tr>
							<tr>
								<th scope="row">2019.12.17</th>
								<td>왓챠플레이 프리미엄 이용권 출시!</td>
							</tr>
						</tbody>
					</table>
					<button type="button" class="btn btn-link btn-lg" ><a href="../link-page/boards/board_QA.jsp">
						<!-- data-dismiss="modal" data-toggle="modal" data-target="#qna_modal" -->
						<h5 class="modal-title">
							<strong>Q&A 더보기</strong>
						</h5></a>
					</button>
				</div>
				<hr>
				<h4 class="modal-title"
					style='margin-left: 20px; margin-bottom: 20px;'>
					<a href='https://forms.gle/DbPNmwurwJj4hasr5'><strong>DB
							추가 / 수정 요청</strong></a>
				</h4>
				<hr>
				<h4 class="modal-title"
					style='margin-left: 20px; margin-bottom: 20px;'>
					<a href='mailto:nojak85@gmail.com'><strong>문의, 피드백
							메일보내기</strong></a>
				</h4>
				<div class="modal-footer text-right">

					<button type="button" class="btn btn-default" data-dismiss="modal"
						data-toggle="modal" data-target="#member_view_modal"
						id='m_btnView' name='m_btnView'>회원정보상세보기</button>

					<button type="button" class="btn btn-default" data-dismiss="modal"
						data-toggle="modal" data-target="#member_modify_modal">회원정보수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						data-toggle="modal" data-target="#logout-modal">로그아웃</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						data-toggle="modal" data-target="#member_delete_modal">회원탈퇴</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- member_modal end -->

	<!-- notice modal -->
	<div class="modal fade" id="notice_modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 600px;">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">공지사항 모달입니다</h4>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-link btn-lg"
						data-dismiss="modal">
						<h4 class="modal-title">
							<strong>더보기</strong>
						</h4>
					</button>
				</div>
				<div class="modal-footer text-right">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- notice_modal end-->

	<!-- faq_modal -->
	<div class="modal fade" id="faq_modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 600px;">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">FAQ 모달입니다</h4>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-link btn-lg"
						data-dismiss="modal">
						<h4 class="modal-title">
							<strong>더보기</strong>
						</h4>
					</button>
				</div>
				<div class="modal-footer text-right">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- faq_modal end-->

	<!-- qna_modal -->
	<div class="modal fade" id="qna_modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 600px;">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">Q&A 모달입니다</h4>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-link btn-lg"
						data-dismiss="modal">
						<h4 class="modal-title">
							<strong>더보기</strong>
						</h4>
					</button>
				</div>
				<div class="modal-footer text-right">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- qna_modal end-->

	<!-- member_view_modal -->
	<div class="modal fade" id="member_view_modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 600px;">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">회원정보 상세보기</h4>
					<hr>
					<form class="form-horizontal" method="post" id='m_view_frm'
						name='m_view_frm'>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<p class="form-control-static" style='text-align:left;'>${vo.mId }</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								<p class="form-control-static" style='text-align:left;'>${vo.mName }</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Phone</label>
							<div class="col-sm-10">
								<p class="form-control-static" style='text-align:left;'>${vo.mPhone }</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Profile</label>
							<div class="col-sm-10">
								<p class="form-control-static" style='text-align:left;'>${vo.mProfile }</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Join Date</label>
							<div class="col-sm-10">
								<p class="form-control-static" style='text-align:left;'>${vo.mDate }</p>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10" style='text-align:left;'>
								<hr>
								<label class="col-sm-2 control-label">Profile picture</label>
								<c:choose>
									<c:when test="${empty vo.mPhoto }">
										<img src="/lib/images/default_profile.png" class="img-circle">
										<!-- 프로필이미지 -->
									</c:when>
									<c:otherwise>
										<img src='${vo.mPhoto }' class="img-circle" width='120px' height='120px'>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10" style='text-align:left;'>
								<button type="button" class="btn btn-default"
									data-dismiss="modal" data-toggle="modal"
									data-target="#member_modify_modal">회원정보수정</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer text-right">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- member_view_modal end-->

	<!-- member_modify_modal -->
	<div class="modal fade" id="member_modify_modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 600px;">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">회원정보수정</h4>
					<hr>
					<form class="form-horizontal" method="post" id='m_modify_frm'
						name='m_modify_frm' enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type='hidden' id="m_modify_mId" name='m_modify_mId'
									value='${vo.mId }'>
								<p class="form-control-static" style='text-align:left;'>${vo.mId }</p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputtext" class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="Name"
									name='mName' value="${vo.mName }">
							</div>
						</div>
						<div class="form-group">
							<label for="inputtel" class="col-sm-2 control-label">Mobile</label>
							<div class="col-sm-10">
								<input type="tel" class="form-control"
									placeholder=" '-'를 제외하고 입력하여주세요. " name='mPhone'
									value="${vo.mPhone }">
							</div>
						</div>
						<div class="form-group">
							<label for="inputtext" class="col-sm-2 control-label">Profile</label>
							<div class="col-sm-10" style='text-align:left;'>
								<input type="text" class="form-control"
									placeholder="프로필을 입력하여주세요." name='mProfile'
									value="${vo.mProfile }">
								<hr>
								<label for="exampleInputFile">프로필사진 수정</label></br>
								<c:choose>
									<c:when test="${empty vo.mPhoto }">
										<img src="/lib/images/default_profile.png"
											alt="Responsive image" class="img-circle" id='mPhoto'
											name='mPhoto' width='120px' height='120px'>
									</c:when>
									<c:otherwise>
										<img src='${vo.mPhoto }'
											class="img-circle" id='mPhoto' name='mPhoto' width='120px'
											height='120px'>
									</c:otherwise>
								</c:choose>
								</br> <input type="file" id="exampleInputFile" class="btn btn-link"
									name='mPhoto'>
								<p class="help-block">프로필을 꾸며보세요!</p>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10" style='text-align:left;'>
								<button type="button" class="btn btn-default"
									data-toggle="modal" id="m_btnModify" name="m_btnModify">수정하기</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer text-right">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#member_modifyR_modal" id="m_t"
						style="display: none"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- member_modify_modal end-->

	<!-- 회원정보수정 후 메세지 모달 -->
	<div class="modal fade" id="member_modifyR_modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<p class="text-center login_logo">seecha</p>
				</div>

				<div class="modal-body">
					<p class="text-center logout-text">회원정보가 정상적으로 수정되었습니다.</p>
				</div>

				<div class="modal-footer logout-btns">
					<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원정보수정 후 메세지 모달 끝 -->

	<!-- member_delete_modal -->
	<div class="modal fade" id="member_delete_modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="width: 600px;">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">아이디와 비밀번호를 입력하시면 탈퇴가 이루어집니다.</h4>
					<hr>

					<form class="form-horizontal" method="post" id='m_delete_frm'
						name='m_delete_frm'>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="inputEmail3"
									name="inputEmail3" placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="inputPassword3"
									name="inputPassword3" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10"></div>
						</div>
					</form>
				</div>
				<!-- header end -->
				<div class="modal-footer text-right">
					<button type="submit" class="btn btn-default" id='m_btnDelete'
						name='m_btnDelete'>탈퇴하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#delete_false" id="d_f"
						style="display: none"></button>
					<button type="button" class="btn btn-primary btn-lg"
						data-toggle="modal" data-target="#member_delete_modal2" id="d_t"
						style="display: none"></button>
				</div>
			</div>

		</div>
	</div>
	<!-- member_delete_modal end-->

	<!-- 회원탈퇴 실패 모달  -->
	<div class="modal fade" id="delete_false" aria-hidden="true"
		style="display: none; z-index: 1060;">
		<div class="modal-dialog"
			style="position: relative; top: 185px; width: 323px;">
			<div class="modal-content">
				<div class="modal-header" style="border: none;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
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
	<!-- 회원탈퇴 실패 모달 끝 -->

	<!-- 회원탈퇴 확인 모달 -->
	<div class="modal fade" id="member_delete_modal2" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<p class="text-center login_logo">seecha</p>
				</div>

				<div class="modal-body">
					<p class="text-center logout-text">정말 탈퇴 하시겠습니까?</p>
				</div>


				<div class="modal-footer logout-btns">
					<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						data-toggle="modal" data-target="#member_delete_modal3">네</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원탈퇴확인 모달 끝 -->

	<!-- 회원탈퇴 후 메세지 모달 -->
	<div class="modal fade" id="member_delete_modal3" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<p class="text-center login_logo">seecha</p>
				</div>

				<div class="modal-body">
					<p class="text-center logout-text">이용해주셔서 감사합니다.</p>
				</div>

				<div class="modal-footer logout-btns">
					<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원탈퇴 후 메세지 모달 끝 -->

	<!-- 로그아웃 모달 시작 -->
	<div class="modal fade" id="logout-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
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
	<!-- 로그아웃 모달끝 -->
	<form id='member_main_frm' name='member_main_frm' method="post">
		<input type='hidden' name='member_hidden_id' id='member_hidden_id'>
		<input type="hidden" name="member_hidden_category"
			id="member_hidden_category" />
	</form>

	<div class="modal fade" id="testModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">성공이다!</div>
			</div>
		</div>
	</div>


	<script>
		if (sessionStorage.getItem("mId") != null) {
			$('#movie').click(function() {
				$('#member_hidden_id').val(sessionStorage.getItem("mId"));
				$('#member_hidden_category').val("0");
				$('#member_main_frm').attr('action', 'my_movies.he').submit();
			});
			$('#tv').click(function() {
				$('#member_hidden_id').val(sessionStorage.getItem("mId"));
				$('#member_hidden_category').val("1");
				$('#member_main_frm').attr('action', 'my_movies.he').submit();
			});
			$('#taste').click(function(){
				$('#member_hidden_id').val(sessionStorage.getItem("mId"));
				$('#member_main_frm').attr('action', 'my_taste.he').submit();
			})
		};
	</script>

	<script>
		m_btnFunc();
	</script>
</body>
</html>