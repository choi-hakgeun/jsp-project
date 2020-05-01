<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_comment_view</title>

<link href="/lib/css/manager_comment_view.css" rel="stylesheet">
</head>
<body>
<form name="frm" id="frm" method="post">
  <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div id="row">
                    <div class="col-xs-8 col-xs-offset-2 manager_comment_view_form">
                        <div id="row">
                            <div class="col-xs-8 manager_comment_view_text_form">
                                <div id="row">
                                <p class="manager_comment_view_text_result">
									<label>작성한 회원 아이디</label>
                                    <input class="form-control" name="com_mId" id="com_mId" type="text" placeholder="${ vo.com_mId }" value="${ vo.com_mId }" readonly>
                                    <label>작성된 콘텐츠 아이디</label>
                                    <input class="form-control" name="com_cId" id="com_cId" type="text" placeholder="${ vo.com_cId }" value="${ vo.com_cId }" readonly>
                                    <label>코멘트 좋아요</label>
                                    <input class="form-control" name="com_like" id="com_like" type="text" placeholder="${ vo.com_like }" value="${ vo.com_like }" readonly>
                                    <label>코멘트 내용</label>
                                    <textarea class="form-control" rows="3" name="con_content" id="con_content" readonly>${ vo.con_content }</textarea>
                                </p>
                                <p class="manager_comment_view_btn_result">
                                    <button type="button" class="btn btn-default btn-lg mr-3" id='btn_comment_modi'>수정</button>
                                    <button type="button" class="btn btn-default btn-lg" id='btn_comment_back'>뒤로</button>
                                </p>
                                </div>
                                <input type="hidden" name="com_mId" value="" />
                            </div>
                            <div class="col-xs-4 manager_comment_view_img_form">
                                <img src="../../lib/images/기본이미지.png" class="img-thumbnail manager_comment_view_img_result">
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