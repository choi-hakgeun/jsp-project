<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>seecha</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../lib/script/bootstrap.min.js"></script>
    <script src="../lib/script/myMoviesPlus.js"></script>
    <!-- 부트스트랩 -->
    <link href="../lib/css/bootstrap.min.css" rel="stylesheet">
    <link href="../lib/css/myMoviesPlus.css" rel="stylesheet">
    
 
</head>
<body>
   <%@include file="my-movies-plus-top.jsp"%><!--상단 고정 -->
   <div role="tabpanel" class="mmp-tab">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs mmp-ul" role="tablist">
    <li role="presentation" class="active"><a class="ttt" href="#home" aria-controls="home" role="tab" data-toggle="tab" style="margin-left: 7px;">전체</a></li>
    <li role="presentation"><a class="ttt" href="#profile" aria-controls="profile" role="tab" data-toggle="tab">점수별</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content mmp-cont">
    <div role="tabpanel" class="tab-pane active" id="home">
    	      <div class="mmp-saw-img">
        		<ul>
        		<c:forEach var="vo" items="${list }">
        		 <li><!--검색 결과 1개를 감싸는 li -->
                          <div class="mmp-plus-1">
                                <a href="contentPage?cId=${vo.cont_id}&mId=${mId}" >
                                    <div class="mmp-plus-pic">
                                  		<img src="${vo.cont_img }">
                                    </div>
                                    <div class="mmp-plus-des">
                                        <div class="mmp-plus-des-title">${vo.cont_name }
                                        </div>
                                        <div class="mmp-plus-des-year">★${vo.int_score}.0</div>
                                    </div>
                                </a>
                            </div>
                        </li>
                   </c:forEach> 
        		</ul>   	
        	</div>
    
    
    </div>
    <div role="tabpanel" class="tab-pane" id="profile">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="mmp-saw">
                        <h2 class="mmp-eval">5점 준 영화</h2>
                        <span class="mmp-saw-num">${cnt5 }</span>
                        <div  class="mmp-more-div">
                            <button id ="rank5_more" style="border:none;background:none;">
                                <span class="mmp-more">더보기</span>	        		
                            </button>
                        </div>
                    </div>
                    <div class="mmp-star-img">
                    <ul>
                    	<c:forEach var="vo" items="${rank5 }">
		        		 		<li><!--검색 결과 1개를 감싸는 li -->
		                          <div class="mmp-plus-2">
		                                <a href="contentPage?cId=${vo.cont_id}&mId=${mId}" >
		                                    <div class="mmp-plus-pic">
		                                 		<img src="${vo.cont_img }">
		                                    </div>
		                                    <div class="mmp-plus-des">
		                                        <div class="mmp-plus-des-title">${vo.cont_name }
		                                        </div>
		                                        <div class="mmp-plus-des-year">★${vo.int_score }.0</div>
		                                    </div>
		                                </a>
		                            </div>
		                        </li>
                 	</c:forEach>
        		</ul>   	
                    
                    </div>

                </div>
                <div class="col-xs-12">
                    <div class="mmp-saw">
                        <h2 class="mmp-eval">4점 준 영화</h2>
                        <span class="mmp-saw-num">${cnt4 }</span>
                        <div class="mmp-more-div">
                            <button id ="rank4_more" style="border:none;background:none;">
                                <span class="mmp-more">더보기</span>	        		
                            </button>
                        </div>
                    </div>
                     <div class="mmp-star-img">
                     	<ul>
                     		<c:forEach var="vo" items="${rank4 }">
		        		 		<li><!--검색 결과 1개를 감싸는 li -->
		                          <div class="mmp-plus-2">
		                                <a href="contentPage?cId=${vo.cont_id}&mId=${mId}" >
		                                    <div class="mmp-plus-pic">
		                 						<img src="${vo.cont_img }">
		                                    </div>
		                                    <div class="mmp-plus-des">
		                                        <div class="mmp-plus-des-title">${vo.cont_name }
		                                        </div>
		                                        <div class="mmp-plus-des-year">★${vo.int_score }.0</div>
		                                    </div>
		                                </a>
		                            </div>
		                        </li>
                 	</c:forEach>
                     	
                     	</ul>                    
                    </div>
                    
                </div>
                <div class="col-xs-12">
                    <div class="mmp-saw">
                        <h2 class="mmp-eval">3점 준 영화</h2>
                        <span class="mmp-saw-num">${cnt3 }</span>
                        <div class="mmp-more-div">
                             <button id ="rank3_more" style="border:none;background:none;">
                                <span class="mmp-more">더보기</span>	        		
                            </button>
                        </div>
                    </div>
                     <div class="mmp-star-img">
                     	<ul>
                     		<c:forEach var="vo" items="${rank3 }">
		        		 		<li><!--검색 결과 1개를 감싸는 li -->
		                          <div class="mmp-plus-2">
		                                <a href="contentPage?cId=${vo.cont_id}&mId=${mId}" >
		                                    <div class="mmp-plus-pic">
		        								<img src="${vo.cont_img }">
		                                    </div>
		                                    <div class="mmp-plus-des">
		                                        <div class="mmp-plus-des-title">${vo.cont_name }
		                                        </div>
		                                        <div class="mmp-plus-des-year">★${vo.int_score }.0</div>
		                                    </div>
		                                </a>
		                            </div>
		                        </li>
                 	</c:forEach>
                     	
                     	</ul>
                    
                    </div>
                    
                </div>
                <div class="col-xs-12">
                    <div class="mmp-saw">
                        <h2 class="mmp-eval">2점 준 영화</h2>
                        <span class="mmp-saw-num">${cnt2 }</span>
                        <div class="mmp-more-div">
                             <button id ="rank2_more" style="border:none;background:none;">
                                <span class="mmp-more">더보기</span>	        		
                            </button>
                        </div>
                    </div>
                     <div class="mmp-star-img">
                     	<ul>
                     		<c:forEach var="vo" items="${rank2 }">
		        		 		<li><!--검색 결과 1개를 감싸는 li -->
		                          <div class="mmp-plus-2">
		                                <a href="contentPage?cId=${vo.cont_id}&mId=${mId}" >
		                                    <div class="mmp-plus-pic">
		                                        <img src="${vo.cont_img }">
		                                    </div>
		                                    <div class="mmp-plus-des">
		                                        <div class="mmp-plus-des-title">${vo.cont_name }
		                                        </div>
		                                        <div class="mmp-plus-des-year">★${vo.int_score }.0</div>
		                                    </div>
		                                </a>
		                            </div>
		                        </li>
                 	</c:forEach>
                     	
                     	</ul>
                    
                    </div>
                    
                </div>
                <div class="col-xs-12">
                    <div class="mmp-saw">
                        <h2 class="mmp-eval">1점 준 영화</h2>
                        <span class="mmp-saw-num">${cnt1 }</span>
                        <div class="mmp-more-div">
                             <button id ="rank1_more" style="border:none;background:none;">
                                <span class="mmp-more">더보기</span>	        		
                            </button>
                        </div>
                    </div>
                     <div class="mmp-star-img">
                     <ul>
                 	<c:forEach var="vo" items="${rank1 }">
		        		 		<li><!--검색 결과 1개를 감싸는 li -->
		                          <div class="mmp-plus-2">
		                                <a href="contentPage?cId=${vo.cont_id}&mId=${mId}" >
		                                    <div class="mmp-plus-pic">
		               							<img src="${vo.cont_img }">
		                                    </div>
		                                    <div class="mmp-plus-des">
		                                        <div class="mmp-plus-des-title">${vo.cont_name }
		                                        </div>
		                                        <div class="mmp-plus-des-year">★${vo.int_score }.0</div>
		                                    </div>
		                                </a>
		                            </div>
		                        </li>
                 	</c:forEach>
                     
                     </ul>
                    
                    </div>
                    
                </div>

            </div>

        </div>
    </div>
  </div>

</div>

<form id='movies_more_frm' name='movies_more_frm' method="post">
<input type='hidden' value='' name='movies_hidden_id' id='movies_hidden_id'>
<input type='hidden' value='0' name='cmd' id='cmd'>
<input type='hidden' value='' name='score' id='score'>
</form>
  
  
	<script>
	  $(function () {
	    $('#myTab a:last').tab('show')
	  })
	  if(sessionStorage.getItem("mId") != null){
	  	movies_more_frm.movies_hidden_id.value=sessionStorage.getItem("mId");
	  	my_movies();
	}

	</script>
</body>

</html>