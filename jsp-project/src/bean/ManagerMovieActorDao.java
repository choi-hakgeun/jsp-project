package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ManagerMovieActorDao {
	Connection conn;
	
	public ManagerMovieActorDao() {
		conn = DBConn.getConn();
	}
	
	public String insert(ManagerMovieActorVo vo) {
		System.out.println("1");
		String msg = "";
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		System.out.println("2");
		try {
			sql = " insert into semi_actors(a_serial, a_id, a_position, a_name, a_work, a_photo) "
					+ " values(seq_semi_actors.nextval, ?, ?, ?, ?, ?) ";
			System.out.println("3");
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getA_id());
			ps.setInt(2, vo.getA_position());
			ps.setString(3, vo.getA_name());
			ps.setString(4, vo.getA_work());
			ps.setString(5, vo.getA_photo());
			System.out.println("4");
			int cnt = ps.executeUpdate();
			if(cnt>0) {
				conn.commit();
				msg = "인물 정보가 정상적으로 저장되었습니다.";
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
	
	public String update(ManagerMovieActorVo vo) {
		String msg = "초기값.";
		String sql = null;
		PreparedStatement ps = null;
		System.out.println("111");
		try {
			sql  = " update semi_actors set a_position=?, a_name=?, a_work=?, a_photo=? where a_id=? ";
			
			System.out.println(vo.getA_id());
			System.out.println(vo.getA_position());
			System.out.println(vo.getA_name());
			System.out.println(vo.getA_photo());
			System.out.println(vo.getA_work());

			ps = conn.prepareStatement(sql);

			ps.setInt(1, vo.getA_position());
			ps.setString(2, vo.getA_name());
			ps.setString(3, vo.getA_work());
			ps.setString(4, vo.getA_photo());
			ps.setString(5, vo.getA_id());

			System.out.println("666");
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
	
	public String delete(String a_id) {
		String msg = "초기값";
		System.out.println("11");
		String sql = null;
		PreparedStatement ps = null;
		System.out.println("22");
		System.out.println(a_id);
		try {
			sql = " delete from semi_actors where a_id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, a_id);
			System.out.println("33");
			conn.setAutoCommit(false);
			int cnt = ps.executeUpdate();
			if(cnt > 0) {
				conn.commit();
				msg = "출연진 정보가 정상적으로 삭제되었습니다.";
				System.out.println("44");
			}else {
				conn.rollback();
			}
			ps.close();
		}catch(Exception ex) {
			msg = ex.getMessage();
			System.out.println("55");
		}finally {
			return msg;
		}
	}
	
	public ManagerMovieActorVo view(String a_id) {
		ManagerMovieActorVo vo = new ManagerMovieActorVo();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql = " select a_id, a_position, a_name, a_work, a_photo "
					+ " from semi_actors where a_id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, a_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo.setA_id(rs.getString("a_id"));
				vo.setA_position(rs.getInt("a_position"));
				vo.setA_name(rs.getString("a_name"));
				vo.setA_work(rs.getString("a_work"));
				vo.setA_photo(rs.getString("a_photo"));
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
	
	public List<ManagerMovieActorVo> select(String findStr){
		List<ManagerMovieActorVo> list = new ArrayList<ManagerMovieActorVo>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql = " select a_id, a_position, a_name, a_work from semi_actors "
					+ " where a_id like ? or a_name like ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ManagerMovieActorVo vo = new ManagerMovieActorVo();
				vo.setA_id(rs.getString("a_id"));
				vo.setA_position(rs.getInt("a_position"));
				vo.setA_name(rs.getString("a_name"));
				vo.setA_work(rs.getString("a_work"));
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
