package bean;

public class ManagerContentVo {
	String c_id;
	String c_name;
	int c_category;
	String c_genre;
	String c_story;
	String c_preview;
	String c_image;
	String c_other;

	public ManagerContentVo() {	}
	public ManagerContentVo(String cId, String cName, int category, String genre, String story, String preview, String image, String other) {
		this.c_id = cId;
		this.c_name = cName;
		this.c_category = category;
		this.c_genre = genre;
		this.c_story = story;
		this.c_preview = preview;
		this.c_image = image;
		this.c_other = other;
	}
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getC_category() {
		return c_category;
	}
	public void setC_category(int c_category) {
		this.c_category = c_category;
	}
	public String getC_genre() {
		return c_genre;
	}
	public void setC_genre(String c_genre) {
		this.c_genre = c_genre;
	}
	public String getC_story() {
		return c_story;
	}
	public void setC_story(String c_story) {
		this.c_story = c_story;
	}
	public String getC_preview() {
		return c_preview;
	}
	public void setC_preview(String c_preview) {
		this.c_preview = c_preview;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	public String getC_other() {
		return c_other;
	}
	public void setC_other(String c_other) {
		this.c_other = c_other;
	}
}
