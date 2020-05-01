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

    <!-- 부트스트랩 -->
    <link href="/lib/css/bootstrap.min.css" rel="stylesheet">
    <link href="/lib/css/myMovies.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../lib/script/bootstrap.min.js"></script>
    <!-- <script src="/lib/script/member.js"></script> -->
    

</head>
<body>
   <%@include file="my-dramas-top.jsp"%><!--상단 고정 -->
   <div class="container-fluid mm-fluid">
    <div class="row">
        <div class="col-xs-12">
        	<div class="mm-saw">
	        	<h2 class="mm-eval">평가</h2>
	        	<span class="mm-saw-num">${cnt }</span>
	        	<div class="mm-more-div">
	        		<button id="more_movies" style="border:none;background:none">
			        	<span class="mm-more">더보기</span>	        		
	        		</button>
	        	</div>
        	</div>
        	<div class="mm-saw-img">
        		<ul>
        			<c:forEach var ="vo" items="${list}">
        		 		<li><!--검색 결과 1개를 감싸는 li -->
                          <div class="mm-plus-1">
                                <a href="contentPage?cId=${vo.cont_id}&mId=${mId}" >
                                    <div class="mm-plus-pic">
                                       <img src="${vo.cont_img }">
                                    </div>
                                    <div class="mm-plus-des">
                                        <div class="mm-plus-des-title">${vo.cont_name }
                                        </div>
                                        <div class="mm-plus-des-year">★${vo.int_score }.0</div>
                                    </div>
                                </a>
                            </div>
                        </li>
 					</c:forEach>
        		
        		</ul>   	
        	</div>
        </div>
          <div class="col-xs-12">
	        <hr class="mm-hr">
	        	<div class="mm-wish-div">
        	<button class="mm-wish" style="border:none;background:none;" id="wish">
        		보고싶어요
	        	<span class="mm-wish-num">${cnt2 }</span>
        	</button>
        	
	      
        		</div>
        </div>
        <div class="col-xs-12">
        	<div class="mm-doing-div">
        	<button class="mm-doing" style="border:none;background:none" id="watching">
        		보는중
        		<span class="mm-doing-num">${cnt3 }</span>
        	</button>
        
        
        	</div>
        </div>
      
    </div>  
</div>
<form id='movies_frm' name='movies_frm' method="post">
<input type='hidden' value='' name='movies_hidden_id' id='movies_hidden_id'>
<input type='hidden' value='1' name='cmd' id='cmd'>
</form>
 
 <script>
	if(sessionStorage.getItem("mId") != null){
	  movies_frm.movies_hidden_id.value=sessionStorage.getItem("mId");
		$('#more_movies').click(function(){		
			$('#movies_frm').attr('action','my_movies_plus.he').submit();
		})
		$('#wish').click(function(){
			$('#movies_frm').attr('action','wish.he').submit();
		})
		
		$('#watching').click(function(){
			$('#movies_frm').attr('action','watching.he').submit();
		})
	}

</script>

</body>

</html>