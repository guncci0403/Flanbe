package kr.or.ddit.contract.service;

import java.util.Map;

import kr.or.ddit.contract.model.MeetingVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.UserVo;

public interface ContractService {
	
	// 수락 시 미팅 잡기
	int insertContract(MeetingVo meeting);
	
	//계약 & 미팅 사용자 조회 
	Map<String, Object> selectContractUser(ProjectVo projectVo);

	// 미팅 완료 상태 변경
	int updateMeetFinish(UserVo userVo);
	
	// 탈락 상태 변경 
	int updateUserDelete(UserVo userVo);
}
