package bean;

import com.sun.jmx.snmp.Timestamp;

public class BD_ReplyVo {
	String r_serial;
	String r_id;
	String r_reply;
	String r_photo;
	java.sql.Timestamp r_time;
	String r_board;
	String m_name;
	
	

	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getR_board() {
		return r_board;
	}
	public void setR_board(String r_board) {
		this.r_board = r_board;
	}

	public java.sql.Timestamp getR_time() {
		return r_time;
	}
	public void setR_time(java.sql.Timestamp r_time) {
		this.r_time = r_time;
	}
	public String getR_serial() {
		return r_serial;
	}
	public void setR_serial(String r_serial) {
		this.r_serial = r_serial;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getR_reply() {
		return r_reply;
	}
	public void setR_reply(String r_reply) {
		this.r_reply = r_reply;
	}
	public String getR_photo() {
		return r_photo;
	}
	public void setR_photo(String r_photo) {
		this.r_photo = r_photo;
	}
	
	
}
