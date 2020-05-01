package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ManagerCommentDao {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Connection conn;
	
	public ManagerCommentDao() {
		conn = DBConn.getConn();
	}
	
	public String update(ManagerCommentVo vo) {
		String msg = "초기값";
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql = " update semi_comment set com_cId = ?, com_like = ?, con_content = ? "
					+ " where com_mId=? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getCom_cId());
			ps.setInt(2, vo.getCom_like());
			ps.setString(3, vo.getCon_content());
			ps.setString(4, vo.getCom_mId());
			
			conn.setAutoCommit(false);
			int cnt = ps.executeUpdate();
			if(cnt>0) {
				conn.commit();
				msg = "업데이트 성공";
			}else {
				conn.rollback();
			}
			ps.close();
			conn.close();
		}catch(Exception ex) {
			msg = ex.getMessage();
		}finally {
			return msg;
		}
	}
	
	public String delete(String com_mId) {
		String msg = "초기값";
		String sql = null;
		PreparedStatement ps= null;
		ResultSet rs = null;
		try {
			sql = " delete from semi_comment where com_mId = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, com_mId);
			
			int cnt = ps.executeUpdate();
			if(cnt>0) {
				msg = "코멘트 정보가 정상적으로 삭제되었습니다.";
			}
			ps.close();
			conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return msg;
		}
	}
	
	public ManagerCommentVo view(String com_mId) {
		ManagerCommentVo vo = new ManagerCommentVo();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			sql = " select com_mId, com_cId, com_like, con_content from semi_comment "
					+ "where com_mId = ? ";

			ps = conn.prepareStatement(sql);
			ps.setString(1, com_mId);

			rs = ps.executeQuery();
			while(rs.next()) {
				vo.setCom_mId(rs.getString("com_mId"));
				vo.setCom_cId(rs.getString("com_cId"));
				vo.setCom_like(rs.getInt("com_like"));
				vo.setCon_content(rs.getString("con_content"));
			}
			rs.close();
			ps.close();
			conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	
	public List<ManagerCommentVo> select(String findStr){
		List<ManagerCommentVo> list = new ArrayList<ManagerCommentVo>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			sql = " select com_mId, com_cId, com_like, con_content from semi_comment "
					+ " where com_mId like ? or com_cId like ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ManagerCommentVo vo = new ManagerCommentVo();
				vo.setCom_mId(rs.getString("com_mId"));
				vo.setCom_cId(rs.getString("com_cId"));
				vo.setCom_like(rs.getInt("com_like"));
				vo.setCon_content(rs.getString("con_content"));
				list.add(vo);
			}
			rs.close();
			ps.close();
			conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
}
