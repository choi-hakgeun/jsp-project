<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>seecha</title>
	<link href="/lib/css/bootstrap.css" rel="stylesheet">
	<script src='/lib/script/jquery-3.4.1.js'></script>
	<script src="../lib/script/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		google.charts.load('current', {'packages':['bar']});
		google.charts.setOnLoadCallback(drawStuff);	
		
		function drawStuff() {
			var data = google.visualization.arrayToDataTable([
		         ['', ''],
		         ['1', ${rank1}],            // RGB value
		         ['2', ${rank2}],            // English color name
		         ['3', ${rank3}],
		         ['4', ${rank4}],
		         ['5', ${rank5}], 
		         
		      ]);
			
			var options = {
				
			        height: 200,
			        bar: {groupWidth: "30%"},
			        legend: { position: "none" },
			        series: {
			            0: { color: '#ffdd63' },
			      
			        }
			      };
	        var chart = new google.charts.Bar(document.getElementById('stars'));
	        // Convert the Classic options to Material options.
	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      };
	</script>

</head>
<body style="background:#f8f8f8;">
	<div class="container">
	    <div class="row">

	        <div class="col-xs-12 col-sm-8 col-sm-offset-2" style="height:234px;">
	        	<div style="background: transparent URL(../lib/images/mainPage_image/MAIN_TOP.jpg) no-repeat center center/cover;height: 234px;
	        	        margin-top: 15px;border-radius: 5px;text-align: center;">
	        	        <div style="font-size: 35px; color: white;font-weight: bold;">seecha</div>
	        	        <div style="font-size: 11px;color: white;font-weight: bold;margin-bottom: 25px;">취향분석</div>
	        	        <span class="input-group-addon span2" id="logout-span" data-toggle="tooltip"
					data-placement="bottom" title="" style="background: none; border: none;">
					<a href="javascript:select()"><img src="${photo }" class="img-circle"
							id="profile-image" style="width: 45px;"></a></span>
						<div style="font-size: 21px;color: white;font-weight: bold;">${name }</div>
	        	
	        	
	        	</div>
	        
	        </div>
	        <c:if test = '${photo == null }'>
	        	<script>
	        	$('#profile-image').attr('src','/lib/images/default_profile.png')
	        	</script>
	        </c:if>
	    </div>
	    <div class="row">
	  		 <div class="col-xs-12 col-sm-8 col-sm-offset-2">
	  		 	<div style="border:1px solid #eee;margin-top: 32px; border-radius: 10px;background:#FFF">
	  		 		<div style="font-size: 19px;padding: 12px;font-weight: bold;">평가수</div>
	  		 		<div style="text-align:center;">
	  		 			<div style="display: inline-block;margin-right: 153px;" >
	  		 				<div style="font-size: 20px;font-weight: bold;">${movie }</div>
	  		 				<div style="font-size: 13px;text-align: center;color: #AAA;">영화</div>
	  		 			</div>
	  		 			<div style="display: inline-block;">
	  		 				<div style="font-size: 20px;font-weight: bold;text-align: center;">${drama }</div>
	  		 				<div style="font-size: 13px;text-align: center;color: #aaa;">드라마</div>
	  		 			</div>	  		 		
	  		 		</div>
	  		 		<hr style="margin-bottom:0px;">
	  		 		<div style="font-size: 19px;padding: 12px;font-weight: bold;">별점분포</div>
	  		 		<div style="padding-bottom: 10px;">
	  		 			<div id="stars" style="width: 80%;margin-left: 10%;text-align: center;">
	  		 			
	  		 			</div>
	  		 		
	  		 		</div>
	  		 		
	  		 		<div style="text-align:center;margin-bottom: 15px;">
	  		 			<div style="display: inline-block;" >
	  		 				<div style="font-size: 20px;font-weight: bold;">${avg}</div>
	  		 				<div style="font-size: 13px;text-align: center;color: #AAA;">별점평균</div>
	  		 			</div>
	  		 			<div style="display: inline-block;margin-left: 100px;">
	  		 				<div style="font-size: 20px;font-weight: bold;text-align: center;">${cnt}</div>
	  		 				<div style="font-size: 13px;text-align: center;color: #aaa;">별점갯수</div>
	  		 			</div>
	  		 			<div style="display: inline-block;margin-left: 100px;">
	  		 				<div style="font-size: 20px;font-weight: bold;text-align: center;">${max}.0</div>
	  		 				<div style="font-size: 13px;text-align: center;color: #aaa;">많이 준 별점</div>
	  		 			</div>		  		 		
	  		 		</div>
	  		 	</div>
	  		 	
	  		 	<div style="border:1px solid #eee;margin-top: 17px;border-radius: 10px;margin-bottom: 42px;background:#FFF">
	  		 			<div style="font-size: 19px;padding: 12px;font-weight: bold;">영화 선호장르</div>
	
	  		 		<div style="text-align:center;">
	  		 			
	  		 		 <c:if test="${fn:length(genre)>0}">

	  		 			<div style="display: inline-block;" >
	  		 				<div style="font-size: 17px;font-weight: bold;">${genre[0].like_genre}</div>
	  		 				<div style="font-size: 12px;text-align: center;color: #AAA;">${genre[0].sum_score }점·${genre[0].cnt_genre }편</div>
	  		 			</div>
	  		 			
	  		 		</c:if>
	  		 		 <c:if test="${fn:length(genre)>1}">
	  		 			<div style="display: inline-block;margin-left: 100px;">
	  		 				<div style="font-size: 17px;font-weight: bold;text-align: center;">${genre[1].like_genre}</div>
	  		 				<div style="font-size: 12px;text-align: center;color: #aaa;">${genre[1].sum_score }점·${genre[1].cnt_genre }편</div>
	  		 			</div>
	  		 		</c:if>
	  		 		 <c:if test="${fn:length(genre)>2}">
	  		 			<div style="display: inline-block;margin-left: 100px;">
	  		 				<div style="font-size: 17px;font-weight: bold;text-align: center;">${genre[2].like_genre}</div>
	  		 				<div style="font-size: 12px;text-align: center;color: #aaa;">${genre[2].sum_score }점·${genre[2].cnt_genre }편</div>
	  		 			</div>
	  		 		</c:if>		  		 		
	  		 		</div>
	  		 		<div style="margin-bottom: 20px;"> 
	  		 		  <c:if test="${fn:length(genre)>3}">
	  		 			<c:forEach var ="vo" begin="3" items="${genre}">
	  		 			
		  		 			<div style="text-align: center;margin: 12px;">
		  		 				<div style="font-size: 14px;color: #aaa;display:inline-block;width: 80%;text-align: left;">${vo.like_genre }</div> 
		  		 				<div style="font-size: 13px;color: #aaa;display:inline-block;">${vo.sum_score }점·${vo.cnt_genre }편</div>
		  		 			</div>
	  		 				  		 			
 		 			    </c:forEach> 
 		 			  </c:if>
	  		 
	  		 		</div>
	  		 	
	  		 	</div>
	  		 
	  		 </div>
	    </div>
	</div>

</body>
</html>