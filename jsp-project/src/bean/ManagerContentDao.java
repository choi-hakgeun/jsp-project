package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ManagerContentDao {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Connection conn;
	
	public ManagerContentDao() {
		conn = DBConn.getConn();
	}
	public String insert(SCContentVo vo) {
		String msg = "";
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			sql = " insert into semi_content(c_id, c_name, c_category, c_genre, c_story, c_preview, c_image, c_other) "
					+ " values(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getcId());
			ps.setString(2, vo.getcName());
			ps.setString(3, vo.getCategory());
			ps.setString(4, vo.getGenre());
			ps.setString(5, vo.getStory());
			ps.setString(6, vo.getPreview());
			ps.setString(7, vo.getPvo().getThumbPhoto());
			ps.setString(8, vo.getOther());
			
			msg = "성공적으로 저장됨";
			
			int cnt = ps.executeUpdate();
			if(cnt>0) {
				conn.commit();
			}else {
				conn.rollback();
			}
			ps.close();

		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return msg;
		}
	}
	
	public String modify(ManagerContentVo vo) {
		String msg = "초기값.";
		String sql = null;
		PreparedStatement ps = null;

		try {
			sql = " update semi_content set c_name=?, c_category=?, c_genre=?, c_story=?, c_preview=?, c_image=?, c_other=? where c_id=? ";

			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getC_name());
			ps.setInt(2, vo.getC_category());
			ps.setString(3, vo.getC_genre());
			ps.setString(4, vo.getC_story());
			ps.setString(5, vo.getC_preview());
			ps.setString(6, vo.getC_image());
			ps.setString(7, vo.getC_other());
			ps.setString(8, vo.getC_id());

			conn.setAutoCommit(false);
			int cnt = ps.executeUpdate();
			if(cnt>0) {
				conn.commit();
				msg = "업데이트 성공";

			}else {
				conn.rollback();

			}
			ps.close();

		}catch(Exception ex) {
			msg = ex.getMessage();

		}finally {
			return msg;
		}
	}
	
	public String delete(String c_id) {
		String msg = "초기값";
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql = " delete from semi_content where c_id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, c_id);
			
			int cnt = ps.executeUpdate();
			if(cnt > 0) {
				msg = "컨텐츠 정보가 정상적으로 삭제되었습니다.";
			}
			ps.close();

		}catch(Exception ex) {
			msg = ex.getMessage();
		}finally {
			return msg;
		}
	}
	
	public ManagerContentVo view(String c_id) {
		ManagerContentVo vo = new ManagerContentVo();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql = " select c_id, c_name, c_category, c_genre, c_story, c_preview, c_image, c_other "
					+ "from semi_content where c_id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, c_id);
			rs = ps.executeQuery();
			while(rs.next()) {
				vo.setC_id(rs.getString("c_id"));
				vo.setC_name(rs.getString("c_name"));
				vo.setC_category(rs.getInt("c_category"));
				vo.setC_genre(rs.getString("c_genre"));
				vo.setC_story(rs.getString("c_story"));
				vo.setC_preview(rs.getString("c_preview"));
				vo.setC_image(rs.getString("c_image"));
				vo.setC_other(rs.getString("c_other"));
			}
			rs.close();
			ps.close();

		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	
	public List<ManagerContentVo> select(String findStr){
		List<ManagerContentVo> list = new ArrayList<ManagerContentVo>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql = "select c_id, c_name, c_category, c_genre from semi_content "
					+ " where c_id like ? or c_name like ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ManagerContentVo vo = new ManagerContentVo();
				vo.setC_id(rs.getString("c_id"));
				vo.setC_name(rs.getString("c_name"));
				vo.setC_category(rs.getInt("c_category"));
				vo.setC_genre(rs.getString("c_genre"));
				list.add(vo);
			}
			rs.close();
			ps.close();

		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
}
