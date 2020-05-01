<%@page import="bean.SCDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
	String id = request.getParameter("id");
	SCDao dao = new SCDao();
	String mId = dao.naverLogin(id);
	
	if(mId != ""){
		out.print(mId);
	} else {
		out.print("no");
	}
	
	
	
%>
