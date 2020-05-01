package bean;

import java.util.Date;

public class ManagerMemberVo {
	String m_mId;
	String m_name;
	String m_pwd;
	String m_phone;
	String m_photo;
	String m_profile;
	Date m_date;
	int m_admin;
	
	public ManagerMemberVo() {  }
	public ManagerMemberVo(String mId, String mName, String pwd, String phone, String photo, String profile, Date date, int admin) {
		this.m_mId = mId;
		this.m_name = mName;
		this.m_pwd = pwd;
		this.m_phone = phone;
		this.m_photo = photo;
		this.m_profile = profile;
		this.m_date = date;
		this.m_admin = admin;
	}
	
	public String getM_mId() {
		return m_mId;
	}
	public void setM_mId(String m_mId) {
		this.m_mId = m_mId;
	}
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	public String getM_profile() {
		return m_profile;
	}
	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public int getM_admin() {
		return m_admin;
	}
	public void setM_admin(int m_admin) {
		this.m_admin = m_admin;
	}
}
