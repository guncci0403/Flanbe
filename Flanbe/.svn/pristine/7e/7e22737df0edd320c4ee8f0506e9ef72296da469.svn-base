package kr.or.ddit.user.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

// 회원
public class UserVo {
	
	private String user_id;		// 사용자 아이디
	private String user_nm;		// 사용자 이름
	private String group_nm;	// 그룹 이름
	private String pass;		// 비밀번호
	private String phone;		// 전화번호
	private String email;		// 이메일
	private String base_addr;	// 기본주소
	private String detail_addr;	// 상세주소
	private String zipcode;		// 우편번호코드
	private String purpose;		// 이용목적구분코드 (M : 관리자, C : 클라이언트, P : 파트너스)
	private String u_div;		// 회원구분 (M : 관리자, S : 개인, T : 팀)
	private Date regdt;			// 등록일시
	private String intro;		// 자기소개
	private String photoroute;	// 사진경로
	private String u_act;		// 회원상태 (01 : 메일 인증 전, 02 : 메일인증 완료, 03 : 탈퇴)
	private String signroute;	// 사인이미지경로
	
	/**
	 * 동기 추가
	 */
	private String u_skills;	// 사용자 보유 스킬
	
	/**
	 * 수진 추가 
	 */
	private String p_state; 	// p_attend 의 상태
	private String careers; 	//기술
	private String us_kind; 	//기술
	private int s_no ; 				// 계약 상태 번호?
	private Date mtdt;			// 미팅일자
	private int p_code;			// 프로젝트 코드
	private String p_title;		// 프로젝트 명
	private String p_cont;		// 업무내용
	private String p_field;		// 개발분야 (웹 : 01, 애플리케이션 : 02, 퍼블리싱 : 03, 게임 : 04, 기타 : 05)
	private int p_money;		// 예상금액
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date deadline;		// 모집마감일
	
	public UserVo() {}
	
	
	public UserVo(String user_id, String signroute) {
		this.user_id = user_id;
		this.signroute = signroute;
	}
	
	public UserVo(String user_id, int p_code) {
		this.user_id = user_id;
		this.p_code = p_code;
	}
	
	public UserVo(String user_id, String user_nm, String group_nm, String pass, String phone, String email,
			String base_addr, String detail_addr, String zipcode, String purpose, String u_div, Date regdt,
			String intro, String photoroute, String u_act, String signroute) {
		this.user_id = user_id;
		this.user_nm = user_nm;
		this.group_nm = group_nm;
		this.pass = pass;
		this.phone = phone;
		this.email = email;
		this.base_addr = base_addr;
		this.detail_addr = detail_addr;
		this.zipcode = zipcode;
		this.purpose = purpose;
		this.u_div = u_div;
		this.regdt = regdt;
		this.intro = intro;
		this.photoroute = photoroute;
		this.u_act = u_act;
		this.signroute = signroute;
	}
	

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getGroup_nm() {
		return group_nm;
	}
	public void setGroup_nm(String group_nm) {
		this.group_nm = group_nm;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBase_addr() {
		return base_addr;
	}
	public void setBase_addr(String base_addr) {
		this.base_addr = base_addr;
	}
	public String getDetail_addr() {
		return detail_addr;
	}
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getU_div() {
		return u_div;
	}
	public void setU_div(String u_div) {
		this.u_div = u_div;
	}
	public Date getRegdt() {
		return regdt;
	}
	public void setRegdt(Date regdt) {
		this.regdt = regdt;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getPhotoroute() {
		return photoroute;
	}
	public void setPhotoroute(String photoroute) {
		this.photoroute = photoroute;
	}
	public String getU_act() {
		return u_act;
	}
	public void setU_act(String u_act) {
		this.u_act = u_act;
	}
	public String getSignroute() {
		return signroute;
	}
	public void setSignroute(String signroute) {
		this.signroute = signroute;
	}
	public String getP_state() {
		return p_state;
	}
	public void setP_state(String p_state) {
		this.p_state = p_state;
	}
	public String getU_skills() {
		return u_skills;
	}
	public void setU_skills(String u_skills) {
		this.u_skills = u_skills;
	}
	public String getCareers() {
		return careers;
	}
	public void setCareers(String careers) {
		this.careers = careers;
	}
	public String getUs_kind() {
		return us_kind;
	}
	public void setUs_kind(String us_kind) {
		this.us_kind = us_kind;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public Date getMtdt() {
		return mtdt;
	}

	public void setMtdt(Date mtdt) {
		this.mtdt = mtdt;
	}

	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getP_cont() {
		return p_cont;
	}

	public void setP_cont(String p_cont) {
		this.p_cont = p_cont;
	}

	public String getP_field() {
		return p_field;
	}

	public void setP_field(String p_field) {
		this.p_field = p_field;
	}

	public int getP_money() {
		return p_money;
	}

	public void setP_money(int p_money) {
		this.p_money = p_money;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	@Override
	public String toString() {
		return "UserVo [user_id=" + user_id + ", user_nm=" + user_nm + ", group_nm=" + group_nm + ", pass=" + pass
				+ ", phone=" + phone + ", email=" + email + ", base_addr=" + base_addr + ", detail_addr=" + detail_addr
				+ ", zipcode=" + zipcode + ", purpose=" + purpose + ", u_div=" + u_div + ", regdt=" + regdt + ", intro="
				+ intro + ", photoroute=" + photoroute + ", u_act=" + u_act + ", signroute=" + signroute + ", p_state="
				+ p_state + "]";
	}

	
}
