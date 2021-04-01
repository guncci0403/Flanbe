package kr.or.ddit.user.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.model.AttachVo;
import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.SearchVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.CareerVo;
import kr.or.ddit.user.model.HistoryVo;
import kr.or.ddit.user.model.PortfolioVo;
import kr.or.ddit.user.model.USkillVo;
import kr.or.ddit.user.model.UserVo;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public UserVo loginUser(String userid) {
		return template.selectOne("users.loginUser", userid);
	}

	@Override
	public UserVo selectUser(String user_id) {
		return template.selectOne("users.selectUser", user_id);
	}

	@Override
	public int insertUser(UserVo user) {
		return template.insert("users.insertUser", user);
	}

	@Override
	public List<String> selectUserid(UserVo user) {
		return template.selectList("users.selectUserid", user);
	}

	@Override
	public int updateKey(UserVo user) {
		return template.update("users.updateKey", user);
	}

	@Override
	public int updateUAct(UserVo user) {
		return template.update("users.updateUAct", user);
	}

	@Override
	public int updatePass(UserVo user) {
		return template.update("users.updatePass", user);
	}

	@Override
	public int selectUserWhether(UserVo user) {
		return template.selectOne("users.selectUserWhether", user);
	}

	@Override
	public List<UserVo> selectPartnerList(PageVo page) {
		return template.selectList("users.selectPartnerList", page);
	}

	@Override
	public int selectPartnerCnt() {
		return template.selectOne("users.selectPartnerCnt");
	}

	@Override
	public List<UserVo> idsearchPartnerList(String id) {
		return template.selectList("users.idsearchPartnerList", id);
	}

	@Override
	public List<UserVo> tnmsearchPartnerList(String teamnm) {
		return template.selectList("users.tnmsearchPartnerList", teamnm);
	}

	@Override
	public List<UserVo> filterPartnerList(PageVo page) {
		return template.selectList("users.filterPartnerList", page);
	}

	@Override
	public int filterPartnerCnt(String value) {
		return template.selectOne("users.filterPartnerCnt", value);
	}

	@Override
	public List<UserVo> skilFilterList(SearchVo search) {
		return template.selectList("users.skilFilterList", search);
	}

	@Override
	public int skilFilterListCnt(SearchVo search) {
		return template.selectOne("users.skilFilterListCnt", search);
	}

	@Override
	public String userPurpose(String user_id) {
		return template.selectOne("users.userPurpose", user_id);
	}

	@Override
	public int insertHistory(String user_id) {
		return template.insert("users.insertHistory", user_id);
	}

	/**
	 * 건영형
	 */

///////////////////////////////////////////////////////////////////////////
	@Override
	public int updateIntro(UserVo userVo) {
		return template.update("profile.updateIntro", userVo);
	}

	@Override
	public int updateInfo(UserVo userVo) {
		return template.update("profile.updateInfo", userVo);
	}

	@Override
	public int changePass(UserVo userVo) {
		return template.update("profile.changePass", userVo);
	}

	@Override
	public int deleteUser(String user_id) {
		return template.update("profile.deleteUser", user_id);
	}

///////////////////////////////////////////////////////////////////////////
	@Override
	public int countJoinProject(String user_id) {
		return template.selectOne("profile.countJoinProject", user_id);
	}

	@Override
	public int sumMoney(String user_id) {
		return template.selectOne("profile.sumMoney", user_id);
	}

	@Override
	public HistoryVo selectProjectHistory(String user_id) {
		return template.selectOne("profile.selectProjectHistory", user_id);
	}

	@Override
	public int avgMoney(String user_id) {
		return template.selectOne("profile.avgMoney", user_id);
	}

	@Override
	public int avgPeriod(String user_id) {
		return template.selectOne("profile.avgPeriod", user_id);
	}

	@Override
	public List<ProjectVo> joinProjectPaging(PageVo page) {
		return template.selectList("profile.joinProjectPaging", page);
	}

	@Override
	public int joinProjectCnt(String user_id) {
		return template.selectOne("profile.joinProjectCnt", user_id);
	}

	@Override
	public List<CareerVo> selectCareerList(String user_id) {
		return template.selectList("profile.selectCareerList", user_id);
	}

	@Override
	public int insertCareer(CareerVo careerVo) {
		return template.insert("profile.insertCareer", careerVo);
	}

	@Override
	public int deleteCareer(int c_no) {
		return template.delete("profile.deleteCareer", c_no);
	}

	@Override
	public int updateCareer(CareerVo careerVo) {
		return template.update("profile.updateCareer", careerVo);
	}

	@Override
	public String selectCareerDate(String user_id) {
		return template.selectOne("profile.selectCareerDate", user_id);
	}

	@Override
	public List<USkillVo> selectSkillList(String user_id) {
		return template.selectList("profile.selectSkillList", user_id);

	}

	@Override
	public int insertSkill(USkillVo uskillVo) {
		return template.insert("profile.insertSkill", uskillVo);
	}

	@Override
	public int deleteSkill(int us_no) {
		return template.delete("profile.deleteSkill", us_no);
	}

	@Override
	public int updateSkill(USkillVo uskillVo) {
		return template.update("profile.updateSkill", uskillVo);
	}
	
	@Override
	public List<PortfolioVo> selectReprePopol(String user_id) {
		return template.selectList("profile.selectReprePopol", user_id);
	}


	@Override
	public List<PortfolioVo> selectPopol(String user_id) {
		return template.selectList("profile.selectPopol", user_id);
	}

	@Override
	public int insertPopol(PortfolioVo portfolioVo) {
		return template.insert("profile.insertPopol", portfolioVo);
	}

	@Override
	public int maxnumFile() {
		return template.selectOne("profile.maxnumFile");
	}
	
	@Override
	public List<AttachVo> selectfiles(int po_no) {
		return template.selectList("profile.selectfiles",po_no);
	}
	
	@Override
	public int insertfiles(AttachVo attachVo) {
		return template.insert("profile.insertfiles", attachVo);
	}
	
	@Override
	public int updatefiles(AttachVo attachVo) {
		return template.update("profile.updatefiles", attachVo);
	}
	
	@Override
	public int deletefiles(int a_no) {
		return template.delete("profile.deletefiles",a_no);
	}

	@Override
	public PortfolioVo getPopolList(int po_no) {
		return template.selectOne("profile.getPopolList", po_no);
	}
	
	@Override
	public int representNPopol(String user_id) {
		return template.update("profile.representNPopol", user_id);
	}
	
	@Override
	public int representYPopol(PortfolioVo portfolioVo) {
		return template.update("profile.representYPopol", portfolioVo);
	}
	

	@Override
	public int deletePopol(int po_no) {
		return template.delete("profile.deletePopol", po_no);
	}

	@Override
	public int modifyPopol(PortfolioVo portfolioVo) {
		return template.update("profile.modifyPopol", portfolioVo);
	}

	@Override
	public List<PortfolioVo> selectFieldFilter(SearchVo searchVo) {
		return template.selectList("profile.selectFieldFilter",searchVo);
	}

	@Override
	public AttachVo getfiles(int a_no) {
		return template.selectOne("profile.getfiles", a_no);
	}


}
