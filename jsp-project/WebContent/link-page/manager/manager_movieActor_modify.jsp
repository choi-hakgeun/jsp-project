
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_movieActor_modify</title>

<link href="../../lib/css/manager_movieActor_modify.css" rel="stylesheet">

</head>
<body>
<form name="frm" id="frm" method="post" enctype="multipart/form-data">
  <div class="container">
        <div class="row">
            <div class="col-xs-12 ">
                <div id="row">
                    <div class="col-xs-8 col-xs-offset-2 manager_movieActor_modify_form">
                        <div id="row">
                            <div class="col-xs-8 manager_movieActor_modify_text_form">
                                <div id="row">
                                <p class="manager_movieActor_modify_text_result">
                                    <label>아이디</label>
                                    <input class="form-control" name="a_id" id="a_id" type="text" placeholder="${ vo.a_id }" value="${ vo.a_id }" readonly>
                                    <label>역할</label><br/>
									<label class="radio-inline">
  										<input type="radio" name="a_position" id="a_position_a" value="0"> 출연
									</label>
                                    <label class="radio-inline">
  										<input type="radio" name="a_position" id="a_position_m" value="1"> 연출
									</label>
									<br/>
                                    <label>이름</label>
                                    <input class="form-control" name="a_name" id="a_name" type="text" placeholder="${ vo.a_name }" value="${ vo.a_name }">
                                    <label>출연작</label>
                                    <input class="form-control" name="a_work" id="a_work" type="text" placeholder="${ vo.a_work }" value="${ vo.a_work }">
                                </p>
                                <p class="manager_movieActor_modify_btn_result">
                                    <button type="button" class="btn btn-default btn-lg mr-3" id="btn_movieActor_update">수정</button>
                                    <button type="button" class="btn btn-default btn-lg mr-3" id="btn_movieActor_del">삭제</button>
                                    <button type="button" class="btn btn-default btn-lg" id="btn_movieActor_back">뒤로</button>
                                </p>
                                </div>
                                <input type="hidden" name="findStr" value="${ param.findStr }" />
                            </div>
                            <div class="col-xs-4 manager_movieActor_modify_img_form">
                                <img src="${ vo.a_photo }" class="img-thumbnail manager_movieActor_modify_img_result" id="a_photo">
                                <input type="file" name="memberPhoto" id="btnMovieActorFile">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
if(${ vo.a_position} == 0){
	$('#a_position_a').prop('checked', true)
}else{
	$('#a_position_m').prop('checked', true)
}
btnFunc()
</script>

</body>
</html>