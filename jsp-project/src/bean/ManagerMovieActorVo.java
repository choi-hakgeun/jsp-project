package bean;

public class ManagerMovieActorVo {
	String a_serial;
	String a_id;
	String a_name;
	int a_position;
	String a_work;
	String a_photo;
	
	public ManagerMovieActorVo() {	}
	public ManagerMovieActorVo(String aSerial, String aId, String aName, int aPosition, String aWork, String aPhoto) {
		this.a_serial = aSerial;
		this.a_id = aId;
		this.a_name = aName;
		this.a_position = aPosition;
		this.a_work = aWork;
		this.a_photo = aPhoto;
	}
	
	public String getA_serial() {
		return a_serial;
	}
	public void setA_serial(String a_serial) {
		this.a_serial = a_serial;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public int getA_position() {
		return a_position;
	}
	public void setA_position(int a_position) {
		this.a_position = a_position;
	}
	public String getA_work() {
		return a_work;
	}
	public void setA_work(String a_work) {
		this.a_work = a_work;
	}
	public String getA_photo() {
		return a_photo;
	}
	public void setA_photo(String a_photo) {
		this.a_photo = a_photo;
	}
}
