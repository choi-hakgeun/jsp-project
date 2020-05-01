package bean;

public class HGMemberVo {
	String mId;
	String mName;
	String pwd;
	String mPhone;
	String mPhoto;
	String mProfile;
	String mDate;
	int admin;
	String mMovieCnt;
	String mTvCnt;
	String mMovieWant;
	String mTvWant;

	public HGMemberVo() {}
	
	public HGMemberVo(String mId, String mName, String mPhone, String mProfile, String mPhoto) {
		this.mId=mId;
		this.mName=mName;
		this.mPhone=mPhone;
		this.mProfile=mProfile;
		this.mPhoto=mPhoto;
	}
	
	public String getmMovieWant() {
		return mMovieWant;
	}

	public void setmMovieWant(String mMovieWant) {
		this.mMovieWant = mMovieWant;
	}

	public String getmTvWant() {
		return mTvWant;
	}

	public void setmTvWant(String mTvWant) {
		this.mTvWant = mTvWant;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmPhoto() {
		return mPhoto;
	}

	public void setmPhoto(String mPhoto) {
		this.mPhoto = mPhoto;
	}

	public String getmProfile() {
		return mProfile;
	}

	public void setmProfile(String mProfile) {
		this.mProfile = mProfile;
	}

	public String getmDate() {
		return mDate;
	}

	public void setmDate(String mDate) {
		this.mDate = mDate;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getmMovieCnt() {
		return mMovieCnt;
	}

	public void setmMovieCnt(String mMovieCnt) {
		this.mMovieCnt = mMovieCnt;
	}

	public String getmTvCnt() {
		return mTvCnt;
	}

	public void setmTvCnt(String mTvCnt) {
		this.mTvCnt = mTvCnt;
	}

}
