<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.he_dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

 he_dao dao = new he_dao();
 List<String> list = new ArrayList<String>();
 list = dao.trend(); 
 
 StringBuilder sb = new StringBuilder();
 
 sb.append("[");
 
 for(int i=0; i<list.size() ; i++){
	 String str = String.format("{'trend':'%s'},",list.get(i));
	 sb.append(str);
 }
 
 String data = sb.toString();
 data = data.replaceAll("\'", "\"");
 if(data.length()>1){
	 data = data.substring(0,data.length()-1);
 }
 data +="]";
 out.print(data);


%>