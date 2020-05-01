
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_movieActor_insert</title>

<link href="../../lib/css/manager_movieActor_insert.css" rel="stylesheet">

</head>
<body>
<form name="frm" id="frm" method="post" enctype="multipart/form-data">
  <div class="container">
        <div class="row">
            <div class="col-xs-12 ">
                <div id="row">
                    <div class="col-xs-8 col-xs-offset-2 manager_movieActor_insert_form">
                        <div id="row">
                            <div class="col-xs-8 manager_movieActor_insert_text_form">
                                <div id="row">
                                <p class="manager_movieActor_insert_text_result">
                                    <label>아이디</label>
                                    <input class="form-control" name="a_id" id="a_id" type="text" placeholder="">
                                    <label>역할</label><br/>
									<label class="radio-inline">
  										<input type="radio" name="a_position" id="a_position" value="0"> 출연
									</label>
                                    <label class="radio-inline">
  										<input type="radio" name="a_position" id="a_position" value="1"> 연출
									</label>
									<br/>
                                    <label>이름</label>
                                    <input class="form-control" name="a_name" id="a_name" type="text" placeholder="">
                                    <label>출연작</label>
                                    <input class="form-control" name="a_work" id="a_work" type="text" placeholder="">
                                </p>
                                <p class="manager_movieActor_insert_btn_result">
                                    <button type="button" class="btn btn-default btn-lg mr-3" id="btn_movieActor_register">저장</button>
                                    <button type="button" class="btn btn-default btn-lg" id="btn_movieActor_back">뒤로</button>
                                </p>
                                </div>
                            </div>
                            <div class="col-xs-4 manager_movieActor_insert_img_form">
                                <img src="../../lib/images/기본이미지.png" class="img-thumbnail manager_movieActor_insert_img_result" name="a_photo" id="a_photo">
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
btnFunc()
</script>

</body>
</html>