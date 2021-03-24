package kr.or.ddit.project.model;

// 프로젝트 참가
public class PAttendVo {

	private int p_code;			// 프로젝트 코드
	private String user_id;		// 사용자 아이디
	private String p_state;		// 상태 (관심 : 01, 지원요청받은 : 02, 지원한 : 03, 참여중 : 04, 완료 : 05)
	
	public PAttendVo() {}
	
	public PAttendVo(int p_code, String user_id) {
		this.p_code = p_code;
		this.user_id = user_id;
	}

	
	public PAttendVo(int p_code, String user_id, String p_state) {
		this.p_code = p_code;
		this.user_id = user_id;
		this.p_state = p_state;
	}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getP_state() {
		return p_state;
	}
	public void setP_state(String p_state) {
		this.p_state = p_state;
	}
	@Override
	public String toString() {
		return "PAttendVo [p_code=" + p_code + ", user_id=" + user_id + ", p_state=" + p_state + "]";
	}
	
	
	
}
