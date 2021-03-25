package kr.or.ddit.user.model;

import java.util.Date;

// 쪽지
public class MessageVo {

	private int m_no;			// 쪽지번호
	private String m_cont;		// 내용
	private Date m_regdt;		// 작성일시
	private String m_state;		// 읽음상태 ( 읽음 : Y , 읽지않음 : N )
	private String r_id;		// 받은사람
	private String s_id;		// 보낸사람
	
	public MessageVo() {}
	/** 
	 * 수진
	 * @param m_cont
	 * @param r_id
	 */
	public MessageVo(String m_cont, String r_id, String s_id) {
		this.m_cont = m_cont;
		this.r_id = r_id;
		this.s_id = s_id;
	}
	
	
	public MessageVo(int m_no, String m_cont, Date m_regdt, String m_state, String r_id, String s_id) {
		this.m_no = m_no;
		this.m_cont = m_cont;
		this.m_regdt = m_regdt;
		this.m_state = m_state;
		this.r_id = r_id;
		this.s_id = s_id;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_cont() {
		return m_cont;
	}

	public void setM_cont(String m_cont) {
		this.m_cont = m_cont;
	}

	public Date getM_regdt() {
		return m_regdt;
	}

	public void setM_regdt(Date m_regdt) {
		this.m_regdt = m_regdt;
	}

	public String getM_state() {
		return m_state;
	}

	public void setM_state(String m_state) {
		this.m_state = m_state;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	@Override
	public String toString() {
		return "MessageVo [m_no=" + m_no + ", m_cont=" + m_cont + ", m_regdt=" + m_regdt + ", m_state=" + m_state
				+ ", r_id=" + r_id + ", s_id=" + s_id + "]";
	}
	
	
	
}
