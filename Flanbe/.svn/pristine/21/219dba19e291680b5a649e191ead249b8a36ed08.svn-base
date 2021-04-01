package kr.or.ddit.contract.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.contract.model.ContractVo;
import kr.or.ddit.contract.model.MeetingVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.UserVo;

@Repository("contractDao")
public class ContractDaoImpl implements ContractDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public int insertContract(MeetingVo meeting) {
		return template.insert("contract.insertContract", meeting);
	}
	
	//계약 전 미팅 사용자 조회 
	@Override
	public List<UserVo> selectContractUser(ProjectVo projectVo) {
		return template.selectList("contract.selectContractUser",projectVo);
	}
	
	// 계약 사용자 
	@Override
		public List<ContractVo> selectContractUserState(int p_code) {
		return template.selectList("contract.selectContractUserState",p_code);
	}
	
	// 미팅 완료 상태 변경
	@Override
	public int updateMeetFinish(UserVo userVo) {
		return template.update("contract.updateMeetFinish",userVo);
	}
	
	// 사용자 삭제 
	@Override
	public int updateUserDelete(UserVo userVo) {
		return template.update("contract.updateUserDelete",userVo);
	}
	// 달력리스트 클라이언트
	@Override
	public List<MeetingVo> calendarListC(String user_id) {
		return template.selectList("contract.calendarListC", user_id);
	}
	// 달력리스트 파트너스
	@Override
	public List<MeetingVo> calendarListP(String ptn_id) {
		return template.selectList("contract.calendarListP", ptn_id);
	}
	
	@Override
	public int calendarupdate(MeetingVo calendar) {
		return template.update("contract.calendarupdate", calendar);
	}

	@Override
	public MeetingVo meetingview(int m_no) {
		return template.selectOne("contract.meetingview", m_no);
	}

	// 사인 저장
	@Override
	public int registSign(UserVo user) {
		return template.update("contract.registSign", user);
	}

	@Override
	public String selectSign(String user_id) {
		return template.selectOne("contract.selectSign", user_id);
	}

	@Override
	public int registContract(ContractVo contract) {
		return template.insert("contract.registContract", contract);
	}

	@Override
	public ContractVo viewContract(ContractVo contract) {
		return template.selectOne("contract.viewContract", contract);
	}

	@Override
	public List<ContractVo> ingContractListP(String user_id) {
		return template.selectList("contract.ingContractListP", user_id);
	}

	@Override
	public List<ContractVo> completeContractListP(String user_id) {
		return template.selectList("contract.completeContractListP", user_id);
	}

	@Override
	public int updateContract(ContractVo contract) {
		return template.update("contract.updateContract", contract);
	}
	
	
}
