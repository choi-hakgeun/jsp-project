package bean;

public class ManagerCommentVo {
	String com_serial;
	String com_mId;
	String com_cId;
	int com_like;
	String con_content;
	
	public ManagerCommentVo() {	}
	public ManagerCommentVo(String cSerial, String mId, String cId, int like, String content) {
		this.com_serial = cSerial;
		this.com_mId = mId;
		this.com_cId = cId;
		this.com_like = like;
		this.con_content = content;
	}
	
	public String getCom_serial() {
		return com_serial;
	}
	public void setCom_serial(String com_serial) {
		this.com_serial = com_serial;
	}
	public String getCom_mId() {
		return com_mId;
	}
	public void setCom_mId(String com_mId) {
		this.com_mId = com_mId;
	}
	public String getCom_cId() {
		return com_cId;
	}
	public void setCom_cId(String com_cId) {
		this.com_cId = com_cId;
	}
	public int getCom_like() {
		return com_like;
	}
	public void setCom_like(int com_like) {
		this.com_like = com_like;
	}
	public String getCon_content() {
		return con_content;
	}
	public void setCon_content(String con_content) {
		this.con_content = con_content;
	}
}
