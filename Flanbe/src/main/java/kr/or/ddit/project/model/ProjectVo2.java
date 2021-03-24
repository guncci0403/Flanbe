package kr.or.ddit.project.model;

import java.util.Date;

public class ProjectVo2 {

	private int p_code;
	private String p_title;
	private String user_id;
	private int s_no;
	private String p_cont;
	private int p_field;
	private int p_money;
	private Date deadline;
	private int period;
	private Date p_sdt;
	private int progress;
	private Date p_regdt;
	private int average ; 
	private String e_cont; 
	private int pro ; 
	private int sat ; 
	private int comm ; 
	private int ontime ; 
	private int activity ; 
	
	
	
	
	
	
	
	public ProjectVo2() {}







	public ProjectVo2(int p_code, String p_title, String user_id, int s_no, String p_cont, int p_field, int p_money,
			Date deadline, int period, Date p_sdt, int progress, Date p_regdt, int average, String e_cont, int pro,
			int sat, int comm, int ontime, int activity) {
		super();
		this.p_code = p_code;
		this.p_title = p_title;
		this.user_id = user_id;
		this.s_no = s_no;
		this.p_cont = p_cont;
		this.p_field = p_field;
		this.p_money = p_money;
		this.deadline = deadline;
		this.period = period;
		this.p_sdt = p_sdt;
		this.progress = progress;
		this.p_regdt = p_regdt;
		this.average = average;
		this.e_cont = e_cont;
		this.pro = pro;
		this.sat = sat;
		this.comm = comm;
		this.ontime = ontime;
		this.activity = activity;
	}







	public int getP_code() {
		return p_code;
	}







	public void setP_code(int p_code) {
		this.p_code = p_code;
	}







	public String getP_title() {
		return p_title;
	}







	public void setP_title(String p_title) {
		this.p_title = p_title;
	}







	public String getUser_id() {
		return user_id;
	}







	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}







	public int getS_no() {
		return s_no;
	}







	public void setS_no(int s_no) {
		this.s_no = s_no;
	}







	public String getP_cont() {
		return p_cont;
	}







	public void setP_cont(String p_cont) {
		this.p_cont = p_cont;
	}







	public int getP_field() {
		return p_field;
	}







	public void setP_field(int p_field) {
		this.p_field = p_field;
	}







	public int getP_money() {
		return p_money;
	}







	public void setP_money(int p_money) {
		this.p_money = p_money;
	}







	public Date getDeadline() {
		return deadline;
	}







	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}







	public int getPeriod() {
		return period;
	}







	public void setPeriod(int period) {
		this.period = period;
	}







	public Date getP_sdt() {
		return p_sdt;
	}







	public void setP_sdt(Date p_sdt) {
		this.p_sdt = p_sdt;
	}







	public int getProgress() {
		return progress;
	}







	public void setProgress(int progress) {
		this.progress = progress;
	}







	public Date getP_regdt() {
		return p_regdt;
	}







	public void setP_regdt(Date p_regdt) {
		this.p_regdt = p_regdt;
	}







	public int getAverage() {
		return average;
	}







	public void setAverage(int average) {
		this.average = average;
	}







	public String getE_cont() {
		return e_cont;
	}







	public void setE_cont(String e_cont) {
		this.e_cont = e_cont;
	}







	public int getPro() {
		return pro;
	}







	public void setPro(int pro) {
		this.pro = pro;
	}







	public int getSat() {
		return sat;
	}







	public void setSat(int sat) {
		this.sat = sat;
	}







	public int getComm() {
		return comm;
	}







	public void setComm(int comm) {
		this.comm = comm;
	}







	public int getOntime() {
		return ontime;
	}







	public void setOntime(int ontime) {
		this.ontime = ontime;
	}







	public int getActivity() {
		return activity;
	}







	public void setActivity(int activity) {
		this.activity = activity;
	}







	@Override
	public String toString() {
		return "ProjectVo2 [p_code=" + p_code + ", p_title=" + p_title + ", user_id=" + user_id + ", s_no=" + s_no
				+ ", p_cont=" + p_cont + ", p_field=" + p_field + ", p_money=" + p_money + ", deadline=" + deadline
				+ ", period=" + period + ", p_sdt=" + p_sdt + ", progress=" + progress + ", p_regdt=" + p_regdt
				+ ", average=" + average + ", e_cont=" + e_cont + ", pro=" + pro + ", sat=" + sat + ", comm=" + comm
				+ ", ontime=" + ontime + ", activity=" + activity + "]";
	}
	
	
	
	
	
}
