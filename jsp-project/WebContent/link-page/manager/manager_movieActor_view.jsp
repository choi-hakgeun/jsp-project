<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_movieActor_view</title>

<link href="../../lib/css/manager_movieActor_view.css" rel="stylesheet">
</head>
<body>
<form name="frm" id="frm" method="post">
  <div class="container">
        <div class="row">
            <div class="col-xs-12 ">
                <div id="row">
                    <div class="col-xs-8 col-xs-offset-2 manager_movieActor_view_form">
                        <div id="row">
                            <div class="col-xs-8 manager_movieActor_view_text_form">
                                <div id="row">
                                <p class="manager_movieActor_view_text_result">
                                    <label>아이디</label>
                                    <input class="form-control" name="a_id" id="a_id" type="text" placeholder="${ vo.a_id }" value="${ vo.a_id }" readonly>
                                    <label>역할</label><br/>
									<label class="radio-inline">
  										<input type="radio" name="a_position" id="a_position_a" value="${ vo.a_position }" readonly> 출연
									</label>
                                    <label class="radio-inline">
  										<input type="radio" name="a_position" id="a_position_m" value="${ vo.a_position }" readonly> 연출
									</label>
									<br/>
                                    <label>이름</label>
                                    <input class="form-control" name="a_name" id="a_name" type="text" placeholder="${ vo.a_name }" value="${ vo.a_name }" readonly>
                                    <label>출연작</label>
                                    <input class="form-control" name="a_work" id="a_work" type="text" placeholder="${ vo.a_work }" value="${ vo.a_work }" readonly>
                                </p>
                                <p class="manager_movieActor_view_btn_result">
                                    <button type="button" class="btn btn-default btn-lg mr-3" id="btn_movieActor_modi">수정</button>
                                    <button type="button" class="btn btn-default btn-lg" id="btn_movieActor_back">뒤로</button>
                                </p>
                                </div>
                                <input type="hidden" name="a_id" value="" />
                            </div>
                            <div class="col-xs-4 manager_movieActor_view_img_form">
                            <c:choose>
                            <c:when test="${vo.a_photo != null }">
                         	   <img src="${vo.a_photo }" class="img-thumbnail manager_movieActor_view_img_result" id="a_photo">
                            </c:when>
                            <c:otherwise>
                            	<img src="../../lib/images/기본이미지.png" class="img-thumbnail manager_movieActor_view_img_result" id="a_photo">
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
if(${ vo.a_position} == 1){
	$('#a_position_m').prop('checked', true)
}else{
	$('#a_position_a').prop('checked', true)
}
btnFunc()
</script>

</body>
</html>