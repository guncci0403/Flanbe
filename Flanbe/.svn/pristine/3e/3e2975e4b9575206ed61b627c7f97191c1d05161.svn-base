package kr.or.ddit.contract.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

// 미팅
public class MeetingVo {

	private int m_no;			// 번호(시퀀스)
	private int p_code;			// 프로젝트 코드
	private String ptn_id;		// 파트너스 아이디
	private String ctn_id;		// 클라이언트 아이디
	private String p_title;		// 프로젝트 제목(추가)
	private String ctn_nm;		// 클라이언트 이름(03-31 추가)
	private String ptn_nm;		// 파트너스 이름(03-31 추가)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date mtdt;			// 미팅일자
	private String mtdtS;		// 날짜 포맷팅(추가)
	private String mtway;			// 미팅방법 (전화 : 01 , 화상 : 02 , 대면 : 03)
	
	public MeetingVo() {}
	public MeetingVo(int m_no, int p_code, String ptn_id, String ctn_id, Date mtdt, String mtway, String p_title) {
		super();
		this.m_no = m_no;
		this.p_code = p_code;
		this.ptn_id = ptn_id;
		this.ctn_id = ctn_id;		
		this.mtdt = mtdt;
		this.mtway = mtway;
		this.p_title = p_title;
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
	public String getMtdtS() {
		return new SimpleDateFormat("yyyy-MM-dd").format(mtdt);
	}
	public void setMtdtS(String mtdtS) {
		this.mtdtS = mtdtS;
	}
	public String getMtway() {
		return mtway;
	}
	public void setMtway(String mtway) {
		this.mtway = mtway;
	}
	
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	
	public String getCtn_id() {
		return ctn_id;
	}
	public void setCtn_id(String ctn_id) {
		this.ctn_id = ctn_id;
	}
	public String getCtn_nm() {
		return ctn_nm;
	}
	public void setCtn_nm(String ctn_nm) {
		this.ctn_nm = ctn_nm;
	}
	public String getPtn_nm() {
		return ptn_nm;
	}
	public void setPtn_nm(String ptn_nm) {
		this.ptn_nm = ptn_nm;
	}
	@Override
	public String toString() {
		return "MeetingVo [m_no=" + m_no + ", p_code=" + p_code + ", ptn_id=" + ptn_id + ", ctn_id=" + ctn_id
				+ ", p_title=" + p_title + ", ctn_nm=" + ctn_nm + ", ptn_nm=" + ptn_nm + ", mtdt=" + mtdt + ", mtdtS="
				+ mtdtS + ", mtway=" + mtway + "]";
	}

	
	
	
	
}
