<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>부트스트랩 101 템플릿</title>

    <!-- 부트스트랩 -->
    <link href="/lib/css/bootstrap.min.css" rel="stylesheet">
    <link href="/lib/css/findPage.css" rel="stylesheet">
    <script src="/lib/script/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="/lib/css/top.css" />
<!--     <script>
    sessionStorage.setItem("mid","shinwa46@naver.com");
    </script> -->
</head>


<body class=bd>

	<%@ include file="/link-page/top.html" %>
    <div class="cx">
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false"><!--이미지 슬라이드 위한 bs class-->
            <div class="carousel-inner"><!--이미지 슬라이드 위한 class -->
                <div class="item active"><!--화살표 넘기기전 화면 -->
                    <div class="container-fluid">
                        <div class="row" id="v">
                            <div class="col-xs-12">
                                <h4>상위 검색 결과</h4>
                                <div class="tf"><!-- 상위 검색 결과 전체 묶는 div(최대 10개) -->
                                    <div class="tf-s"> <!--하나의 검색 결과를 묶는 div / 상위3개는 화면크기 상관없이 항상 보임 -->
                                        
                                        <a href="javascript:goContents('dr01')" class="thumbnail">
                                            <img src="../lib/images/Las mejores películas de los 90s que las chicas deben ver.jpg"class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2017 · 미국/영국</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                        
                                    </div>
                                    <div class="tf-s">
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/Billy Elliot (2000).jpg" class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">빌리 엘리어트</div>
                                                <div class="mv-year">2000 · 영국/프랑스</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s">
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/Las mejores películas de los 90s que las chicas deben ver.jpg"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-wg"><!--화면이 532px 이하일 때 사라지는 div -->
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/Microhabitat - I Watch Free - IWatchfree _ Movie25….jpg"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-eg"><!-- 화면이 668px이하일 때 사라지는 div -->
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/Sinopsis Duck Town (2017) - Film Korea.jpg"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-rg "><!-- 화면이 826px이하일 때 사라지는 div -->
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/….jpg" class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-bg "><!-- 화면이 960px 이하일 때 사라지는 div  -->
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/한국전쟁 중 춤으로 하나된 남북한 실화_.도경수 주연의 '스윙키즈' _ Daum 영화"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-sg "><!-- 화면이 1107px 이하일때 사라지는 div -->
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/【インタビュー】「一生残るデザインを」韓国屈指のデザイナー陣が語る映画ポスターの在り方 15枚目の写真・画像 _ cinemacafe_net.jpg"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-vg "><!-- 화면이 1158px이하일 때 사라지는 div -->
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-mg"><!-- 화면이 1214px이하일 때 사라지는 div -->
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/“대부분 눈치 못 채” 봉준호 감독 신작 스틸컷의 '소름 돋는' 포인트 (사진).jpg"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버sdfdsfsdfsdfsfsf</div>
                                                <div class="mv-year">2018 · 영화sfsdfdsfsdfds</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <hr />
                            </div>

                        </div>
                    </div>
                </div>
                <div class="item"><!--이미지 슬라이더 화살표 누르면 나타나는 화면  -->
                    <div class="container-fluid">
                        <div class="row" id="v">
                            <div class="col-xs-12">
                                <h4>상위 검색 결과</h4>
                                <div class="tf">
                                    <div class="tf-s">
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/Las mejores películas de los 90s que las chicas deben ver.jpg" class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2017 · 미국/영국</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s">
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/Billy Elliot (2000).jpg" class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">빌리 엘리어트</div>
                                                <div class="mv-year">2000 · 영국/프랑스</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s">
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/Las mejores películas de los 90s que las chicas deben ver.jpg"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-wg">
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/Microhabitat - I Watch Free - IWatchfree _ Movie25….jpg"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-eg">
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/Sinopsis Duck Town (2017) - Film Korea.jpg"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-rg ">
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/….jpg" class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="tf-s hidden-bg ">
                                        <a href="#" class="thumbnail">
                                            <img src="../lib/images/한국전쟁 중 춤으로 하나된 남북한 실화_.도경수 주연의 '스윙키즈' _ Daum 영화"
                                                class="tf-img">
                                            <div class="mv-sf">
                                                <div class="mv-title">베이비 드라이버</div>
                                                <div class="mv-year">2018 · 영화</div>
                                                <div class="mv-genre">영화</div>
                                            </div>
                                        </a>
                                    </div>
                
                                </div>
                                <hr />
                            </div>

                        </div>
                    </div>
                </div>

                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><!--이미지 슬라이더 왼쪽 화살표 -->
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next"><!--이미지 슬라이더 오른쪽 화살표 -->
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="container-fluid"><!-- 영화 검색결과  -->
            <div class="row" id="v">
                <div class="col-xs-12">
                    <header><!-- 타이틀 -->
                        <h4>영화</h4>
                        <div class="more">
	                        <a href="/link-page/more-movie.jsp">
	                                                더보기
	                        </a>
                        </div>
                    </header>
                    <div class="movie"><!-- 검색 결과 -->
                        <div class="row">
                            <ul class="mv-ul">
                                <li><!-- 검색 결과 1개를 감싸는 li/상위 3개는 항상 보임  -->
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic"><!--검색결과 사진 -->
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des"><!-- 검색 결과 설명  -->
                                                <div class="mv-des-title">제목입니다1dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다2dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다3dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="hidden-2"><!--화면이 647px 이하일때 없어지는 검색결과 -->
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다4dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="hidden-2"><!--화면이 647px 이하일때 없어지는 검색결과 -->
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다5dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="hidden-2"><!--화면이 647px 이하일때 없어지는 검색결과 -->
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다6dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="hidden-1"><!-- 화면이 1201px 이하일때 없어지는 검색결과 -->
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다7dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="hidden-1"><!-- 화면이 1201px 이하일때 없어지는 검색결과 -->
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다8dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                            
                            </ul>
                     
                        </div>
                    <hr />
                </div>
            </div>
        </div>
        </div>

        <div class="container-fluid"><!-- 드라마 검색결과 , 영화 검색결과와 구조 거의 같음  -->
            <div class="row" id="v">
                <div class="col-xs-12">
                    <header>
                        <h4>드라마</h4>
                        <div class="more">
                        	<a href="/link-page/more-drama.jsp">
                        		더보기
                        	</a>
                        </div>
                    </header>
                    <div class="drama">
                        <div class="row">
                            <ul class="mv-ul">
                                <li>
                                    <div class="mv-1">
                                        <a href="/link-page/contentPage.jsp" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다1dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다2dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다3dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="hidden-2">
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다4dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="hidden-2">
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다5dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="hidden-2">
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다6dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="hidden-1">
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다7dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="hidden-1">
                                    <div class="mv-1">
                                        <a href="#" class="thumbnail">
                                            <div class="mv-pic">
                                                <img src="../lib/images/영화 리틀 포레스트(Little Forest, 2018) 후기, 결말, 줄거리.jpg" class="img-rounded">
                                            </div>
                                            <div class="mv-des">
                                                <div class="mv-des-title">제목입니다8dfsdfdsfsfsdfsdfsfsfsfssdfsfsfsfsdffsfsfsffsdfs</div>
                                                <div class="mv-des-year">2017 · 미국/영국</div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                            
                            </ul>
                     
                        </div>              
                </div>
            </div>
        </div>
    </div>
    
    <form action="/contentPage" method="get" id="frm">
    <input type="hidden" name="cId" id="cId" />
    <input type="hidden" name="mId" id="mId" />
    </form>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../lib/script/bootstrap.min.js"></script>
    <script src="/lib/script/findPage2.js"></script>
</body>

</html>