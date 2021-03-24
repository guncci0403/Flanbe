package kr.or.ddit.common.model;

public class SearchVo {
	
	private int page;
	private int pageSize;
	private String value1;
	private String value2;
	private String value3;
	private String value4;
	private String value5;
	private int valueSize;
	private String user_id;
	
	public SearchVo() {}
	
	public SearchVo(int page, int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}
	
	public SearchVo(int page, int pageSize, int valueSize) {
		this.page = page;
		this.pageSize = pageSize;
		this.valueSize = valueSize;
	}
	public SearchVo(String user_id, int valueSize) {
		this.user_id = user_id;
		this.valueSize = valueSize;
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
	public String getValue1() {
		return value1;
	}
	public void setValue1(String value1) {
		this.value1 = value1;
	}
	public String getValue2() {
		return value2;
	}
	public void setValue2(String value2) {
		this.value2 = value2;
	}
	public String getValue3() {
		return value3;
	}
	public void setValue3(String value3) {
		this.value3 = value3;
	}
	public String getValue4() {
		return value4;
	}
	public void setValue4(String value4) {
		this.value4 = value4;
	}
	public String getValue5() {
		return value5;
	}
	public void setValue5(String value5) {
		this.value5 = value5;
	}
	public int getValueSize() {
		return valueSize;
	}
	public void setValueSize(int valueSize) {
		this.valueSize = valueSize;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "SerachVo [page=" + page + ", pageSize=" + pageSize + ", value1=" + value1 + ", value2=" + value2
				+ ", value3=" + value3 + ", value4=" + value4 + ", valueSize=" + valueSize +"]";
	}
}
