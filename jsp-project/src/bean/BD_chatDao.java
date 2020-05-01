package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class BD_chatDao {
	Connection conn;
	
	public BD_chatDao(){
		conn = DBConn.getConn();
	}
	
	public void insert(BD_chatVo vo) {
		String sql = "";
		PreparedStatement ps = null;
		
		try {
			sql = "insert into semi_chat (ch_serial, ch_id, ch_content ) values (ch_seq.nextval , ? , ?) ";
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getCh_id());
			ps.setString(2, vo.getCh_content());
			ps.executeUpdate();
			
			
			ps.close();
			
			
			conn.commit();
		
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			
		}
		
	}
	
	public List<BD_chatVo> select() {
		List<BD_chatVo> list = new ArrayList<BD_chatVo>();
		
		String sql = "";
		PreparedStatement ps= null;
		ResultSet rs = null;
		
		try {
			sql = "select ch_serial,ch_id, ch_content, (select m_name from semi_member where m_mid = ch_id)m_name from semi_chat ORDER by ch_serial asc";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				BD_chatVo vo = new BD_chatVo();
				
				vo.setCh_serial(rs.getInt("ch_serial"));
				vo.setCh_id(rs.getString("ch_id"));
				vo.setCh_content(rs.getString("ch_content"));
				vo.setCh_name(rs.getString("m_name"));
				
				list.add(vo);
			}
			
			
			rs.close();
			ps.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return list;
		}
		
		
	}
	
	
}
