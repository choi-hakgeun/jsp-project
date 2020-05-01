<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>seecha</title>

    <!-- 부트스트랩 -->
    <link href="../lib/css/bootstrap.min.css" rel="stylesheet">
    <link href="../lib/css/top.css" rel="stylesheet">
    <link href="../lib/css/findTop.css" rel="stylesheet">

</head>
<body>
 <header class="hd">
        <nav class="navbar navbar-default navbar-fixed-top"><!--상단 고정 위한 nav class -->
            <div class="container-fluid"><!--로고/검색어/로그아웃/프로필  -->
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
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove-circle"
                                        aria-hidden="true"></span></span>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-3 div-2">
                        <div class="form-group">
                            <div class="input-group" id="profile-group">
                                <span class="input-group-addon span1"> <span class="glyphicon glyphicon-off"
                                        aria-hidden="true" id="logout"></span></span>
                                <span class="input-group-addon span2" id="logout-span"><img src="/lib/images/default_profile.png"
                                        class="img-circle" id="profile-image"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid"><!-- 타이틀/뒤로가기 -->
                <div class="row">
                    <div class="col-xs-12 findTop-div1">
                        <button type="button" class="btn btn-default" id="findTop-button" aria-label="Left Align">
                            <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span><!--뒤로가기 -->
                      </button> 
                        <div class="findTop-title">영화</div>
                    </div>
                </div>
            </div>

        </nav>
    </header>





    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../lib/script/bootstrap.min.js"></script>
</body>

</html>