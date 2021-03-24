package kr.or.ddit.user.model;

// 경력
public class CareerVo {

	private int c_no;			// 번호(시퀀스)
	private String user_id;		// 사용자 아이디
	private String c_nm;		// 회사명
	private String c_dept;		// 근무부서
	private String c_position;	// 직위
	private String c_sdt;		// 근무시작일
	private String c_edt;		// 근무종료일
	private String c_cont;		// 설명
	
	public CareerVo() {}
	
	public CareerVo(int c_no, String user_id, String c_nm, String c_dept, String c_position, String c_sdt, String c_edt,
			String c_cont) {
		super();
		this.c_no = c_no;
		this.user_id = user_id;
		this.c_nm = c_nm;
		this.c_dept = c_dept;
		this.c_position = c_position;
		this.c_sdt = c_sdt;
		this.c_edt = c_edt;
		this.c_cont = c_cont;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getC_nm() {
		return c_nm;
	}
	public void setC_nm(String c_nm) {
		this.c_nm = c_nm;
	}
	public String getC_dept() {
		return c_dept;
	}
	public void setC_dept(String c_dept) {
		this.c_dept = c_dept;
	}
	public String getC_position() {
		return c_position;
	}
	public void setC_position(String c_position) {
		this.c_position = c_position;
	}
	public String getC_sdt() {
		return c_sdt;
	}
	public void setC_sdt(String c_sdt) {
		this.c_sdt = c_sdt;
	}
	public String getC_edt() {
		return c_edt;
	}
	public void setC_edt(String c_edt) {
		this.c_edt = c_edt;
	}
	public String getC_cont() {
		return c_cont;
	}
	public void setC_cont(String c_cont) {
		this.c_cont = c_cont;
	}
	@Override
	public String toString() {
		return "CareerVo [c_no=" + c_no + ", user_id=" + user_id + ", c_nm=" + c_nm + ", c_dept=" + c_dept
				+ ", c_position=" + c_position + ", c_sdt=" + c_sdt + ", c_edt=" + c_edt + ", c_cont=" + c_cont + "]";
	}
	
	
}
