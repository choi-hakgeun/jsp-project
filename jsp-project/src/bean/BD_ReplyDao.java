package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BD_ReplyDao {
	Connection conn;
	
	
	public BD_ReplyDao() {
		conn = DBConn.getConn();
	}
	
	public void insert(BD_ReplyVo vo) {
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		String photo = null;
		try {
			sql = "select m_photo from semi_member where m_mid = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getR_id());
			rs = ps.executeQuery();
			while(rs.next()) {
				photo = rs.getString("m_photo");
				System.out.println("photo = " + photo);
			}
			
			sql = "insert into semi_reply (r_serial, r_id, r_reply, r_photo, r_time, r_board) "
					+ "values ( seq_reply.nextval, ?, ?, ?, ?, ? )";
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getR_id());
			ps.setString(2, vo.getR_reply());
			ps.setString(3, photo);
			ps.setTimestamp(4, vo.getR_time());
			ps.setString(5, vo.getR_board());
			ps.executeUpdate();
			System.out.println("vo들"+ vo.getR_id());
			System.out.println(vo.getR_reply()+photo+vo.getR_time()+vo.getR_board());
			
			
	
			ps.close();
			rs.close();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			
		}finally {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	
	public List<BD_ReplyVo> select(String r_board){
		List<BD_ReplyVo> list = new ArrayList<BD_ReplyVo>();
		
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			sql = "select r_serial, r_id, r_reply, r_photo, r_time, (select m_name from semi_member where m_mid = r_id) m_name from semi_reply where r_board = ? order by r_time asc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, r_board);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				BD_ReplyVo vo = new BD_ReplyVo();
				
				vo.setR_serial(rs.getString("r_serial"));
				vo.setR_id(rs.getString("r_id")); 
				vo.setR_reply(rs.getString("r_reply"));
				vo.setR_photo(rs.getString("r_photo"));
				vo.setR_time(rs.getTimestamp("r_time"));
				vo.setM_name(rs.getString("m_name")); // m_name 멤버 닉네임
				
				list.add(vo);
				
			}
			
			
			
			
			
			
			
			
			
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public void delete(String r_serial) {
		String sql = "";
		
		try {
			conn.setAutoCommit(false);
			
			sql = "delete from semi_reply where r_serial = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, r_serial);
			ps.executeUpdate();
			
					
			ps.close();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			
		}finally {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void modify(BD_ReplyVo vo) {
		String sql = "";
		
		try {
			conn.setAutoCommit(false);
			sql = "update semi_reply set r_reply = ? where r_serial = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getR_reply());
			ps.setString(2, vo.getR_serial());
			ps.executeUpdate();
			
			ps.close();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
}
