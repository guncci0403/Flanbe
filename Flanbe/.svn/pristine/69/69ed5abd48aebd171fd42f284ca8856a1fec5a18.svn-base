package kr.or.ddit.board.model;

import java.util.Date;

// 게시글
public class PostVo {
	
	private int rn;
	private int level;
	private int p_no;			// 게시글 번호(시퀀스)
	private String user_id;		// 작성자
	private int b_no;			// 게시판 번호 (1 : 공지사항, 2 : 자주묻는 게시판, 3 : 건의사항)
	private String p_title;		// 제목
	private String p_cont;		// 내용
	private Date p_regdt;		// 작성일자
	private String p_act;		// 삭제 여부 (Y: 삭제, N : 삭제x)
	private int p_gno;			// 그룹번호
	private int p_parent;		// 상위 게시글 번호
	private int p_view;			// 조회수
	
	public PostVo() {}
	
	public PostVo(int p_no, String user_id, int b_no, String p_title, String p_cont, Date p_regdt, String p_act,
			int p_gno, int p_parent, int p_view) {
		super();
		this.p_no = p_no;
		this.user_id = user_id;
		this.b_no = b_no;
		this.p_title = p_title;
		this.p_cont = p_cont;
		this.p_regdt = p_regdt;
		this.p_act = p_act;
		this.p_gno = p_gno;
		this.p_parent = p_parent;
		this.p_view = p_view;
	}

	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
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
	public Date getP_regdt() {
		return p_regdt;
	}
	public void setP_regdt(Date p_regdt) {
		this.p_regdt = p_regdt;
	}
	public String getP_act() {
		return p_act;
	}
	public void setP_act(String p_act) {
		this.p_act = p_act;
	}
	public int getP_gno() {
		return p_gno;
	}
	public void setP_gno(int p_gno) {
		this.p_gno = p_gno;
	}
	public int getP_parent() {
		return p_parent;
	}
	public void setP_parent(int p_parent) {
		this.p_parent = p_parent;
	}
	public int getP_view() {
		return p_view;
	}
	public void setP_view(int p_view) {
		this.p_view = p_view;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "PostVo [p_no=" + p_no + ", user_id=" + user_id + ", b_no=" + b_no + ", p_title=" + p_title + ", p_cont="
				+ p_cont + ", p_regdt=" + p_regdt + ", p_act=" + p_act + ", p_gno=" + p_gno + ", p_parent=" + p_parent
				+ ", p_view=" + p_view + "]";
	}
	
	
	
	
}
