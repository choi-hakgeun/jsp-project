<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>부트스트랩 101 템플릿</title>
 
    <!-- 부트스트랩 -->
    <link href="/lib/css/bootstrap.min.css" rel="stylesheet">
    <link href="/lib/css/top.css" rel="stylesheet">
    

  </head>
  <body>
    <header class="hd">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="row top">
                    <div class="col-xs-3">
                        <span id="logo">watcha</span>
                    </div>
                    <div class="col-xs-6">
                        <div class="form-group">
                            <div class="input-group  form-group-lg">

                                <span class="input-group-addon"> <span class="glyphicon glyphicon-search"
                                        aria-hidden="true"></span></span>
                                <input type="text" class="form-control" id="findStr" placeholder="작품,배우,감독을 검색해 보세요">
                                <span class="input-group-addon">
                                	<a>
	                                	<span class="glyphicon glyphicon-remove-circle"
	                                        aria-hidden="true"></span>
	                                </a>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-3 div-2">
                        <div class="form-group">
                            <div class="input-group" id="profile-group">
                                <span class="input-group-addon span1">
                                	<a> 
                                <span class="glyphicon glyphicon-off"
                                        aria-hidden="true" id="logout"></span>
                                       </a>
                                        </span>
                                <span class="input-group-addon span2" id="logout-span">
                                <a>
                                <img src="/lib/images/default_profile.png"
                                        class="img-circle" id="profile-image">
                                        </a>
                                        </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>

   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/lib/script/bootstrap.min.js"></script>
  </body>
</html>