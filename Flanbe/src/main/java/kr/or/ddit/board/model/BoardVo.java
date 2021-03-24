package kr.or.ddit.board.model;


// 게시판
public class BoardVo {

	private int b_no;		// 게시판 번호
	private String b_nm;	// 게시판 이름
	
	public BoardVo() {}
	
	public BoardVo(int b_no, String b_nm) {
		super();
		this.b_no = b_no;
		this.b_nm = b_nm;
	}
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_nm() {
		return b_nm;
	}
	public void setB_nm(String b_nm) {
		this.b_nm = b_nm;
	}
	@Override
	public String toString() {
		return "BoardVo [b_no=" + b_no + ", b_nm=" + b_nm + "]";
	}
	
	
}
