<%@page import="bean.SCDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="http://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
</head>
<body>
<%
	String mail = request.getParameter("emailField");
	String mName = request.getParameter("nameField");
	String phone = request.getParameter("phoneField");
	String snsId = request.getParameter("snsId");
	
	SCDao dao = new SCDao();
	dao.naverSignIn(mail, mName, phone, snsId);
%>
<script>
opener.location.reload();
window.close();
</script>

</body>
</html>