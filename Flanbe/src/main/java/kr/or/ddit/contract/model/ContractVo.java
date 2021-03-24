package kr.or.ddit.contract.model;

import java.util.Date;

// 계약
public class ContractVo {
	
	private int p_code;			// 프로젝트 코드
	private String puser_id;	// 피계약자(파트너스)
	private String user_id;		// 계약자(클라이언트)
	private String con_cont;	// 계약내용
	private String s_no;		// 상태번호 (계약 중 : 04, 계약완료 : 05)
	private Date c_sdt;			// 시작일
	private Date c_edt;			// 종료일
	private int c_money;		// 계약금액
	private Date c_dt;			// 계약날짜
	
	public ContractVo() {}
	
	public ContractVo(int p_code, String puser_id, String user_id, String con_cont, String s_no, Date c_sdt, Date c_edt,
			int c_money, Date c_dt) {
		super();
		this.p_code = p_code;
		this.puser_id = puser_id;
		this.user_id = user_id;
		this.con_cont = con_cont;
		this.s_no = s_no;
		this.c_sdt = c_sdt;
		this.c_edt = c_edt;
		this.c_money = c_money;
		this.c_dt = c_dt;
	}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getPuser_id() {
		return puser_id;
	}
	public void setPuser_id(String puser_id) {
		this.puser_id = puser_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCon_cont() {
		return con_cont;
	}
	public void setCon_cont(String con_cont) {
		this.con_cont = con_cont;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public Date getC_sdt() {
		return c_sdt;
	}
	public void setC_sdt(Date c_sdt) {
		this.c_sdt = c_sdt;
	}
	public Date getC_edt() {
		return c_edt;
	}
	public void setC_edt(Date c_edt) {
		this.c_edt = c_edt;
	}
	public int getC_money() {
		return c_money;
	}
	public void setC_money(int c_money) {
		this.c_money = c_money;
	}
	public Date getC_dt() {
		return c_dt;
	}
	public void setC_dt(Date c_dt) {
		this.c_dt = c_dt;
	}
	@Override
	public String toString() {
		return "ContractVo [p_code=" + p_code + ", puser_id=" + puser_id + ", user_id=" + user_id + ", con_cont="
				+ con_cont + ", s_no=" + s_no + ", c_sdt=" + c_sdt + ", c_edt=" + c_edt + ", c_money=" + c_money
				+ ", c_dt=" + c_dt + "]";
	}
	
	
	
	
}
