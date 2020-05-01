package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HGMemberDao {
	Connection conn;
	
	String upload = "C:/Users/choi/eclipse-workspace/020326real-web-semi/WebContent/upload"; //파일저장경로
	
	public HGMemberDao() {
		conn = DBConn.getConn();
	}
	public String insert(HGMemberVo vo) {
		String msg = "회원정보가 정상적으로 저장되었습니다.";				
		String p = null;	
		
		try {
			String sql = "insert into semi_member(m_mId, m_Name, m_pwd, m_Phone, m_Profile, m_Date, m_Admin)"
					+ " values(?,?,?,?,?,?,?) ";
			
			conn.setAutoCommit(false);			
			PreparedStatement ps = conn.prepareStatement(sql);					
			ps.setString(1,  vo.getmId());
			ps.setString(2,  vo.getmName());
			ps.setString(3,  vo.getPwd());
			ps.setString(4,  vo.getmPhone());			
			ps.setString(5,  vo.getmProfile());
			ps.setString(6,  vo.getmDate());
			ps.setInt(7,  vo.getAdmin());
			
			int cnt = ps.executeUpdate();
			
			if(cnt>0) {
				conn.commit();
				
				
				
			}else {
				conn.rollback();//입력값이 없을시 롤백
			}//else end			 
			
		}catch(Exception ex){
			msg = ex.toString();			
			conn.rollback();
		}finally {
			
			try {
				conn.commit();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return msg;
		}
	}	
	public HGMemberVo select(String mId) {
		HGMemberVo vo = new HGMemberVo();
		String sql=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql=" select m_mId, m_Name, m_Phone, m_Profile, m_Date, m_Photo "
			   +" from semi_member "
			   +" where m_mId=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setmId(rs.getString("m_mId"));
				vo.setmName(rs.getString("m_Name"));
				vo.setmPhone(rs.getString("m_Phone"));
				vo.setmProfile(rs.getString("m_Profile"));
				vo.setmDate(rs.getString("m_Date"));
				
				if(rs.getString("m_photo") != null) {
					vo.setmPhoto(rs.getString("m_Photo"));
				}
				
				sql = "select count(int_mid) cnt from semi_interest where int_mid=? and int_category = 0";
				ps = conn.prepareStatement(sql);
				ps.setString(1, mId);
				
				rs = ps.executeQuery();
				if(rs.next()) {
					vo.setmMovieCnt(rs.getString("cnt"));
				}
				
				sql = "select count(int_mid) cnt from semi_interest where int_mid=? and int_category = 1";
				ps = conn.prepareStatement(sql);
				ps.setString(1, mId);
				
				rs = ps.executeQuery();
				if(rs.next()) {
					vo.setmTvCnt(rs.getString("cnt"));
				}
				
				sql = "select count(int_mid) cnt from semi_interest where int_mid=? and int_category = 0 and int_interest = 2";
				ps = conn.prepareStatement(sql);
				ps.setString(1, mId);
				
				rs = ps.executeQuery();
				if(rs.next()) {
					vo.setmMovieWant(rs.getString("cnt"));
				}
				
				sql = "select count(int_mid) cnt from semi_interest where int_mid=? and int_category = 1 and int_interest = 2";
				ps = conn.prepareStatement(sql);
				ps.setString(1, mId);
				
				rs = ps.executeQuery();
				if(rs.next()) {
					vo.setmTvWant(rs.getString("cnt"));
				}
				
				
			} // end of if
			/*rs.close();
			ps.close();
			conn.close();*/
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {			
			return vo;
		}
	}
	public HGMemberVo view(String mId) {
		HGMemberVo vo = new HGMemberVo();
		String sql=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			sql=" select m_mId, m_Name, m_Phone, m_Profile, m_Date "
			   +" from semi_member "
			   +" where m_mId=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setmId(rs.getString("m_mId"));
				vo.setmName(rs.getString("m_Name"));
				vo.setmPhone(rs.getString("m_Phone"));
				vo.setmProfile(rs.getString("m_Profile"));
				vo.setmDate(rs.getString("m_Date"));
			}
			sql= " select m_Photo "
			   + " from semi_member "
			   + " where m_mId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			rs = ps.executeQuery();			
			if(rs.next()) {
				vo.setmPhoto(rs.getString("m_Photo"));
			}else {
				System.out.println("기본이미지");
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	public String modify(HGMemberVo vo) {
		String msg = "회원정보가 수정되었습니다.";	
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql=" update semi_member set m_mId=?, m_Name=?, m_Phone=?, m_Profile=?, m_Photo=?"
			   +" where m_mId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmId());
			ps.setString(2, vo.getmName());
			ps.setString(3, vo.getmPhone());
			ps.setString(4, vo.getmProfile());
			ps.setString(5, vo.getmPhoto());
			ps.setString(6, vo.getmId());
			
			int cnt = ps.executeUpdate();			
			
			if(cnt>0) {
				conn.commit();
			} else {
				conn.rollback();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			return msg;
		}
	}
	public boolean delete(String mId, String pwd) {
		boolean r = false; 
		String sql=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		
		try {
			sql = " select m_mId from semi_member where m_mId=? and m_pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, pwd);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				r = true;				
			}else {
				r = false;				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return r;
		}
	}
	public boolean deleteR(String mId, String pwd) {
		boolean r = false;
		String sql=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		
		try {
			sql = " delete from semi_member where m_mId=? and m_pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, pwd);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				r = true;
				conn.commit();
			}else {
				r = false;
				conn.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return r;
		}
	}

}
