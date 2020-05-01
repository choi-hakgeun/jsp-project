<%@page import="java.util.List"%>
<%@page import="bean.SCContentVo"%>
<%@page import="bean.SCDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>seecha</title>

    <!-- 부트스트랩 -->
    <link href="../lib/css/bootstrap.min.css" rel="stylesheet">
    <link href="../lib/css/findPagePlus.css" rel="stylesheet">
    <link href="../lib/css/findTop.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../lib/script/bootstrap.min.js"></script>
    <script src="/lib/script/findPage2.js"></script>
</head>

<body>
	<%
	String category = request.getParameter("category");
	String cName = request.getParameter("cName");
	System.out.println(category);
	System.out.println(cName);
	SCDao dao = new SCDao();
	List<SCContentVo> list = dao.moreMovie(cName, category);
	request.setAttribute("list", list);
	
	%>
    <%@include file="more-movie-top.jsp"%><!--상단 고정  -->
    <div class="container-fluid" id="findPlus-fluid">
        <div class="row">
            <div class="col-xs-12">
                <div>
                    <ul class="mv-plus-ul">
                        
                        <c:forEach var="item" items="${list }">
                        <li><!--검색 결과 1개를 감싸는 li -->
                            <div class="mv-plus-1">
                                <a href="javaScript:goContents('${item.cId }')" class="thumbnail">
                                    <div class="mv-plus-pic">
                                        <img src="${item.image }"
                                            class="img-rounded">
                                    </div>
                                    <div class="mv-plus-des">
                                        <div class="mv-plus-des-title">${item.cName }
                                        </div>
                                        <div class="mv-plus-des-year">${item.date }</div>
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
	<form id="frm2" action="/contentPage" method="get">
		<input type="hidden" name="mId" id="mId"/>
		<input type="hidden" name="cId" id="cId"/>
	</form>
</body>
</html>