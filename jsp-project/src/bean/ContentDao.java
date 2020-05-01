package bean;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ContentDao {
	Connection conn;
	String upload = "C:\\Users\\JHTA\\eclipse-workspace\\web\\WebContent\\lib\\images\\Content_Images";
		
		 
	public ContentDao() {
		conn = DBConn.getConn();
	}
	
	
	public List<ContentVo> select(String findStr){
		List<ContentVo> list = new ArrayList<ContentVo>();
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			sql = "select * from semi_content where c_name like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ContentVo vo = new ContentVo();
				vo.setC_id(rs.getString("c_id"));
				vo.setC_name(rs.getString("c_name"));
				vo.setC_category(rs.getInt("c_category"));
				vo.setC_genre(rs.getString("c_genre"));
				vo.setC_story(rs.getString("c_story"));
				vo.setC_preview(rs.getString("c_preview"));
				vo.setC_image(rs.getString("c_image"));
				
				File file = new File("C:/Users/JHTA/eclipse-workspace/real-web-semi/WebContent/lib/"+rs.getString("c_id")+".txt");
				if(file.exists()) {
					BufferedReader br = new BufferedReader(new FileReader(file));
					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(br);
					vo.setDate((String)obj.get("date"));
				}
				vo.setC_other(rs.getString("c_other"));
				list.add(vo);
			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
		
	
}
