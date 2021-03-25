package kr.or.ddit.user.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

// 포트폴리오
public class PortfolioVo {

	private int po_no;			// 포트폴리오 번호(시퀀스)
	private String user_id;		// 사용자 아이디
	private String po_title;	// 포트폴리오 제목
	private String po_repre;	// 대표 구분 (대표 : Y, 대표x : N)
	private String po_field;	// 개발분야 (웹 : 01, 애플리케이션 : 02, 퍼블리싱 : 03, 게임 : 04, 기타 : 05)
	private String po_cont;		// 포트폴리오 설명
	@DateTimeFormat(pattern="yyyy-MM")
	private Date po_sdt;		// 시작일
	@DateTimeFormat(pattern="yyyy-MM")
	private Date po_edt;		// 종료일
	private String po_skil;		// 관련기술
	private String po_image;    // 대표이미지
	
	public PortfolioVo() {}
	
	
	public PortfolioVo(int po_no, String user_id, String po_title, String po_repre, String po_field, String po_cont,
			Date po_sdt, Date po_edt, String po_skil, String po_image) {
		super();
		this.po_no = po_no;
		this.user_id = user_id;
		this.po_title = po_title;
		this.po_repre = po_repre;
		this.po_field = po_field;
		this.po_cont = po_cont;
		this.po_sdt = po_sdt;
		this.po_edt = po_edt;
		this.po_skil = po_skil;
		this.po_image = po_image;
	}

	public int getPo_no() {
		return po_no;
	}
	public void setPo_no(int po_no) {
		this.po_no = po_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPo_title() {
		return po_title;
	}
	public void setPo_title(String po_title) {
		this.po_title = po_title;
	}
	public String getPo_repre() {
		return po_repre;
	}
	public void setPo_repre(String po_repre) {
		this.po_repre = po_repre;
	}
	public String getPo_field() {
		return po_field;
	}
	public void setPo_field(String po_field) {
		this.po_field = po_field;
	}
	public String getPo_cont() {
		return po_cont;
	}
	public void setPo_cont(String po_cont) {
		this.po_cont = po_cont;
	}
	public Date getPo_sdt() {
		return po_sdt;
	}
	public void setPo_sdt(Date po_sdt) {
		this.po_sdt = po_sdt;
	}
	public Date getPo_edt() {
		return po_edt;
	}
	public void setPo_edt(Date po_edt) {
		this.po_edt = po_edt;
	}
	public String getPo_skil() {
		return po_skil;
	}
	public void setPo_skil(String po_skil) {
		this.po_skil = po_skil;
	}
	public String getPo_image() {
		return po_image;
	}
	public void setPo_image(String po_image) {
		this.po_image = po_image;
	}


	@Override
	public String toString() {
		return "PortfolioVo [po_no=" + po_no + ", user_id=" + user_id + ", po_title=" + po_title + ", po_repre="
				+ po_repre + ", po_field=" + po_field + ", po_cont=" + po_cont + ", po_sdt=" + po_sdt + ", po_edt="
				+ po_edt + ", po_skil=" + po_skil + "]";
	}
	
	
	
}
