package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class he_dao {
	Connection conn = DBConn.getConn();
	
 public boolean main_login(String id, String pwd) {
	 boolean r = false;
	 String sql = "select m_mid, m_photo from semi_member where m_mid=? and m_pwd=? ";
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 
		 ps.setString(1, id);
		 ps.setString(2, pwd);
		 
		 ResultSet rs = ps.executeQuery();
		 
		 if(rs.next()) {
			 r= true;
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return r;
 }
 public int main_join(he_vo vo) {
	 int r = 0;
	 String sql = "insert into semi_member(m_mid,m_name,m_pwd,m_phone,m_date,m_admin) values(?,?,?,?,sysdate,0)";
	 try {
		 PreparedStatement ps =  conn.prepareStatement(sql);
		 ps.setString(1, vo.getmId());
		 ps.setString(2, vo.getmName());
		 ps.setString(3, vo.getPwd());
		 ps.setString(4, vo.getPhone());
		 conn.setAutoCommit(false);
		 r =ps.executeUpdate();
		 if(r>0) {
			 conn.commit();
		 }else {
			 conn.rollback();
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	return r;
 }
 
 public boolean mail_check(String mid) {
	 boolean r = false;
	 String sql = "select m_mid from semi_member where m_mid=?";
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 
		 ps.setString(1, mid);
		 
		 ResultSet rs = ps.executeQuery();
		 
		 if(rs.next()) {
			 r = true;
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return r;
	 
 }
 public String find_pwd(String mid) {
	 String r = null;
	 String sql = "select m_pwd from semi_member where m_mid=?";
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 
		 ps.setString(1, mid);
		 
		 ResultSet rs = ps.executeQuery();
		 
		 if(rs.next()) {
			 r = rs.getString("m_pwd");
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return r;
	 
 }
 public List<he_vo> my_movies(String mid, String cmd) {
	 List<he_vo> list = new ArrayList<he_vo>();
	 String sql = "";
	 if(cmd.equals("0")) {
		 sql = "select * from semi_interest where int_mid = ? and int_category='0'";
	 } else {
		 sql = "select * from semi_interest where int_mid = ? and int_category='1'";
	 }
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 
		 ResultSet rs = ps.executeQuery();
		 
		 while(rs.next()) {
			 he_vo vo = new he_vo();

			 vo.setCont_id(rs.getString("int_cid"));
			 vo.setInt_score(rs.getString("int_score"));
			 list.add(vo);
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return list;
 }
 
 public he_vo my_movies_cont(String c_id){
	 he_vo vo = new he_vo();
	 String sql = "select c_image,c_name from semi_content where c_id =?";
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 
		 ps.setString(1, c_id);
		 ResultSet rs= ps.executeQuery();
		 if(rs.next()) {
			 vo.setCont_name(rs.getString("c_name"));
			 vo.setCont_img(rs.getString("c_image"));
		 }
		 
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 
	 
	 return vo;
 }
 
 public String cnt_myMovies(String mid, String cmd) {
	 String r = "";
	 String sql = "";
	 if(cmd.equals("0")) {
		 sql = " select count(int_serial) cnt from semi_interest where int_score is not null "
		 		    + " and int_category='0' and int_mid=?";
	 } else {
		 sql = " select count(int_serial) cnt from semi_interest where int_score is not null "
		 		    + " and int_category='1' and int_mid=?";
	 }

	 try {
		 PreparedStatement ps =conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 ResultSet rs = ps.executeQuery();
		 
		 if(rs.next()){
			 r = rs.getString("cnt");
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return r;
 }
 
 public String cnt_wantMovies(String mid, String cmd) {
	 String r = "";
	 String sql = "";
	 if(cmd.equals("0")) {
		 sql = " select count(int_serial) cnt from semi_interest where int_interest =2 "
		 		    + " and int_category='0' and int_mid=?";
	 } else {
		 sql = " select count(int_serial) cnt from semi_interest where int_interest =2 "
		 		    + " and int_category='1' and int_mid=?";
	 }
	 try {
		 PreparedStatement ps =conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 ResultSet rs = ps.executeQuery();
		 
		 if(rs.next()){
			 r = rs.getString("cnt");
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return r;
 }
 
 public String cnt_watchingMovies(String mid, String cmd) {
	 String r = "";
	 String sql = "";
	 
	 if(cmd.equals("0")) {
		 sql = " select count(int_serial) cnt from semi_interest where int_interest =1 "
		 		    + " and int_category='0' and int_mid=?";
	 } else {
		 sql = " select count(int_serial) cnt from semi_interest where int_interest =1 "
		 		    + " and int_category='1' and int_mid=?";
	 }
	 
	 try {
		 PreparedStatement ps =conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 ResultSet rs = ps.executeQuery();
		 
		 if(rs.next()){
			 r = rs.getString("cnt");
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return r;
 }
 
 public List<he_vo> my_movies_rank(String mid, String cmd,int score) {
	 List<he_vo> list = new ArrayList<he_vo>();
	 String sql = "";
	 if(cmd.equals("0")) {
		 sql = "select * from semi_interest where int_mid = ? and int_category='0' and int_score=?";
	 } else {
		 sql = "select * from semi_interest where int_mid = ? and int_category='1' and int_score=?";
	 }
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 ps.setInt(2, score);
		 
		 ResultSet rs = ps.executeQuery();
		 
		 while(rs.next()) {
			 he_vo vo = new he_vo();
			 vo.setInt_score(rs.getString("int_score"));
			 vo.setCont_id(rs.getString("int_cid"));
			 list.add(vo);
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return list;
 }
 
 public String cnt_rank(String mid, String cmd,int score) {
	 String r = "";
	 String sql = "";
	 
	 if(cmd.equals("0")) {
		 sql = " select count(int_serial) cnt from semi_interest where int_score=? "
		 		    + " and int_category='0' and int_mid=?";
	 } else {
		 sql = " select count(int_serial) cnt from semi_interest where int_score=? "
		 		    + " and int_category='1' and int_mid=?";
	 }
	 
	 try {
		 PreparedStatement ps =conn.prepareStatement(sql);
		 ps.setInt(1, score);
		 ps.setString(2, mid);
		 ResultSet rs = ps.executeQuery();
		 
		 if(rs.next()){
			 r = rs.getString("cnt");
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return r;
 }
 
 public List<he_vo> my_wish(String mid, String cmd) {
	 List<he_vo> list = new ArrayList<he_vo>();
	 String sql = "";
	 if(cmd.equals("0")) {
		 sql = "select * from semi_interest where int_mid = ? and int_category='0' and int_interest=2";
	 } else {
		 sql = "select * from semi_interest where int_mid = ? and int_category='1' and int_interest=2";
	 }
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 ResultSet rs = ps.executeQuery();
		 
		 while(rs.next()) {
			 he_vo vo = new he_vo();

			 vo.setCont_id(rs.getString("int_cid"));
			 vo.setInt_score(rs.getString("int_score"));
			 list.add(vo);
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return list;
 }
 
 
 public List<he_vo> my_watching(String mid, String cmd) {
	 List<he_vo> list = new ArrayList<he_vo>();
	 String sql = "";
	 if(cmd.equals("0")) {
		 sql = "select * from semi_interest where int_mid = ? and int_category='0' and int_interest=1";
	 } else {
		 sql = "select * from semi_interest where int_mid = ? and int_category='1' and int_interest=1";
	 }
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 ResultSet rs = ps.executeQuery();
		 
		 while(rs.next()) {
			 he_vo vo = new he_vo();

			 vo.setCont_id(rs.getString("int_cid"));
			 vo.setInt_score(rs.getString("int_score"));
			 list.add(vo);
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return list;
 }
 
 public void searchUpdate(String cid) {
	 String sql = "";
	 int cnt =0;
	 PreparedStatement ps = null;
	 ResultSet rs = null;
	 
	 try {
		sql = "select c_search from semi_content where c_id=?"; 
		ps = conn.prepareStatement(sql);
		ps.setString(1, cid);
		rs = ps.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("c_search");
		}
		
		cnt++;
		sql= "update semi_content set c_search=? where c_id=?";
			
		ps = conn.prepareStatement(sql);
		ps.setInt(1, cnt);
		ps.setString(2, cid);
			
		int k = ps.executeUpdate();
			
		conn.setAutoCommit(false);
			
		if(k>0) {
			conn.commit();
		}else {
			conn.rollback();
		}
			
					 
	 }catch(Exception ex){
		 ex.printStackTrace();
	 }
	 
 }
 
 public List<String> trend(){
	 List<String> list = new ArrayList<String>();
	 String sql = " select * from( "
			    + " select rownum rn, A.* from("
			    + " select c_name "
			    + " from semi_content "
			    + " order by c_search desc)A"
			    + " )where rn between 1 and 6";
	 
	 try{
		 
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ResultSet rs = ps.executeQuery(sql);
		 
		 while(rs.next()) {
			 list.add(rs.getString("c_name"));
		 }
		 
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 
	 return list;
 }
 public he_vo findName(String mid) {
	 String sql = "";
	 he_vo vo = new he_vo();
	 
	 
	 sql = " select m_name,m_photo from semi_member  "
		 + " where m_mid=?";

	 try {
		 PreparedStatement ps =conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 ResultSet rs = ps.executeQuery();
		 
		 if(rs.next()){
			 vo.setmName(rs.getString("m_name"));
			 vo.setCont_img(rs.getString("m_photo"));
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return vo;
 }
 
 public int my_rank(String mid,int score) {
	 String sql = "";
	 int r =0;
	 sql = "select count(int_serial) cnt from semi_interest where int_mid = ? and int_score=?";
	
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 ps.setInt(2, score);
		 
		 ResultSet rs = ps.executeQuery();
		 
		 while(rs.next()) {
			 r = rs.getInt("cnt");
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return r;
 }
 
 public List<String> my_avg(String mid) {
	 String sql = "";
	 List<String> list = new ArrayList<String>();
	 sql = "select round(avg(int_score),1) cnt, count(int_serial) cnt2 from semi_interest where int_mid=? and int_score is not null";
	
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 
		 ResultSet rs = ps.executeQuery();
		 
		 while(rs.next()) {
			 list.add(rs.getString("cnt"));
			 list.add(rs.getString("cnt2"));
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return list;
 }
 
 public List<he_vo> like_genre(String mid){
	 List<he_vo> list = new ArrayList<he_vo>();
	 String sql = " select c_genre, count(c_genre) cnt, sum(int_score) score from semi_content c, semi_interest i "
	 	 	    + " where c_id = int_cid and int_mid =? and int_score is not null "
	 	 	    + " group by c_genre order by score desc ";
	
	 try {
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ps.setString(1, mid);
		 
		 ResultSet rs = ps.executeQuery();
		 
		 while(rs.next()) {
			 he_vo vo = new he_vo();
			 vo.setLike_genre(rs.getString("c_genre"));
			 vo.setCnt_genre(rs.getString("cnt"));
			 vo.setSum_score(rs.getString("score"));
			 list.add(vo);
		 }
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }
	 return list;
 }
 
 
 
 
 
 
}
