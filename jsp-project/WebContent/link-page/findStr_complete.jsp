<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String findStr = request.getParameter("findStr");
	
		Connection conn = DBConn.getConn();
		try{
		String sql = " select * from ( "
				   + " select rownum rn, A.* from("
				   + " select c_name " 
		           + " from semi_content " 
		           + " where c_name like ? or c_name like lower(?) or c_name like upper(?) "
		           + " order by c_name )A"
		           + " )where rn between 1 and 10"; //최대 10개만 선택 
				
		PreparedStatement ps = conn.prepareStatement(sql);
			
		ps.setString(1,"%"+findStr+"%");
		ps.setString(2,"%"+findStr+"%");
		ps.setString(3,"%"+findStr+"%");
		ResultSet rs = ps.executeQuery();
		
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		while(rs.next()){
		String str =String.format("{'find':'%s'},",rs.getString("c_name"));
		sb.append(str);
		};
		
		String data = sb.toString();
		data =data.replaceAll("\'","\"");
		if(data.length()>1){
		data =data.substring(0,data.length()-1);
		}//데이터 없을 경우 오류 방지
		data +="]";
		
		out.print(data);
	}catch(Exception ex){
		ex.printStackTrace();
	}
%>