package bean;

import com.sun.jmx.snmp.Timestamp;

public class BoardVo {

	String n_title;
	String n_serial;
	String n_mid;
	int n_category;
	String n_content;
	int n_count;
	java.sql.Timestamp n_date;
	String m_name;
	int answer;
	
	
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public java.sql.Timestamp getN_date() {
		return n_date;
	}
	public void setN_date(java.sql.Timestamp n_date) {
		this.n_date = n_date;
	}
	
	
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	
	public String getN_serial() {
		return n_serial;
	}
	public void setN_serial(String n_serial) {
		this.n_serial = n_serial;
	}
	public int getN_category() {
		return n_category;
	}
	public void setN_category(int n_category) {
		this.n_category = n_category;
	}
	public int getN_count() {
		return n_count;
	}
	public void setN_count(int n_count) {
		this.n_count = n_count;
	}
	public String getN_mid() {
		return n_mid;
	}
	public void setN_mid(String n_mid) {
		this.n_mid = n_mid;
	}
	
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
}
