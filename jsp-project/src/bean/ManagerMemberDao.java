package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.Manager;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class ManagerMemberDao {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Connection conn;
	
	public ManagerMemberDao() {
		conn = DBConn.getConn();
	}
	
	public String update(ManagerMemberVo vo) {
		String msg = "초기값";

		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			sql = "update semi_member set m_name=?, m_phone=?, m_profile=? where m_mId=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, vo.getM_name());
			ps.setString(2, vo.getM_phone());
			ps.setString(3, vo.getM_profile());
			ps.setString(4, vo.getM_mId());
	
			conn.setAutoCommit(false);
			int cnt = ps.executeUpdate();
			if(cnt>0) {
				conn.commit();
				
				msg ="업데이트 성공";
			}else {
				conn.rollback();
			}
			ps.close();
			conn.close();
		}catch(Exception ex) {
			msg = ex.toString();
		}finally {
			return msg;
		}
	}
	
	public String delete(String m_mId) {
		String msg = "초기값";
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql = "delete from semi_member where m_mId = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, m_mId);
			
			int cnt = ps.executeUpdate();
			if(cnt>0) {
				msg = "회원정보가 정상적으로 삭제되었습니다.";
			}else {

			}
			ps.close();
			conn.close();
		}catch(Exception ex) {
			msg = ex.toString();
		}finally {
			return msg;
		}
	}
	
	public ManagerMemberVo view(String m_mId) {
		ManagerMemberVo vo = new ManagerMemberVo();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql = " select m_mId, m_name, m_profile, m_phone, to_char(m_date, 'rrrr-MM-dd') m_date, m_photo from semi_member "
					+ " where m_mId = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, m_mId);
			rs = ps.executeQuery();
			while(rs.next()) {
				vo.setM_mId(rs.getString("m_mId"));
				vo.setM_name(rs.getString("m_name"));
				vo.setM_profile(rs.getString("m_profile"));
				vo.setM_phone(rs.getString("m_phone"));
				vo.setM_date(rs.getDate("m_date"));
				vo.setM_photo(rs.getString("m_photo"));
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
	
	public List<ManagerMemberVo> select(String findStr){
		List<ManagerMemberVo> list = new ArrayList<ManagerMemberVo>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql = " select m_mId, m_name, m_phone, to_char(m_date, 'rrrr-MM-dd') m_date from semi_member "
					+ " where m_mId like ? or m_name like ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");

			rs = ps.executeQuery();

			while(rs.next()) {
				ManagerMemberVo vo = new ManagerMemberVo();
				vo.setM_mId(rs.getString("m_mId"));
				vo.setM_name(rs.getString("m_name"));
				vo.setM_phone(rs.getString("m_phone"));
				vo.setM_date(rs.getDate("m_date"));
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
