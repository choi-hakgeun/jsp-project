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
    <!-- 부트스트랩 -->
    <link href="../lib/css/bootstrap.min.css" rel="stylesheet">
    <link href="../lib/css/rank.css" rel="stylesheet">
 
</head>
<body>
   <%@include file="my-movies-rank1-top.jsp"%><!--상단 고정 -->

  <!-- Tab panes -->

    	      <div class="rank-saw-img">
        		<ul>
        			<c:forEach var="vo" items="${list}">
		        		 		<li><!--검색 결과 1개를 감싸는 li -->
		                          <div class="rank-plus-1">
		                                <a href="contentPage?cId=${vo.cont_id}&mId=${mId}" >
		                                    <div class="rank-plus-pic">
		                                        <img src="${vo.cont_img }">
		                                    </div>
		                                    <div class="rank-plus-des">
		                                        <div class="rank-plus-des-title">${vo.cont_name }
		                                        </div>
		                                        <div class="rank-plus-des-year">★${vo.int_score }.0</div>
		                                    </div>
		                                </a>
		                            </div>
		                        </li>
                 	</c:forEach>
        		</ul>   	
        	</div>
    

	<script>
	  $(function () {
	    $('#myTab a:last').tab('show')
	  })
	</script>
</body>

</html>