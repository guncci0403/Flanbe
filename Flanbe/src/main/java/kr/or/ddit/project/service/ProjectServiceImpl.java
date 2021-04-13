package kr.or.ddit.project.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.SearchVo;
import kr.or.ddit.evaluation.model.EvaluationVo;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.project.model.PSkillVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.repository.ProjectDao;
import kr.or.ddit.user.model.MessageVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.repository.UserDao;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

	@Resource(name="projectDao")
	private ProjectDao projectDao;
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	
	@Override
	public List<ProjectVo> selectAllProject() {
		return projectDao.selectAllProject();
	}

	@Override
	public int insertProject(ProjectVo vo) {
		return projectDao.insertProject(vo);
	}

	@Override
	public int insertPskill(String ps_no) {
		return projectDao.insertPskill(ps_no);
	}

	@Override
	public ProjectVo viewProject(int p_code) {
		return projectDao.viewProject(p_code);
	}

	@Override
	public Map<String, Object> PagingProject(PageVo vo) {
		   Map<String, Object> map = new HashMap<String, Object>();
		   List<ProjectVo> projectList = projectDao.PagingProject(vo);
		   int projectCnt = projectDao.selectProjectCnt();
		   map.put("pageVo", vo);
		   map.put("projectList", projectList);
		   map.put("pagination", (int)Math.ceil( (double)projectCnt / vo.getPageSize()));
		 return map;
	}

	@Override
	public int applicantCnt(int p_code) {
		return projectDao.applicantCnt(p_code);
	}

	@Override
	public int insertLike(PAttendVo vo) {
		return projectDao.insertLike(vo);
	}

	@Override
	public String selectPstate(PAttendVo pattend) {
		return projectDao.selectPstate(pattend);
	}

	@Override
	public int deletelike(PAttendVo pattend) {
		return projectDao.deletelike(pattend);
	}

	@Override
	public int insertApply(PAttendVo pattend) {
		return projectDao.insertApply(pattend);
	}

	@Override
	public int updateApply(PAttendVo pattend) {
		return projectDao.updateApply(pattend);
	}

	@Override
	public Map<String, Object> searchProjectid(PageVo vo) {
		Map<String, Object> map = new HashMap<>();		
		map.put("projectList", projectDao.searchProjectid(vo));
		map.put("cnt", projectDao.searchProjectidCnt(vo.getS_value()));
		return map;
	}

	@Override
	public Map<String, Object> searchProjectnm(PageVo vo) {
		Map<String, Object> map = new HashMap<>();		
		map.put("projectList", projectDao.searchProjectnm(vo));
		map.put("cnt", projectDao.searchProjectnmCnt(vo.getS_value()));
		return map;
	}

	@Override
	public List<ProjectVo> selectLike(String user_id) {
		return projectDao.selectLike(user_id);
	}

	@Override
	public List<ProjectVo> applyList(String user_id) {
		return projectDao.applyList(user_id);
	}

	/** AS-IS */
	@Override
	public List<ProjectVo> ingProjectListC(String user_id) {
		return projectDao.ingProjectListC(user_id);
	}

	@Override
	public List<ProjectVo> ingProjectListP(String user_id) {
		return projectDao.ingProjectListP(user_id);
	}

	/** TO-BE */ 
	@Override
	public List<ProjectVo> ingProjectList(Map<String, Object> paramMap) throws SQLException {
		// TODO Auto-generated method stub
		return projectDao.ingProjectList(paramMap);
	}
	
	
	@Override
	public List<ProjectVo> finishProjectListC(String user_id) {
		return projectDao.finishProjectListC(user_id);
	}

	@Override
	public List<ProjectVo> finishProjectListP(String user_id) {
		return projectDao.finishProjectListP(user_id);
	}

	@Override
	public List<ProjectVo> beforeProject(String user_id) {
		return projectDao.beforeProject(user_id);
	}
	
	@Override
	public List<PSkillVo> listPskill(int p_code) {
		return projectDao.listPskill(p_code);
	}
	/**
	 * 수진
	 */

	// 지원중인 프로젝트 조회
	@Override
	public Map<String, Object> selectUserProject(ProjectVo pageVo) {
		 Map<String, Object> map = new HashMap<String, Object>();
		   List<ProjectVo> projectList = projectDao.selectUserProject(pageVo);
		   int projectCnt = projectDao.selectUserProjectCnt(pageVo.getUser_id());
		   map.put("pageVo", pageVo);
		   map.put("projectList", projectList);
		   map.put("pagination", (int)Math.ceil( (double)projectCnt / pageVo.getPageSize()));
		   return map;
	}

	// 프로젝트의 지원자 조회 
	@Override
		public Map<String, Object> viewPattendUser(PageVo pageVo) {
		 Map<String, Object> map = new HashMap<String, Object>();
		   List<UserVo> userList = projectDao.viewPattendUser(pageVo);
		   int userCnt = projectDao.viewPattendUserCnt(pageVo.getP_code());
		   ProjectVo pVo = projectDao.viewProject(pageVo.getP_code());
		   
		  List<UserVo> careerList = projectDao.selectCareerChk();
		  List<UserVo> skillList = projectDao.selectUserSkillList();
		  System.out.println("userList : " + userList.size());
			System.out.println("userCnt : " + userCnt);
			map.put("userCnt", userCnt);
			map.put("userList", userList);
		  // 보유 기술 추가하기 
		  for (int i = 0; i < userList.size(); i++) {
			  for (int j = 0; j < skillList.size(); j++) {
				  if(userList.get(i).getUser_id().contains(skillList.get(j).getUser_id())) {
					  userList.get(i).setUs_kind(skillList.get(j).getUs_kind());
					  System.out.println("보유 기술 추가  : " + userList.get(i).getUs_kind());
				  }
				  
			  }
		  }
		  
		  //경력 추가하기 
			for (int i = 0; i < userList.size(); i++) {
				for (int j = 0; j < careerList.size(); j++) {
					if(userList.get(i).getUser_id().contains(careerList.get(j).getUser_id())) {
						userList.get(i).setCareers(careerList.get(j).getCareers());
						System.out.println("carrer추가  : " + userList.get(i).getCareers());
					}
					
				}
			}
		
		   map.put("pageVo", pageVo);
		   map.put("p_code", pageVo.getP_code());
		   map.put("pVo", pVo);
		   map.put("pagination", (int)Math.ceil( (double)userCnt / pageVo.getPageSize()));
		   return map;
	}

	// 프로젝트 상태 변경 - 모집완료 (계약중)
	@Override
	public int updateProjectState(ProjectVo project) {
		return projectDao.updateProjectState(project);
	}
	
	// 지원자 채용(수락)
	@Override
	public int updateProjectOk(PAttendVo pattendVo) {
		return projectDao.updateProjectOk(pattendVo);
	}

	// 지원자 거절
	@Override
	public int updateProjectNo(PAttendVo pattendVo) {
		return projectDao.updateProjectNo(pattendVo);
	}
	
	// 채용시 메시지 보내기 
	@Override
	public int projectStateMsg(MessageVo messageVo) {
		return projectDao.projectStateMsg(messageVo);
	}

	@Override
	public Map<String, Object> searchFilterPreiod(PageVo pageVo) {
		 Map<String, Object> map = new HashMap<String, Object>();
			List<ProjectVo> projectList = projectDao.searchFilterPreiod(pageVo);  
		   int projectCnt = projectDao.searchFilterPreiodCnt(pageVo);
		   map.put("projectList", projectList);
		   map.put("pageVo", pageVo);
		   map.put("pagination", (int)Math.ceil( (double)projectCnt / pageVo.getPageSize()));
		   return map;
	}

	@Override
	public Map<String, Object> searchFilterPrice(PageVo pageVo) {
		 Map<String, Object> map = new HashMap<String, Object>();
			List<ProjectVo> projectList = projectDao.searchFilterPrice(pageVo);  
		   int projectCnt = projectDao.searchFilterPriceCnt(pageVo);
		   map.put("projectList", projectList);
		   map.put("pageVo", pageVo);
		   map.put("pagination", (int)Math.ceil( (double)projectCnt / pageVo.getPageSize()));
		   return map;
	}

	@Override
	public Map<String, Object> searchFilterPfileds(SearchVo searchVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProjectVo> projectList = projectDao.searchFilterPfileds(searchVo);  
		System.out.println("결과 : " +projectList.size());
		map.put("projectList", projectList);
		map.put("pageVo", searchVo);
		map.put("pagination", (int)Math.ceil( (double) projectDao.searchFilterPfiledCnt(searchVo) / searchVo.getPageSize()));
		return map;
	}

	@Override
	public List<ProjectVo> requestProjectList(String user_id) {
		return projectDao.requestProjectList(user_id);
	}

	@Override
	public int requestSend(PAttendVo pattend) {
		return projectDao.requestSend(pattend);
	}

	@Override
	public List<ProjectVo> requestedApply(String user_id) {
		return projectDao.requestedApply(user_id);
	}

	@Override
	public String sendPhone(String user_id) {
		return projectDao.sendPhone(user_id);
	}

	@Override
	public String sendTitle(int p_code) {
		return projectDao.sendTitle(p_code);
	}
	
	// 계약 목록 조회
	@Override
	public Map<String, Object> contractProjectList(ProjectVo projectVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProjectVo> projectList = projectDao.contractProjectList(projectVo);  
		System.out.println("결과 : " +projectList.size());
		map.put("projectList", projectList);
		map.put("pageVo", projectVo);
		map.put("pagination", (int)Math.ceil( (double) projectDao.contractProjectCnt(projectVo) / projectVo.getPageSize()));
		return map;
	}


	//수정 코드 추가 
	//평가 대기 상태로 update
	@Override
	public int beforefinishProject(int p_code) {
		return projectDao.beforefinishProject(p_code);  
	}

	
	//파트너스 한명 평가 완료
	@Override
	public int partnersEvalFinish(EvaluationVo evaluationVo) {
		int p_code = evaluationVo.getP_code();
		//이 사람의 user_id , p_code 를 받아서(vo) p_attend 테이블에서 p_state 를 05로 변경 
		int updatePAttendRes = projectDao.updatePartnersPAttend(evaluationVo); 
		//평가 테이블에 평가 요소 등록하기 
		int partnerEvalRes = projectDao.insertPartnersEval(evaluationVo); 
		//project 가 어떤 분야인지 받아오기
		String p_field = projectDao.selectProjectField(p_code); 
		//p_title 에 분야가 뭔지  set해서 if 문을 줘서 update 에서 이 p_field(실상 p_title에 set된)에 따라서 update 값이 다르게 한다.
		evaluationVo.setP_title(p_field);
		int historyVoRes = projectDao.updateHistoryVoAfterProject(evaluationVo); 
		//제대로 다 insert , update 되면 결과는 1 반환 아니면 0 반환
		if(updatePAttendRes == 1 && partnerEvalRes == 1 && historyVoRes == 1 ) {
			return 1;
		}else {
			return 0;
		}
		
	}

	@Override
	public int updateFinishProject(int p_code) {
		// TODO Auto-generated method stub
		return projectDao.updateFinishProject(p_code);
	}

	@Override
	public int checkAlreadyEval(EvaluationVo evaluationVo) {
		// TODO Auto-generated method stub
		return projectDao.checkAlreadyEval(evaluationVo);
	}

	@Override
	public int checkPAttendFinish(int p_code) {
		// TODO Auto-generated method stub
		return projectDao.checkPAttendFinish(p_code);
	}

	@Override
	public void getProjectList(Map<String, Object> map) throws SQLException {
		
		PageVo pageVo = (PageVo) map.get("pageInfo");
		String sValue = pageVo.getS_value();
		map.put("projectList", projectDao.searchProjectid(pageVo));
		map.put("cnt", projectDao.searchProjectidCnt(sValue));
	}
	
}







