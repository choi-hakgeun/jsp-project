<%@page import="bean.he_dao"%>
<%@page import="bean.he_vo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String mid =request.getParameter("main_join_email");
	String pwd= request.getParameter("main_join_pwd");
	String mName=request.getParameter("main_join_name");
	String phone=request.getParameter("main_join_phone");
	he_vo vo = new he_vo();
	vo.setmId(mid);
	vo.setPwd(pwd);
	vo.setmName(mName);
	vo.setPhone(phone);
	he_dao dao = new he_dao();

	int r = dao.main_join(vo);
	out.print(r);
%>