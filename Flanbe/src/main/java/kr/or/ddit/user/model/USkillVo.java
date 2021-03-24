package kr.or.ddit.user.model;

// 보유기술
public class USkillVo {

	private int us_no;			// 번호 (시퀀스)
	private String user_id;		// 사용자아이디
	private String us_kind;		// 기술 (자바 : 01, C언어 : 02, 파이썬 : 03, 자바스크립트 : 04, 기타 : 05)
	private String us_prof;		// 숙련도 (초급 : 01, 중급 : 02, 고급 : 03, 특급 : 04)
	
	public USkillVo() {}
	
	public USkillVo(int us_no, String user_id, String us_kind, String us_prof) {
		super();
		this.us_no = us_no;
		this.user_id = user_id;
		this.us_kind = us_kind;
		this.us_prof = us_prof;
	}
	public int getUs_no() {
		return us_no;
	}
	public void setUs_no(int us_no) {
		this.us_no = us_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUs_kind() {
		return us_kind;
	}
	public void setUs_kind(String us_kind) {
		this.us_kind = us_kind;
	}
	public String getUs_prof() {
		return us_prof;
	}
	public void setUs_prof(String us_prof) {
		this.us_prof = us_prof;
	}
	@Override
	public String toString() {
		return "USkillVo [us_no=" + us_no + ", user_id=" + user_id + ", us_kind=" + us_kind + ", us_prof=" + us_prof
				+ "]";
	}
	
	
	
}
