package kr.or.ddit.contract.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.contract.model.ContractVo;
import kr.or.ddit.contract.model.MeetingVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.UserVo;

public interface ContractService {

	// 수락 시 미팅 잡기
	int insertContract(MeetingVo meeting);

	// 계약 & 미팅 사용자 조회
	Map<String, Object> selectContractUser(ProjectVo projectVo);

	// 미팅 완료 상태 변경
	int updateMeetFinish(UserVo userVo);

	// 탈락 상태 변경
	int updateUserDelete(UserVo userVo);

	// 달력리스트 클라이언트
	List<MeetingVo> calendarListC(String user_id);

	// 달력 리스트 파트너스
	List<MeetingVo> calendarListP(String ptn_id);
	
	int calendarupdate(MeetingVo calendar);

	MeetingVo meetingview(int m_no);
	
	// 사인 저장
	int registSign(UserVo user);
	
	// 사인 경로 불러오기
	String selectSign(String user_id);
	
	// 계약서 등록
	int registContract(ContractVo contract);
	
	// 계약서 조회
	ContractVo viewContract(ContractVo contract);
	
	// 진행 중인 계약 조회 (파트너스)
	List<ContractVo> ingContractListP(String user_id);
	
	// 완료된 계약 조회 (파트너스)
	List<ContractVo> completeContractListP(String user_id);
	
	// 계약 상태 업데이트
	int updateContract(ContractVo contract);
}
