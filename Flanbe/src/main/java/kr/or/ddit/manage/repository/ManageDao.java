package kr.or.ddit.manage.repository;

import java.util.List;

import kr.or.ddit.contract.model.ContractVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.UserVo;

public interface ManageDao {

	// 클라이언트, 파트너스 리스트 조회
	List<UserVo> selectUserList(String purpose);
	
	// 검수 중인 프로젝트 조회
	List<ProjectVo> requestProjectList();
	
	// 프로젝트 승인
	int approvalProject(int p_code);
	
	// 프로젝트 거부
	int refusalProject(int p_code);
	
	// 승인 요청 받은 계약리스트
	List<ContractVo> requestContractList();
	
	// 계약 완료 후 프로젝트 상태 변경
	int updateProjectState(int p_code);
	
	// 계약 완료 후 파트너스 상태 변경
	int updatePattendState(ContractVo contract);
}
