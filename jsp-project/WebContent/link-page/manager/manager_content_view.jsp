<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_content_view</title>

<link href="../../lib/css/manager_content_insert.css" rel="stylesheet">

</head>
<body>
<form name="frm_con" id="frm_con" method="post">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div id="row" class="row">
                    <div class="col-xs-8 col-xs-offset-2 manager_content_insert_form">
                        <div id="row" class="row">
                            <div class="col-xs-8 manager_content_insert_text_form">
                                <div id="row">
	    							<div class="col-12">
		                                <div class="row">
		                                	<p class="manager_content_insert_text_result">
		                                    <label>콘텐츠 아이디</label>
		                                    <input class="form-control" name="c_id" id="c_id" type="text" placeholder="${ vo.c_id }" value="${ vo.c_id }" readonly>
		                                    <label>콘텐츠 제목</label>
		                                    <input class="form-control" name="c_name" id="c_name" type="text" placeholder="${ vo.c_name }" value="${ vo.c_name }" readonly>
		                                    <label>콘텐츠 분류</label><br/>
		                             		<label class="radio-inline">
  												<input type="radio" name="c_category" id="c_category_m" value="${vo.c_category }">영화
											</label>
											<label class="radio-inline">
  												<input type="radio" name="c_category" id="c_category_d" value="${ vo.c_category }">드라마
											</label><br/>
		                                    <label>콘텐츠 장르</label>
		                                    <input class="form-control" name="c_genre" id="c_genre" type="text" placeholder="${vo.c_genre }" value="${ vo.c_genre }" readonly>
		                                    <label>줄거리</label>
		                                    <textarea class="form-control" rows="3" name="c_story" id="c_story" placeholder="${ vo.c_story }" readonly>
		                                    ${ vo.c_story }
                                    		</textarea>
		                                    <label>예고편</label>
		                                    <input class="form-control" name="c_preview" id="c_preview" type="text" placeholder="${ vo.c_preview }" value="${ vo.c_preview }" readonly>
		                                    <label>기타 정보</label>
		                                    <input class="form-control" name="c_other" id="c_other" type="text" placeholder="${ vo.c_other }" value="${ vo.c_other }" readonly>
		                                	<label>콘텐츠 상세보기 메인사진</label>
		                                	<input type="file" name="c_image" id="c_image" value="${ vo.c_image }" disabled>
		                                    <label>갤러리</label>
		                                    </p></div><div class="row manager_contentGally_insert_img_form">
		  										<div class="col-xs-4 col-md-5">
											      <input type="file" name="c_image" id="c_image" value="${ vo.c_image }" disabled>
											  	</div>
												<div class="col-xs-4 col-md-5">
											      <input type="file" name="c_image" id="c_image" value="${ vo.c_image }" disabled>
											  	</div>
											  	<div class="col-xs-4 col-md-5">
											      <input type="file" name="c_image" id="c_image" value="${ vo.c_image }" disabled>
											  	</div>
											  	<div class="col-xs-4 col-md-5">
											      <input type="file" name="c_image" id="c_image" value="${ vo.c_image }" disabled>
											  	</div>
											</div>
		                                <p></p>
		                                <p class="manager_content_insert_btn_result">
		                                    <button type="button" class="btn btn-default btn-lg mr-3" name='content_btn_modi' id='btn_content_modi'>수정</button>
                                    		<button type="button" class="btn btn-default btn-lg" name='content_btn_back' id='btn_content_back'>뒤로</button>
		                                </p>
		                                </div> 
		                                <input type="hidden" name="c_id" value="" /> 
	                               	</div>
	                            </div>
                            <div class="col-xs-4 manager_content_insert_img_form">
                            <c:choose>
                            <c:when test="${vo.c_image != null }">
                         	   <img src="${vo.c_image }" class="img-thumbnail manager_content_view_img_result" id="c_image">
                            </c:when>
                            <c:otherwise>
                            	<img src="../../lib/images/기본이미지.png" class="img-thumbnail manager_content_view_img_result" id="c_image">
                            </c:otherwise>
                            </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
if(${vo.c_category}==0){
	$('#c_category_m').prop('checked',true)
}else{
	$('#c_category_d').prop('checked',true)
}
btnFunc()
</script>
</body>
</html>