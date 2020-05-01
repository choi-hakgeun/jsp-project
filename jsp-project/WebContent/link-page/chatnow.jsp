<%@page import="java.util.List"%>
<%@page import="bean.BD_chatVo"%>
<%@page import="bean.BD_chatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String personJson="";
	
	String temp = "";
	
	BD_chatDao dao = new BD_chatDao();
	
	List<BD_chatVo> list = dao.select();
	StringBuilder sb = new StringBuilder();
	
	  for(int i=0;i<list.size();i++){
		 
          temp += "{\"id\":"+ "\"" + list.get(i).getCh_name() + "\""
			+ ",\"content\":" + "\"" + list.get(i).getCh_content() + "\"";

            if(i==list.size()-1){

               temp += "}";

            }else{

               temp += "},";

            }

     }
     personJson = "[" + temp +"]";

	out.print(personJson);
	
	System.out.println(personJson);
%>
