package kr.or.ddit.common.model;


public class PageVo {
	private int page;
	private int pageSize;
	private int b_no;
	private int p_code;
	private String s_value;
	private String user_id;
	private String start;
	private String end;
	private String p_field;
	

	public PageVo() {}

	public PageVo(int page, int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}

	public PageVo(int page, int pageSize, int b_no) {
		this.page = page;
		this.pageSize = pageSize;
		this.b_no = b_no;
	}

	public PageVo(int page, int pageSize, String s_value) {
		this.page = page;
		this.pageSize = pageSize;
		this.s_value = s_value;
	}
	
	public PageVo(int page, int pageSize,String start, String  end) {
		this.page = page;
		this.pageSize = pageSize;
		this.start = start;
		this.end = end;
	}

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

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getS_value() {
		return s_value;
	}

	public void setS_value(String s_value) {
		this.s_value = s_value;
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

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getP_field() {
		return p_field;
	}

	public void setP_field(String p_field) {
		this.p_field = p_field;
	}
	

	@Override
	public String toString() {
		return "PageVo [page=" + page + ", pageSize=" + pageSize + ", b_no=" + b_no + ", p_code=" + p_code
				+ ", s_value=" + s_value + ", user_id=" + user_id + ", start=" + start + ", end=" + end + ", p_field="
				+ p_field + "]";
	}

}
