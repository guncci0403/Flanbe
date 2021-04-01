package kr.or.ddit.contract.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.contract.model.ContractVo;
import kr.or.ddit.contract.model.MeetingVo;
import kr.or.ddit.contract.repository.ContractDao;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.repository.ProjectDao;
import kr.or.ddit.user.model.UserVo;

@Service("contractService")
public class ContractServiceImpl implements ContractService {

	@Resource(name="contractDao")
	private ContractDao contractDao;

	@Resource(name="projectDao")
	private ProjectDao projectDao;


	@Override
	public int insertContract(MeetingVo meeting) {
		return contractDao.insertContract(meeting);
	}

	//계약 & 미팅 사용자 조회 
	@Override
	public Map<String, Object> selectContractUser(ProjectVo projectVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<UserVo> userList = contractDao.selectContractUser(projectVo);
		
		// 계약된 지원자 보기
		List<ContractVo> contractList = contractDao.selectContractUserState(projectVo.getP_code());
		System.out.println("결과 : " +userList.size());
		UserVo userVo = new UserVo();
		if(userList.size() == 0) {
			ProjectVo pVo = projectDao.viewProject(projectVo.getP_code());
			map.put("pVo", pVo);	// userVo 안에 프로젝트 관련 필드 
		}else {
			for (int i = 0; i < userList.size(); i++) {
				userVo.setP_code(userList.get(i).getP_code());
				userVo.setP_cont(userList.get(i).getP_cont());
				userVo.setDeadline(userList.get(i).getDeadline());
				userVo.setP_field(userList.get(i).getP_field());
				userVo.setP_money(userList.get(i).getP_money());
				userVo.setP_title(userList.get(i).getP_title());
				map.put("pVo", userVo);	// userVo 안에 프로젝트 관련 필드 
			}
		}
		map.put("userList", userList);
		map.put("contractList",contractList);
		return map;
	}

	
	// 미팅 완료 상태 변경
	@Override
	public int updateMeetFinish(UserVo userVo) {
		return contractDao.updateMeetFinish(userVo);
	}

	// 탈락 상태 변경 
	@Override
	public int updateUserDelete(UserVo userVo) {
		return contractDao.updateUserDelete(userVo);
	}
	// 달력리스트 클라이언트
	@Override
	public List<MeetingVo> calendarListC(String user_id) {
		return contractDao.calendarListC(user_id);
	}
	// 달력 리스트 파트너스
	@Override
	public List<MeetingVo> calendarListP(String ptn_id) {
		return contractDao.calendarListP(ptn_id);
	}
	
	@Override
	public int calendarupdate(MeetingVo calendar) {
		return contractDao.calendarupdate(calendar);
	}

	@Override
	public MeetingVo meetingview(int m_no) {
		return contractDao.meetingview(m_no);
	}

	@Override
	public int registSign(UserVo user) {
		return contractDao.registSign(user);
	}

	@Override
	public String selectSign(String user_id) {
		return contractDao.selectSign(user_id);
	}

	@Override
	public int registContract(ContractVo contract) {
		return contractDao.registContract(contract);
	}

	@Override
	public ContractVo viewContract(ContractVo contract) {
		return contractDao.viewContract(contract);
	}

	@Override
	public List<ContractVo> ingContractListP(String user_id) {
		return contractDao.ingContractListP(user_id);
	}

	@Override
	public List<ContractVo> completeContractListP(String user_id) {
		return contractDao.completeContractListP(user_id);
	}

	@Override
	public int updateContract(ContractVo contract) {
		return contractDao.updateContract(contract);
	}
}
