package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.SearchVo;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.project.model.PSkillVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.MessageVo;

public interface ProjectService {
	
	List<ProjectVo> selectAllProject(); // 프로젝트 목록

	int insertProject(ProjectVo vo); // 프로젝트 등록(클라이언트)

	int insertPskill(String ps_no); // 관련기술 등록(클라이언트)

	ProjectVo viewProject(int p_code); // 프로젝트 상세조회

	Map<String, Object> PagingProject(PageVo vo);

	int applicantCnt(int p_code);

	int insertLike(PAttendVo vo); // 프로젝트 관심등록

	String selectPstate(PAttendVo pattend); // 프로젝트 참가 조회

	int deletelike(PAttendVo pattend); // 관심 프로젝트 삭제

	int insertApply(PAttendVo vo); // 프로젝트 지원등록

	int updateApply(PAttendVo pattend); // 프로젝트 지원하기

	Map<String, Object> searchProjectid(PageVo vo);

	Map<String, Object> searchProjectnm(PageVo vo);

	List<ProjectVo> selectLike(String user_id); // 관심프로젝트 리스트

	List<ProjectVo> applyList(String user_id); // 지원내역 리스트

	List<ProjectVo> ingProjectListC(String user_id); // 진행중인 프로젝트 리스트 클라이언트

	List<ProjectVo> ingProjectListP(String user_id); // 진행중인 프로젝트 리스트 파트너스

	List<ProjectVo> finishProjectListC(String user_id); // 완료 프로젝트 리스트 클라이언트

	List<ProjectVo> finishProjectListP(String user_id); // 완료 프로젝트 리스트 파트너스

	List<ProjectVo> beforeProject(String user_id); // 검수중 프로젝트 리스트

	
	List<PSkillVo> listPskill(int p_code); //관련기술 리스트
	/**
	 * 수진
	 */
	Map<String, Object> selectUserProject(ProjectVo vo); // 지원중인 프로젝트 조회

	Map<String, Object> viewPattendUser(PageVo pageVo); // 지원자 목록 조회

	// 프로젝트 상태 변경 - 모집완료 (계약중)
	int updateProjectState(ProjectVo project);

	// 지원자 채용(수락)
	int updateProjectOk(PAttendVo pattendVo);

	// 지원자 거절
	int updateProjectNo(PAttendVo pattendVo);

	// 채용시 메시지 보내기
	int projectStateMsg(MessageVo messageVo);

	// 검색 필터 - 기간
//	List<ProjectVo> searchFilterPreiod(PageVo pageVo);
	Map<String, Object> searchFilterPreiod(PageVo pageVo); 

	// 검색 필터 - 금액
//	List<ProjectVo> searchFilterPrice(PageVo pageVo);
	Map<String, Object> searchFilterPrice(PageVo pageVo); 
	
	
	//체크박스 검색 필터 - 분류
//	Map<String, Object> searchFilterPfiled(PageVo pageVo); 
	Map<String, Object> searchFilterPfileds(SearchVo searchVo);
	
	// 프로젝트 지원 요청 보낼 때 리스트 뽑기
	List<ProjectVo> requestProjectList(String user_id);	
	
	// 프로젝트 지원요청 보내기
	int requestSend(PAttendVo pattend);
	
	//지원요청받은 리스트
	List<ProjectVo> requestedApply(String user_id);
}
