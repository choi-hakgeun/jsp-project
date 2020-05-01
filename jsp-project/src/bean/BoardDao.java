package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.jmx.snmp.Timestamp;

public class BoardDao {
	Connection conn;
	
	public BoardDao() {
		conn = DBConn.getConn();
	}
	
	
	public List<BoardVo> selectE(Board_Paging p){
List<BoardVo> list = new ArrayList<BoardVo>();
		
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		int  totList = 0;
		
		try {
			sql = "select count(n_serial) cnt from semi_board where n_serial like ? order by n_serial desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "e%");
			
			
			rs = ps.executeQuery();
			if(rs.next()) totList = rs.getInt("cnt");
			p.setTotListSize(totList);
			p.PageCompute();
			
			sql = "select * from ( "
					+ " select rownum rn, A.*, (select m_name from semi_member where m_mid = n_mid) m_name from ( "
					+ "		select * from semi_board where n_serial like ? order by n_serial desc )A )"
					+ " 	where rn between ? and ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "e%");
			ps.setInt(2, p.getStartNo());
			ps.setInt(3, p.getEndNo());
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				
				String str = rs.getString("n_serial");
				String serial = str.substring(1, str.length());
				
				vo.setN_serial(serial);
				vo.setM_name(rs.getString("m_name"));
				vo.setN_title(rs.getString("n_title"));
				vo.setN_category(rs.getInt("n_category"));
				vo.setN_content(rs.getString("n_content"));
				vo.setN_date(rs.getTimestamp("n_date"));
				vo.setN_count(rs.getInt("n_count"));
				
				list.add(vo);
			}
			
			rs.close();
			ps.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<BoardVo> selectG(Board_Paging p){
		List<BoardVo> list = new ArrayList<BoardVo>();
		
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		int  totList = 0;
		
		try {
			sql = "select count(n_serial) cnt from semi_board where n_serial like ? order by n_serial desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "g%");
			
			
			rs = ps.executeQuery();
			if(rs.next()) totList = rs.getInt("cnt");
			p.setTotListSize(totList);
			p.PageCompute();
			
			sql = "select * from ( "
					+ " select rownum rn, A.*, (select m_name from semi_member where m_mid = n_mid) m_name from ( "
					+ "		select * from semi_board where n_serial like ? order by n_serial desc )A )"
					+ " 	where rn between ? and ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "g%");
			ps.setInt(2, p.getStartNo());
			ps.setInt(3, p.getEndNo());
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				
				String str = rs.getString("n_serial");
				String serial = str.substring(1, str.length());
				
				vo.setN_serial(serial);
				vo.setM_name(rs.getString("m_name"));
				vo.setN_title(rs.getString("n_title"));
				vo.setN_category(rs.getInt("n_category"));
				vo.setN_content(rs.getString("n_content"));
				vo.setN_date(rs.getTimestamp("n_date"));
				vo.setN_count(rs.getInt("n_count"));
				
				list.add(vo);

			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<BoardVo> selectN(Board_Paging p){
		List<BoardVo> list = new ArrayList<BoardVo>();
		
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		int  totList = 0;
		
		try {
			sql = "select count(n_serial) cnt from semi_board where n_serial like ? order by n_serial desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "n%");
			
			
			rs = ps.executeQuery();
			if(rs.next()) totList = rs.getInt("cnt");
			p.setTotListSize(totList);
			p.PageCompute();
			
			sql = "select * from ( "
					+ " select rownum rn, A.*, (select m_name from semi_member where m_mid = n_mid) m_name from ( "
					+ "		select * from semi_board where n_serial like ? order by n_serial desc )A )"
					+ " 	where rn between ? and ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "n%");
			ps.setInt(2, p.getStartNo());
			ps.setInt(3, p.getEndNo());
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				
				String str = rs.getString("n_serial");
				String serial = str.substring(1, str.length());
				
				vo.setN_serial(serial);
				vo.setM_name(rs.getString("m_name"));
				vo.setN_title(rs.getString("n_title"));
				vo.setN_category(rs.getInt("n_category"));
				vo.setN_content(rs.getString("n_content"));
				vo.setN_date(rs.getTimestamp("n_date"));
				vo.setN_count(rs.getInt("n_count"));
				
				list.add(vo);

			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	public List<BoardVo> selectQ(Board_Paging p){
		List<BoardVo> list = new ArrayList<BoardVo>();
		
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		int  totList = 0;
		
		try {
			sql = "select count(n_serial) cnt from semi_board where n_serial like ? order by n_serial desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "q%");
			
			
			rs = ps.executeQuery();
			if(rs.next()) totList = rs.getInt("cnt");
			p.setTotListSize(totList);
			p.PageCompute();
			
			sql = "select * from ( "
					+ " select rownum rn, A.*, (select m_name from semi_member where m_mid = n_mid) m_name, (select answer from SEMI_QA where Q_SERIAL = n_serial) ANSWER from ( "
					+ "		select * from semi_board where n_serial like ? order by n_serial desc )A )"
					+ " 	where rn between ? and ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "q%");
			ps.setInt(2, p.getStartNo());
			ps.setInt(3, p.getEndNo());
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				
				String str = rs.getString("n_serial");
				String serial = str.substring(1, str.length());
				
				vo.setN_serial(serial);
				vo.setM_name(rs.getString("m_name"));
				vo.setN_title(rs.getString("n_title"));
				vo.setN_category(rs.getInt("n_category"));
				vo.setN_content(rs.getString("n_content"));
				vo.setN_date(rs.getTimestamp("n_date"));
				vo.setN_count(rs.getInt("n_count"));
				vo.setAnswer(rs.getInt("answer"));
				list.add(vo);

			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public BoardVo view(String serial) {
		BoardVo vo = new BoardVo();
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		System.out.println("s="+serial);
		try {
			sql = "select n_serial, n_title, n_content, n_mid, n_category, n_count, n_date from semi_board where n_serial = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, serial);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				vo.setN_serial(rs.getString("n_serial"));
				vo.setN_title(rs.getString("n_title"));
				vo.setN_content(rs.getString("n_content"));
				vo.setN_mid(rs.getString("n_mid"));
				vo.setN_category(rs.getInt("n_category")); // 숫자라 바꿔줘야댐
				vo.setN_count(rs.getInt("n_count")+1);
				vo.setN_date(rs.getTimestamp("n_date"));
			}

			int cnt = vo.getN_count();
			conn.setAutoCommit(false);
			sql = "update semi_board set n_count = ? where n_serial = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnt++);
			ps.setString(2, serial);
			ps.executeUpdate();
			
			ps.close();
			rs.close();
			
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();
		}finally {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return vo;
		}
	}
	
	public String modify(BoardVo vo) {
		String sql = "";
		String str = "";
		try {
			conn.setAutoCommit(false);
			sql = "update semi_board set n_title = ?, n_content = ? where n_serial = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getN_title());
			ps.setString(2, vo.getN_content());
			ps.setString(3, vo.getN_serial());
			ps.executeUpdate();
			
			str = "수정완료";
			System.out.println(vo.getN_title());
			System.out.println(vo.getN_content());
			System.out.println(vo.getN_serial());
			
			conn.commit();
			
			ps.close();
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();
		}finally {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return str;
		}
		
	}
	public String delete(String serial) {
		String sql = "";
		String str = "";
		
		try {
			conn.setAutoCommit(false);
			sql = "delete from semi_qa where q_serial = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, serial);
			ps.executeUpdate();
			
			
			
			sql = "delete from semi_board where n_serial = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, serial);
			ps.executeUpdate();
			
			System.out.println("삭제중"+serial);
			str = "삭제완료";
			
			conn.commit();
			
			ps.close();
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();
		}finally {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return str;
		}
		
	}
	
	public String insert(BoardVo vo) {
		String str = "";
		String sql = "";
		String s = "";
		switch(vo.getN_category()) {
		
		case 1:	
			s = "n";
			break;
		case 2:
			s = "q";
			break;
		case 3:
			s = "g";
			break;
		case 4:
			s = "e";
			break;
		}
		
		
		try {
			sql = "insert into semi_board( n_serial, n_mid, n_title , n_category, n_content, n_date ,n_count) "
					+ " values ('" + s + "'||seq_n_serial" + s +".nextval,? ,?, ?, ?, ?, 0)";
			
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getN_mid()); // 현재 아이디값 받아와야댐
			ps.setString(2, vo.getN_title());
			ps.setInt(3, vo.getN_category());//카테고리 받아서 넣어야댐
			ps.setString(4, vo.getN_content());
			ps.setTimestamp(5, vo.getN_date());
			ps.executeUpdate();
			
			conn.commit();
			
			conn.setAutoCommit(false);
			if(s == "q") {
				sql = "insert into semi_qa(q_serial, answer) values ('q'||seq_n_serialq.currval , 0)";
				ps = conn.prepareStatement(sql);
				ps.executeUpdate();
			}
			
			
			System.out.println("인서트 dao^^");
			ps.close();

			
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();
		}finally {
			try {
				conn.commit();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			return str;
		}
		
		
	}
	
	
}
