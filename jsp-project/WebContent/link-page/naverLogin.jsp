<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>NaverLoginSDK</title>
   <script src="/lib/script/he_main.js"></script>
   <script src="/lib/script/jquery-3.4.1.js"></script>
   <link href="/lib/css/bootstrap.css" rel="stylesheet">
   <script src="../lib/script/bootstrap.min.js"></script>
   
</head>

<body>

   <div>
      <form class="form-horizontal" action="/link-page/naverSignIn.jsp">
         <!--<span>이메일</span> <input type="text" name="emailField" id="emailField" /><br>
         <span>이름</span> <input type="text" name="nameField" id="nameField" /><br>
         <span>연락처</span> <input type="text" name="phoneField" id="phoneField" /><br>
         <input type="hidden" name="snsId" id="snsId" />
         <input type="submit" value="등록" />-->
        
 	 <div class="form-group">
 	   <label for="inputEmail3" class="col-sm-2 control-label" style="margin-top: 20px;margin-left: 10px;">이메일</label>
   	   <div class="col-sm-10">
     	  <input type="text" class="form-control" name="emailField" id="emailField" placeholder="Email" style="width:482px;margin-left:10px;height:44px;background: #eee;">
	   </div>
	  </div>
	   <div class="form-group">
 	   <label for="inputEmail3" class="col-sm-2 control-label" style="margin-left: 10px;">이름</label>
   	   <div class="col-sm-10">
     	  <input type="text" class="form-control" name="nameField" id="nameField" placeholder="name" style="width:482px;margin-left:10px;height:44px;background: #eee;">
	   </div>
	  </div>
	   <div class="form-group">
 	   <label for="inputEmail3" class="col-sm-2 control-label" style="margin-left: 10px;">연락처</label>
   	   <div class="col-sm-10">
     	  <input type="text" class="form-control" name="phoneField" id="phoneField" placeholder="phone" style="width:482px;margin-left:10px;height:44px;background: #eee;">
	   </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-default" style="margin-left: 10px;width: 482px;height: 47px;background:#ff2f6e;color: white;font-weight: bold;font-size: 21px;">등록</button>
	    </div>
	  </div>
	    <input type="hidden" name="snsId" id="snsId" />
	</form>
         
         
     
   </div>

   <!-- (1) LoginWithNaverId Javscript SDK -->
   <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


   <!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
   <script>
      var naverLogin = new naver.LoginWithNaverId(
         {
            clientId : "srD_3hOx7PFIuYIDdNAf",
            callbackUrl : "http://127.0.0.1:8888/link-page/naverLogin.jsp",
            isPopup: true,
            callbackHandle: true
            /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
         }
      );

      /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
      naverLogin.init();

      /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
      window.addEventListener('load', function () {
         naverLogin.getLoginStatus(function (status) {
            if (status) {
               /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
               var name = naverLogin.user.getNickName();
               var uniqId = naverLogin.user.getId();
               
               
               $.ajax({
                  type:'post',
                  url:'/link-page/naver-login-check.jsp',
                  data:{
                     'id':uniqId
                  },
                  success : function(data){
                     var status = data.trim();
                     
                     if(status == "no"){
                        $('#snsId').val(uniqId);
                     } else{
                        window.opener.sessionStorage.setItem("mId", status);
                        opener.location.reload();
                        window.close();
                     }// end of if
                  }
               })

               

            } else {
               console.log("callback 처리에 실패하였습니다.");
            }
         });
      });
   </script>
</body>

</html>