<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_content_view</title>

<link href="/lib/css/manager_content_insert.css" rel="stylesheet">

</head>
<body>
<form name="frm" id="frm" method="post" enctype="multipart/form-data">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div id="row">
                    <div class="col-xs-8 col-xs-offset-2 manager_content_insert_form">
                        <div id="row">
                            <div class="col-xs-8 manager_content_insert_text_form">
                                <div id="row">
                                <p class="manager_content_insert_text_result">
                                    <label>콘텐츠 아이디</label>
                                    <input class="form-control" name="c_id" id="c_id" type="text" placeholder="">
                                    <label>콘텐츠 제목</label>
                                    <input class="form-control" name="c_name" id="c_name" type="text" placeholder="">
                                    <label>콘텐츠 분류</label><br/>
		                            <label class="radio-inline">
  										<input type="radio" name="c_category" id="c_category" value="0"> 영화
									</label>
									<label class="radio-inline">
  										<input type="radio" name="c_category" id="c_category" value="1"> 드라마
									</label><br/>
                                    <label>콘텐츠 장르</label>
                                    <input class="form-control" name="c_genre" id="c_genre" type="text" placeholder="">
                                    <label>줄거리</label>
                                    <textarea class="form-control" rows="3" id="c_story" name="c_story" >
                                    	sdfsdfdsfsdfsdfsdfsdfsfffffffffffffffffffffffffffffffffffffffffffffffffffff
                                    </textarea>
                                    <label>예고편</label>
                                    <input class="form-control" name="c_preview" id="disabledInput c_preview" type="text" placeholder="">
                                    <label>날짜</label>
                                    <input class="form-control" name="c_date" id="disabledInput c_other" type="text" placeholder="">
                                    <label>콘텐츠 상세보기 메인사진</label>
		                                	<input type="file" name="contentPhoto-long">
		                                    <label>갤러리</label>
		                                    </p></div>
		                                    <div class="row manager_contentGally_insert_img_form">
		  										<div class="col-xs-4 col-md-5">
											      <input type="file" name="galleryPhoto1" id="btnContentFile1">
											  	</div>
												<div class="col-xs-4 col-md-5">
											      <input type="file" name="galleryPhoto2" id="btnContentFile2">
											  	</div>
											  	<div class="col-xs-4 col-md-5">
											      <input type="file" name="galleryPhoto3" id="btnContentFile3">
											  	</div>
											  	<div class="col-xs-4 col-md-5">				
											      <input type="file" name="galleryPhoto4" id="btnContentFile4">
											  	</div>
											</div>
		                                <p>
                                </p>
                                <p class="manager_content_insert_btn_result">
                                    <button type="button" class="btn btn-default btn-lg mr-3" id='btn_content_register'>저장</button>
                                    <button type="button" class="btn btn-default btn-lg" id='btn_content_back'>뒤로</button>
                                </p>
                                </div>
                                <input type="hidden" name="findStr" value="${ param.findStr }" />
                            </div>
                            <div class="col-xs-4 manager_content_insert_img_form">
                                <img src="../../lib/images/기본이미지.png" class="img-thumbnail manager_member_view_img_result" id="c_image">
                                <input type="file" name="contentPhoto-thumb" id="btnContentFile">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</form>
<Script>
btnFunc()
</Script>
</body>
</html>