package kr.or.ddit.project.model;

// 작업환경
public class EnvironVo {

	private int p_code;			// 프로젝트 코드
	private String e_loc;		// 근무지역
	private String worktime;	// 근무시간
	private String equip_sup;	// 지원하는 장비
	private String meal_sup;	// 식사지원
	
	public EnvironVo() {}
	
	public EnvironVo(int p_code, String e_loc, String worktime, String equip_sup, String meal_sup) {
		super();
		this.p_code = p_code;
		this.e_loc = e_loc;
		this.worktime = worktime;
		this.equip_sup = equip_sup;
		this.meal_sup = meal_sup;
	}
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getE_loc() {
		return e_loc;
	}
	public void setE_loc(String e_loc) {
		this.e_loc = e_loc;
	}
	public String getWorktime() {
		return worktime;
	}
	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}
	public String getEquip_sup() {
		return equip_sup;
	}
	public void setEquip_sup(String equip_sup) {
		this.equip_sup = equip_sup;
	}
	public String getMeal_sup() {
		return meal_sup;
	}
	public void setMeal_sup(String meal_sup) {
		this.meal_sup = meal_sup;
	}
	@Override
	public String toString() {
		return "EnvironVo [p_code=" + p_code + ", e_loc=" + e_loc + ", worktime=" + worktime + ", equip_sup="
				+ equip_sup + ", meal_sup=" + meal_sup + "]";
	}
	
	
	
	
}
