<%@page import="bean.he_vo"%>
<%@page import="bean.he_dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String mid = request.getParameter("main_login_email");
	String pwd= request.getParameter("main_login_pwd");
	he_dao dao = new he_dao();
	boolean r = dao.main_login(mid, pwd);
	
	out.print(r);
	
%>