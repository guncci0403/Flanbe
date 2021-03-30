package kr.or.ddit.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

// 프로젝트
public class ProjectVo {

	private int p_code;			// 프로젝트 코드
	private String p_title;		// 프로젝트 명
	private String user_id;		// 클라이언트아이디
	private String p_state;		// 상태코드 (검수중 : 01, 승인거부 : 02, 지원자모집중 : 03, 계약 중 : 04, 계약완료 : 05, 진행 중 : 06, 평가대기 : 07, 완료 : 09)
	private String p_cont;		// 업무내용
	private String p_field;		// 개발분야 (웹 : 01, 애플리케이션 : 02, 퍼블리싱 : 03, 게임 : 04, 기타 : 05)
	private int p_money;		// 예상금액
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date deadline;		// 모집마감일
	private int period;			// 예상기간
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date p_sdt;			// 시작일
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date p_edt;			// 종료일
	private int progress;		// 진행률
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date p_regdt;		// 등록일시
	
	// 추가
	private String intro;		// 자기소개
	
	private int page;
	private int pageSize;
	
	private String p_state2;
	private String p_state3;

	public ProjectVo() {}
	
	public ProjectVo(int page, int pageSize, String user_id) {
		this.user_id = user_id;
		this.page=page;
		this.pageSize=pageSize;
	}
	
	public ProjectVo(int p_code, String p_state, String p_state2, String p_state3) {
		this.p_code=p_code;
		this.p_state=p_state;
		this.p_state2=p_state2;
		this.p_state3=p_state3;
	}
	
	public ProjectVo(int page, int pageSize,String user_id, String p_state, String p_state2, String p_state3) {
		this.page=page;
		this.pageSize=pageSize;
		this.p_state=p_state;
		this.user_id=user_id;
		this.p_state2=p_state2;
		this.p_state3=p_state3;
	}
	
	public ProjectVo(String p_state, String p_state2, String p_state3) {
		this.p_state=p_state;
		this.p_state2=p_state2;
		this.p_state3=p_state3;
	}
	
	public ProjectVo(int p_code, String p_title, String user_id, String p_state, String p_cont, String p_field,
			int p_money, Date deadline, int period, Date p_sdt, Date p_edt, int progress, Date p_regdt) {
		this.p_code = p_code;
		this.p_title = p_title;
		this.user_id = user_id;
		this.p_state = p_state;
		this.p_cont = p_cont;
		this.p_field = p_field;
		this.p_money = p_money;
		this.deadline = deadline;
		this.period = period;
		this.p_sdt = p_sdt;
		this.p_edt = p_edt;
		this.progress = progress;
		this.p_regdt = p_regdt;
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
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public Date getP_sdt() {
		return p_sdt;
	}
	public void setP_sdt(Date p_sdt) {
		this.p_sdt = p_sdt;
	}
	public Date getP_edt() {
		return p_edt;
	}
	public void setP_edt(Date p_edt) {
		this.p_edt = p_edt;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public Date getP_regdt() {
		return p_regdt;
	}
	public void setP_regdt(Date p_regdt) {
		this.p_regdt = p_regdt;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	/**
	 * 추가
	 * 
	 */
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getP_state2() {
		return p_state2;
	}

	public void setP_state2(String p_state2) {
		this.p_state2 = p_state2;
	}

	public String getP_state3() {
		return p_state3;
	}

	public void setP_state3(String p_state3) {
		this.p_state3 = p_state3;
	}

	@Override
	public String toString() {
		return "ProjectVo [p_code=" + p_code + ", p_title=" + p_title + ", user_id=" + user_id + ", p_state=" + p_state
				+ ", p_cont=" + p_cont + ", p_field=" + p_field + ", p_money=" + p_money + ", deadline=" + deadline
				+ ", period=" + period + ", p_sdt=" + p_sdt + ", p_edt=" + p_edt + ", progress=" + progress
				+ ", p_regdt=" + p_regdt + ", intro=" + intro + ", page=" + page + ", pageSize=" + pageSize
				+ ", p_state2=" + p_state2 + ", p_state3=" + p_state3 + "]";
	}

}
