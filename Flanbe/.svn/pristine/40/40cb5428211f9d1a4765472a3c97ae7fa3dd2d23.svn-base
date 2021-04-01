package kr.or.ddit.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.AttachVo;
import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.SearchVo;
import kr.or.ddit.user.model.CareerVo;
import kr.or.ddit.user.model.HistoryVo;
import kr.or.ddit.user.model.PortfolioVo;
import kr.or.ddit.user.model.USkillVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.repository.UserDao;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name = "userDao")
	private UserDao userDao;

	@Override
	public UserVo loginUser(String userid) {
		return userDao.loginUser(userid);
	}

	@Override
	public UserVo selectUser(String user_id) {
		return userDao.selectUser(user_id);
	}

	@Override
	public int insertUser(UserVo user) {
		return userDao.insertUser(user);
	}

	@Override
	public List<String> selectUserid(UserVo user) {
		return userDao.selectUserid(user);
	}

	@Override
	public int updateUAct(UserVo user) {
		return userDao.updateUAct(user);
	}

	@Override
	public int selectUserWhether(UserVo user) {
		return userDao.selectUserWhether(user);
	}

	@Override
	public Map<String, Object> selectPartnerList(PageVo page) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pageVo", page);
		map.put("partnerList", userDao.selectPartnerList(page));
		map.put("pagination", (int) Math.ceil((double) userDao.selectPartnerCnt() / page.getPageSize()));

		return map;
	}

	@Override
	public List<UserVo> idsearchPartnerList(String id) {
		return userDao.idsearchPartnerList(id);
	}

	@Override
	public List<UserVo> tnmsearchPartnerList(String teamnm) {
		return userDao.tnmsearchPartnerList(teamnm);
	}

	@Override
	public Map<String, Object> filterPartnerList(PageVo page) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pageVo", page);
		map.put("partnerList", userDao.filterPartnerList(page));
		map.put("pagination",
				(int) Math.ceil((double) userDao.filterPartnerCnt(page.getS_value()) / page.getPageSize()));

		return map;
	}

	@Override
	public Map<String, Object> skilFilterList(SearchVo search) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pageVo", search);
		map.put("partnerList", userDao.skilFilterList(search));
		map.put("pagination", (int) Math.ceil((double) userDao.skilFilterListCnt(search) / search.getPageSize()));

		return map;
	}

	@Override
	public String userPurpose(String user_id) {
		return userDao.userPurpose(user_id);
	}

	@Override
	public int insertHistory(String user_id) {
		return userDao.insertHistory(user_id);
	}

	/**
	 * 건영형
	 */
//////////////////////////////////////////////////////////////////////////
	@Override
	public int updateIntro(UserVo userVo) {
		return userDao.updateIntro(userVo);
	}

	@Override
	public int updateInfo(UserVo userVo) {
		return userDao.updateInfo(userVo);
	}

	@Override
	public int changePass(UserVo userVo) {
		return userDao.changePass(userVo);
	}

	@Override
	public int deleteUser(String user_id) {
		return userDao.deleteUser(user_id);
	}

//////////////////////////////////////////////////////////////////////////////
	@Override
	public int countJoinProject(String user_id) {
		return userDao.countJoinProject(user_id);
	}

	@Override
	public int sumMoney(String user_id) {
		return userDao.sumMoney(user_id);
	}

	@Override
	public HistoryVo selectProjectHistory(String user_id) {
		return userDao.selectProjectHistory(user_id);
	}

	@Override
	public int avgMoney(String user_id) {
		return userDao.avgMoney(user_id);
	}

	@Override
	public int avgPeriod(String user_id) {
		return userDao.avgPeriod(user_id);
	}

	@Override
	public Map<String, Object> joinProjectPaging(PageVo page) {
		Map<String, Object> map = new HashMap<>();
		map.put("projectList", userDao.joinProjectPaging(page));
		map.put("cnt", userDao.joinProjectCnt(page.getUser_id()));

		return map;
	}

	@Override
	public List<CareerVo> selectCareerList(String user_id) {
		return userDao.selectCareerList(user_id);
	}

	@Override
	public int insertCareer(CareerVo careerVo) {
		return userDao.insertCareer(careerVo);
	}

	@Override
	public int deleteCareer(int c_no) {
		return userDao.deleteCareer(c_no);
	}

	@Override
	public int updateCareer(CareerVo careerVo) {
		return userDao.updateCareer(careerVo);
	}
	
	@Override
	public String selectCareerDate(String user_id) {
		return userDao.selectCareerDate(user_id);
	}

	@Override
	public List<USkillVo> selectSkillList(String user_id) {
		return userDao.selectSkillList(user_id);
	}

	@Override
	public int insertSkill(USkillVo uskillVo) {
		return userDao.insertSkill(uskillVo);
	}

	@Override
	public int deleteSkill(int us_no) {
		return userDao.deleteSkill(us_no);
	}

	@Override
	public int updateSkill(USkillVo uskillVo) {
		return userDao.updateSkill(uskillVo);
	}
	
	@Override
	public List<PortfolioVo> selectReprePopol(String user_id) {
		return userDao.selectReprePopol(user_id);
	}

	@Override
	public List<PortfolioVo> selectPopol(String user_id) {
		return userDao.selectPopol(user_id);
	}

	@Override
	public int insertPopol(PortfolioVo portfolioVo) {
		return userDao.insertPopol(portfolioVo);
	}

	@Override
	public int maxnumFile() {
		return userDao.maxnumFile();
	}

	@Override
	public AttachVo getfiles(int a_no) {
		return userDao.getfiles(a_no);
	}

	@Override
	public List<AttachVo> selectfiles(int po_no) {
		return userDao.selectfiles(po_no);
	}
	
	@Override
	public int insertfiles(AttachVo attachVo) {
		return userDao.insertfiles(attachVo);
	}
	
	@Override
	public int updatefiles(AttachVo attachVo) {
		return userDao.updatefiles(attachVo);
	}

	@Override
	public int deletefiles(int a_no) {
		return userDao.deletefiles(a_no);
	}

	@Override
	public PortfolioVo getPopolList(int po_no) {
		return userDao.getPopolList(po_no);
	}
	
	@Override
	public int representNPopol(String user_id) {
		return userDao.representNPopol(user_id);
	}
	
	@Override
	public int representYPopol(PortfolioVo portfolioVo) {
		return userDao.representYPopol(portfolioVo);
	}
	
	
	@Override
	public int deletePopol(int po_no) {
		return userDao.deletePopol(po_no);
	}

	@Override
	public int modifyPopol(PortfolioVo portfolioVo) {
		return userDao.modifyPopol(portfolioVo);
	}

	@Override
	public List<PortfolioVo> selectFieldFilter(SearchVo searchVo) {
		return userDao.selectFieldFilter(searchVo);
	}


}
