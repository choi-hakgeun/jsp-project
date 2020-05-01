<%@page import="bean.BD_chatVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.BD_chatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>
</head>
<body>
<%
	BD_chatDao dao = new BD_chatDao();
	
	BD_chatVo vo = new BD_chatVo();
	String id = request.getParameter("chat_id");
	String con = request.getParameter("chat_txt");
	vo.setCh_id(id);
	vo.setCh_content(con);
	
	dao.insert(vo);
	
	
	List<BD_chatVo> list = dao.select();
	
	request.setAttribute("chatList", list);
	
	

%>




</body>
</html>