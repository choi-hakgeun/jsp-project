package bean;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class SCDao implements TestInterface{
	public Connection conn;
	DecimalFormat df = new DecimalFormat("###,###,###.#");

	public SCDao() {
		conn = DBConn.getConn();
	}
	
	public SCCommentVo chart(String cId) {
		SCCommentVo vo = new SCCommentVo();
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			for(int i = 1 ; i <= 5 ; i++) {
				sql = "select count(int_score) cnt from semi_interest where int_cid = ? and int_score = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, cId);
				ps.setInt(2, i);
				rs = ps.executeQuery();
				if(rs.next()) {
					switch (i) {
					case 1:
						vo.setCnt1(rs.getInt("cnt"));
						break;
					case 2:
						vo.setCnt2(rs.getInt("cnt"));
						break;
					case 3:
						vo.setCnt3(rs.getInt("cnt"));
						break;
					case 4:
						vo.setCnt4(rs.getInt("cnt"));
						break;
					case 5:
						vo.setCnt5(rs.getInt("cnt"));
						break;
					} // end of switch
				} // end of if
			} // end of for
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public void naverSignIn(String mId, String mName, String phone, String snsId) {
		String sql = "";
		PreparedStatement ps = null;
		
		try {
			sql = "insert into semi_member(m_mid, m_name, m_pwd, m_phone, m_sns) values(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, mName);
			ps.setString(3, snsId);
			ps.setString(4, phone);
			ps.setString(5, snsId);
			
			
			int r = ps.executeUpdate();
			if (r>0) {
				conn.commit();
				ps.close();
				conn.close();
			} else {
				conn.rollback();
				ps.close();
				conn.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String naverLogin(String id) {
		String result = "";
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			sql = "select * from semi_member where m_sns=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getString("m_mId");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	public String commentLike(String mId, String cId, String send) {
		String like="";
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			sql = "select * from semi_comment where com_mId=? and com_cId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, cId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("com_mId").equals(send)) {
					return "false";
				} else {
					sql = "update semi_comment set com_like = ? where com_mId = ? and com_cId = ?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, (rs.getInt("com_like")+1)+"");
					ps.setString(2, mId);
					ps.setString(3, cId);
					int r = ps.executeUpdate();
					if (r > 0) {
						like = (rs.getInt("com_like")+1)+"";
						conn.commit();
					} else {
						conn.rollback();
					} // end of if else
				} // end of if else
			} // end of rs if
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return like;
	}

	public ContentVo view(String cId) {
		System.out.println("a1");
		ContentVo vo = new ContentVo();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			sql = " select c_name, c_genre, c_story from semi_content where c_id=?";
			System.out.println("a2");
			ps = conn.prepareStatement(sql);
			ps.setString(1, cId);
			rs = ps.executeQuery();
			System.out.println("a3");
			while (rs.next()) {
				vo.setC_name(rs.getString("c_name"));
				vo.setC_genre(rs.getString("c_genre"));
				vo.setC_story(rs.getString("c_story"));
				System.out.println("a4");
			}
			rs.close();
			ps.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}

	public void comment_insert(String mId, String cId, String content) {
		String sql = null;
		PreparedStatement ps = null;
		try {
			sql = " insert into semi_comment values('com'||seq_semi_comment.nextval, ?, ?, 0, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, cId);
			ps.setString(3, content);
			int r = ps.executeUpdate();
			if (r > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public SCContentVo starCheck(String mId, String cId) {
		SCContentVo vo = null;
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			sql = "select * from semi_interest where int_mId = ? and int_cId = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, cId);
			rs = ps.executeQuery();

			if (rs.next()) {
				vo = new SCContentVo();
				vo.setScore(rs.getString("int_score"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}

	public List<SCActorVo> actorList(String cId) {
		List<SCActorVo> list = new ArrayList<SCActorVo>();
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			sql = "select * from semi_actors where a_work = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, cId);
			rs = ps.executeQuery();

			while (rs.next()) {
				SCActorVo vo = new SCActorVo();
				vo.setaId(rs.getString("a_id"));
				vo.setaName(rs.getString("a_name"));
				vo.setPosition(rs.getString("a_position"));
				vo.setPhoto(rs.getString("a_photo"));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean commentCheck(String cId, String mId) {
		boolean flag = false;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";

		try {
			sql = "select * from semi_interest where int_mid = ? and int_cid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, cId);
			rs = ps.executeQuery();
			while (rs.next()) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public ContentInsertPhoto jsonParsing(String cId) {
		ContentInsertPhoto pVo = new ContentInsertPhoto();
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		String jsonString = "";

		try {
			sql = "select c_id, c_other from semi_content where c_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, cId);
			rs = ps.executeQuery();
			if (rs.next()) {
				File file = new File("C:/Users/JHTA/eclipse-workspace/real-web-semi/WebContent/lib/"
						+ rs.getString("c_id") + ".txt");
				if (file.exists()) {
					BufferedReader bReader = new BufferedReader(new FileReader(file));
					jsonString = bReader.readLine();

					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(jsonString);
					pVo.setLongPhoto((String) obj.get("long"));
					pVo.setGallery1((String) obj.get("gallery1"));
					pVo.setGallery2((String) obj.get("gallery2"));
					pVo.setGallery3((String) obj.get("gallery3"));
					pVo.setGallery4((String) obj.get("gallery4"));
					pVo.setDate((String) obj.get("date"));
					bReader.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pVo;
	}

	public List<SCContentVo> moreMovie(String cName, String category) {
		List<SCContentVo> list = new ArrayList<SCContentVo>();
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		String jsonString = "";

		try {
			sql = "select * from semi_content where c_name like ? and c_category = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + cName + "%");
			ps.setString(2, category);
			rs = ps.executeQuery();

			while (rs.next()) {
				SCContentVo vo = new SCContentVo();
				vo.setcId(rs.getString("c_id"));
				vo.setcName(rs.getString("c_name"));
				vo.setCategory(rs.getString("c_category"));
				vo.setGenre(rs.getString("c_genre"));
				vo.setStory(rs.getString("c_story"));
				vo.setPreview(rs.getString("c_preview"));
				vo.setImage(rs.getString("c_image"));
				File file = new File("C:/Users/JHTA/eclipse-workspace/real-web-semi/WebContent/lib/"
						+ rs.getString("c_id") + ".txt");
				if (file.exists()) {
					BufferedReader bReader = new BufferedReader(new FileReader(file));
					jsonString = bReader.readLine();

					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(jsonString);
					vo.setDate((String) obj.get("date"));
					bReader.close();
				} // end of if
				list.add(vo);

			} // end of while

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public void interestUpdate(String mId, String cId, String interest) {
		String sql = "";
		PreparedStatement ps = null;

		try {
			sql = "update semi_interest set int_interest = ? where int_mId = ? and int_cId = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, interest);
			ps.setString(2, mId);
			ps.setString(3, cId);
			int r = ps.executeUpdate();
			if (r > 0) {
				conn.commit();
				System.out.println("수정완료");
			} else {
				conn.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void interestInsert(String mId, String cId, String interest, String category) {
		String sql = "";
		PreparedStatement ps = null;

		try {
			sql = "insert into semi_interest values('inte'||seq_i_serial.nextval, ?, ?, ?, 0, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, cId);
			ps.setString(3, interest);
			ps.setString(4, category);

			int r = ps.executeUpdate();
			if (r > 0) {
				conn.commit();
				System.out.println("입력완료");
			} else {
				conn.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean interestCheck(String mId, String cId) {
		boolean flag = false;
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			sql = "select count(int_cId) cnt from semi_interest where int_mId = ? and int_cid = ?  ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, cId);
			rs = ps.executeQuery();

			if (rs.next() && !rs.getString("cnt").equals("0")) {
				flag = true;
			}
			;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public List<SCContentVo> actorsContent(String aId) {
		List<SCContentVo> list = new ArrayList<SCContentVo>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";

		try {
			sql = "select * from semi_content where c_id in (select a_work from semi_actors where a_id = ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, aId);
			rs = ps.executeQuery();

			while (rs.next()) {
				SCContentVo vo = new SCContentVo();
				vo.setcId(rs.getString("c_Id"));
				vo.setcName(rs.getString("c_name"));

				if (rs.getInt("c_category") == 0) {
					vo.setCategory("영화");
				} else {
					vo.setCategory("드라마");
				}

				vo.setGenre(rs.getString("c_genre"));
				vo.setStory(rs.getString("c_story"));
				vo.setPreview(rs.getString("c_preview"));
				vo.setImage(rs.getString("c_image"));
				vo.setOther(rs.getString("c_other"));

				sql = "select avg(int_score) aavv from semi_interest where int_cid = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getcId());
				ResultSet rs2 = ps.executeQuery();
				if (rs2.next()) {
					if(rs2.getString("aavv")!= null) {
						vo.setScore(df.format(df.parse(rs2.getString("aavv"))));
					}
				} // end of if
				list.add(vo);
			} // end of while
			System.out.println(list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean commentInsert(String mId, String cId, String score, String category) {
		boolean flag = false;
		String sql = "";
		PreparedStatement ps = null;
		System.out.println(category);

		try {
			sql = "insert into semi_interest values('inte'||seq_i_serial.nextval, ?, ?, 0, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, cId);
			ps.setString(3, score);
			ps.setString(4, category);
			int r = ps.executeUpdate();
			if (r > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public boolean commentDelete(String mId, String cId) {
		boolean flag = false;
		String sql = "";
		PreparedStatement ps = null;

		try {
			sql = "delete semi_interest where int_mId = ? and int_cId = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ps.setString(2, cId);
			int r = ps.executeUpdate();
			if (r > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public boolean commentUpdate(String mId, String cId, String score, String category) {
		boolean flag = false;
		String sql = "";
		PreparedStatement ps = null;

		try {
			if(score.equals("0")) {
				sql = "update semi_interest set int_score = null, int_category = ? where int_mid = ? and int_cid = ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, category);
				ps.setString(2, mId);
				ps.setString(3, cId);
			} else {
				sql = "update semi_interest set int_score = ?, int_category = ? where int_mid = ? and int_cid = ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, score);
				ps.setString(2, category);
				ps.setString(3, mId);
				ps.setString(4, cId);
			}

			int i = ps.executeUpdate();
			if (i > 0) {
				conn.commit();
				flag = true;
			} else {
				conn.rollback();
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public SCContentVo contentSelect(String cId) {
		SCContentVo vo = new SCContentVo();
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			sql = "select * from semi_content where c_Id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, cId);
			rs = ps.executeQuery();

			if (rs.next()) {
				vo.setcId(rs.getString("c_Id"));
				vo.setcName(rs.getString("c_name"));

				if (rs.getInt("c_category") == 0) {
					vo.setCategory("영화");
				} else {
					vo.setCategory("드라마");
				}

				vo.setGenre(rs.getString("c_genre"));
				vo.setStory(rs.getString("c_story"));
				vo.setPreview(rs.getString("c_preview"));
				vo.setImage(rs.getString("c_image"));

				File file = new File("C:/Users/JHTA/eclipse-workspace/real-web-semi/WebContent/lib/"
						+ rs.getString("c_id") + ".txt");
				if (file.exists()) {
					BufferedReader br = new BufferedReader(new FileReader(file));
					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(br);
					vo.setDate((String) obj.get("date"));
				}

				vo.setOther(rs.getString("c_other"));

				sql = "select count(int_score) count , avg(int_score) avg from semi_interest where int_cid = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, cId);
				ResultSet rs2 = ps.executeQuery();
				if (rs2.next() && rs2.getString("avg") != null) {
					vo.setScore(df.format(df.parse(rs2.getString("avg"))));
					vo.setRatingCount(df.format(rs2.getInt("count")));
				} else { // end of if
					vo.setScore("0");
					vo.setRatingCount("0");
				}
			} // end of if

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	} // end of contentSelect

	public List<SCActorVo> actorsSelect(String cId) {
		List<SCActorVo> list = new ArrayList<SCActorVo>();

		SCActorVo vo = null;
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			sql = "select * from semi_actors where a_work = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, cId);
			rs = ps.executeQuery();

			while (rs.next()) {
				vo = new SCActorVo();
				vo.setSerial(rs.getString("a_serial"));
				vo.setaId(rs.getString("a_id"));
				vo.setaName(rs.getString("a_name"));

				if (rs.getString("a_position") == "0") {
					vo.setPosition("감독");
				} else {
					vo.setPosition("배우");
				}

				vo.setWork(rs.getString("a_work"));
				vo.setPhoto(rs.getString("a_photo"));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	} // end of actorsSelect

	public List<SCCommentVo> commentSelect(String cId) {
		List<SCCommentVo> list = new ArrayList<SCCommentVo>();
		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			sql = "select * from semi_comment com join semi_interest inte on com.com_cid = inte.int_cid where com_cid = ? and com.com_mid = inte.int_mid";
			ps = conn.prepareStatement(sql);
			ps.setString(1, cId);
			rs = ps.executeQuery();

			while (rs.next()) {
				SCCommentVo vo = new SCCommentVo();

				sql = "select m_photo from semi_member where m_mid = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, rs.getString("com_mid"));
				ResultSet temp = ps.executeQuery();
				if (temp.next()) {
					vo.setPhoto(temp.getString("m_photo"));
				}
				temp.close();

				vo.setSerial(rs.getString("com_serial"));
				vo.setmId(rs.getString("com_mid"));
				vo.setcId(rs.getString("com_cid"));
				vo.setLike(rs.getInt("com_like"));
				vo.setContent(rs.getString("con_content"));
				vo.setInterest(rs.getInt("int_interest"));
				vo.setScore(rs.getInt("int_score"));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean checkMid(String mId) {
		boolean flag = false;
		if(mId.indexOf("@") > 0) {
			
		} else {
			flag = true;
		}
		return flag;
	}
	
	
	
}
