package kr.or.ddit.contract.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

// 미팅
public class MeetingVo {

	private int m_no;			// 번호(시퀀스)
	private int p_code;			// 프로젝트 코드
	private String ptn_id;		// 파트너스 아이디
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date mtdt;			// 미팅일자
	private String mtway;			// 미팅방법 (전화 : 01 , 화상 : 02 , 대면 : 03)
	
	public MeetingVo() {}
	public MeetingVo(int m_no, int p_code, String ptn_id, Date mtdt, String mtway) {
		super();
		this.m_no = m_no;
		this.p_code = p_code;
		this.ptn_id = ptn_id;
		this.mtdt = mtdt;
		this.mtway = mtway;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getPtn_id() {
		return ptn_id;
	}
	public void setPtn_id(String ptn_id) {
		this.ptn_id = ptn_id;
	}
	public Date getMtdt() {
		return mtdt;
	}
	public void setMtdt(Date mtdt) {
		this.mtdt = mtdt;
	}
	public String getMtway() {
		return mtway;
	}
	public void setMtway(String mtway) {
		this.mtway = mtway;
	}
	@Override
	public String toString() {
		return "MettingVo [m_no=" + m_no + ", p_code=" + p_code + ", ptn_id=" + ptn_id + ", mtdt=" + mtdt + ", mtway="
				+ mtway + "]";
	}
	
	
	
	
}
