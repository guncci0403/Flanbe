package kr.or.ddit.evaluation.model;

// 평가
public class EvaluationVo {
	
	private int rnum; 
	private int p_code;			// 프로젝트 코드
	private String user_id;		// 사용자아이디
	private String p_title;
	private int pro;			// 전문성
	private int sat;			// 만족도
	private int comm;			// 의사소통
	private int ontime;			// 일정준수
	private int activity;		// 적극성
	private double average;		// 평균
	private String e_cont;		// 평가내용
	
	public EvaluationVo() {}

	public EvaluationVo(int rnum, int p_code, String user_id, String p_title, int pro, int sat, int comm, int ontime,
			int activity, double average, String e_cont) {
		super();
		this.rnum = rnum;
		this.p_code = p_code;
		this.user_id = user_id;
		this.p_title = p_title;
		this.pro = pro;
		this.sat = sat;
		this.comm = comm;
		this.ontime = ontime;
		this.activity = activity;
		this.average = average;
		this.e_cont = e_cont;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
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

	public double getAverage() {
		return average;
	}

	public void setAverage(double average) {
		this.average = average;
	}

	public String getE_cont() {
		return e_cont;
	}

	public void setE_cont(String e_cont) {
		this.e_cont = e_cont;
	}

	@Override
	public String toString() {
		return "EvaluationVo [rnum=" + rnum + ", p_code=" + p_code + ", user_id=" + user_id + ", p_title=" + p_title
				+ ", pro=" + pro + ", sat=" + sat + ", comm=" + comm + ", ontime=" + ontime + ", activity=" + activity
				+ ", average=" + average + ", e_cont=" + e_cont + "]";
	}
	
	

	
	
	
	
	
}