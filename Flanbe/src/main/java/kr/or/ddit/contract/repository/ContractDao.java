package kr.or.ddit.contract.repository;

import java.util.List;

import kr.or.ddit.contract.model.ContractVo;
import kr.or.ddit.contract.model.MeetingVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.UserVo;

public interface ContractDao {

	// 수락 시 미팅 잡기
	int insertContract(MeetingVo meeting);
	

	//계약 전 미팅 목록 조회
	public List<UserVo> selectContractUser(ProjectVo projectVo);
	
	//계약한 사용자 조회 
	public List<ContractVo> selectContractUserState(int p_code);
	
	// 미팅 완료 상태 변경
	int updateMeetFinish(UserVo userVo);
	
	// 탈락 상태 변경 
	int updateUserDelete(UserVo userVo);
	
	
}
