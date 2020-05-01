<%@page import="bean.HGMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
HGMemberDao dao = new HGMemberDao();
String mId = request.getParameter("inputEmail3");
String pwd = request.getParameter("inputPassword3");
boolean r = dao.delete(mId, pwd); 
out.print(r);
%>