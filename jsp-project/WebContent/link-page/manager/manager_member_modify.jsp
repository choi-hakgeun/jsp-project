<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>manager_member_view</title>

<link href="../../lib/css/manager_member_modify.css"rel="stylesheet">
</head>
<body>
<form name="frm" id="frm" method="post">
  <div class="container">
        <div class="row">
            <div class="col-xs-12 ">
                <div id="row">
                    <div class="col-xs-8 col-xs-offset-2 manager_member_modify_form">
                        <div id="row">
                            <div class="col-xs-8 manager_member_modify_text_form">
                                <div id="row">
                                <p class="manager_member_modify_text_result">
                                    <label>이메일</label>
                                    <input class="form-control" name="m_mId" id="m_mId" type="text" placeholder="${ vo.m_mId }" value="${ vo.m_mId }" >
                                    <label>회원명</label>
                                    <input class="form-control" name="m_name" id="m_name" type="text" placeholder="${ vo.m_name }" value="${ vo.m_name }" >
                                    <label>프로필</label>
                                    <input class="form-control" name="m_profile" id="m_profile" type="text" placeholder="${ vo.m_profile }" value="${ vo.m_profile }" >
                                    <label>연락처</label>
                                    <input class="form-control" name="m_phone" id="m_phone" type="text" placeholder="${ vo.m_phone }" value="${ vo.m_phone }" >
                                    <label>등록일</label>
                                    <input class="form-control" name="m_date" id="m_date" type="date" placeholder="${ vo.m_date }" value="${ vo.m_date }" >
                                </p>
                                <p class="manager_member_modify_btn_result">
                                    <button type="button" class="btn btn-default btn-lg mr-3" name="btn_member_modi_save" id="btn_member_update">수정</button>
                                    <button type="button" class="btn btn-default btn-lg mr-3"  name='manager_btn_del' id='btn_member_del'>삭제</button>
                                    <button type="button" class="btn btn-default btn-lg" name="btn_member_modi_back" id="btn_member_back">뒤로</button>
                                </p>
                                <input type="hidden" name="m_mId" value="" />
                                <input type="hidden" name="findStr" value="${ param.findStr }" />
                                </div>
                            </div>
                            <div class="col-xs-4 manager_member_modify_img_form">
                                <img src="${ vo.m_photo }" class="img-thumbnail manager_member_modify_img_result">
                                <input type="file" name="memberPhoto" id="btnMemberFile">
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