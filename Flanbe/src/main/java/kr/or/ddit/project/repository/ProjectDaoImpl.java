package kr.or.ddit.project.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import kr.or.ddit.evaluation.model.EvaluationVo;
import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.SearchVo;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.project.model.PSkillVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.user.model.MessageVo;
import kr.or.ddit.user.model.UserVo;

@Repository("projectDao")
public class ProjectDaoImpl implements ProjectDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<ProjectVo> selectAllProject() {
		return template.selectList("project.selectAllProject");
	}

	@Override
	public int insertProject(ProjectVo vo) {
		return template.insert("project.insertProject", vo);
	}

	@Override
	public int insertPskill(String ps_no) {
		return template.insert("project.insertPskill", ps_no);
	}

	@Override
	public ProjectVo viewProject(int p_code) {
		return template.selectOne("project.viewProject", p_code);
	}

	@Override
	public List<ProjectVo> PagingProject(PageVo vo) {
		return template.selectList("project.PagingProject", vo);
	}

	@Override
	public int selectProjectCnt() {
		return template.selectOne("project.selectProjectCnt");
	}

	@Override
	public int applicantCnt(int p_code) {
		return template.selectOne("project.applicantCnt", p_code);
	}

	@Override
	public int insertLike(PAttendVo vo) {
		return template.insert("project.insertLike", vo);
	}

	@Override
	public String selectPstate(PAttendVo pattend) {
		return template.selectOne("project.selectPstate", pattend);
	}

	@Override
	public int deletelike(PAttendVo pattend) {
		return template.delete("project.deletelike", pattend);
	}

	@Override
	public int insertApply(PAttendVo pattend) {
		return template.insert("project.insertApply", pattend);
	}

	@Override
	public int updateApply(PAttendVo pattend) {
		return template.update("project.updateApply", pattend);
	}

	@Override
	public List<ProjectVo> searchProjectid(PageVo project) {
		return template.selectList("project.searchProjectid", project);
	}

	@Override
	public int searchProjectidCnt(String id) {
		return template.selectOne("project.searchProjectidCnt", id);
	}

	@Override
	public List<ProjectVo> searchProjectnm(PageVo project) {
		return template.selectList("project.searchProjectnm", project);
	}

	@Override
	public int searchProjectnmCnt(String title) {
		return template.selectOne("project.searchProjectnmCnt", title);
	}
	
	@Override
	public List<ProjectVo> selectLike(String user_id) {
		return template.selectList("project.selectLike", user_id);
	}
	
	@Override
	public List<ProjectVo> applyList(String user_id) {
		return template.selectList("project.applyList", user_id);
	}

	@Override
	public List<ProjectVo> ingProjectListC(String user_id) {
		return template.selectList("project.ingProjectListC", user_id);
	}

	@Override
	public List<ProjectVo> ingProjectListP(String user_id) {
		return template.selectList("project.ingProjectListP", user_id);
	}

	@Override
	public List<ProjectVo> finishProjectListC(String user_id) {
		return template.selectList("project.finishProjectListC", user_id);
	}

	@Override
	public List<ProjectVo> finishProjectListP(String user_id) {
		return template.selectList("project.finishProjectListP", user_id);
	}

	@Override
	public List<ProjectVo> beforeProject(String user_id) {
		return template.selectList("project.beforeProject", user_id);
	}
	
	@Override
	public List<PSkillVo> listPskill(int p_code) {
		return template.selectList("project.listPskill", p_code);
	}
	
	
	/**
	 * 수진
	 */
	
	// 프로잭트 모집중 
	@Override
	public List<ProjectVo> selectUserProject(ProjectVo project) {
		return template.selectList("project.selectUserProject", project);
	}

	@Override
	public int selectUserProjectCnt(String user_id) {
		return template.selectOne("project.selectUserProjectCnt",user_id);
	}

    //지원자 조회 
	@Override
		public List<UserVo> viewPattendUser(PageVo pageVo) {
		//수정이가씀 지우세요
		int page = pageVo.getPage();
		int PageSize = pageVo.getPageSize(); 
		
		return template.selectList("pattend.viewPattendUser", pageVo);
	}
	
	// 지원자 수 조회
	@Override
	public int viewPattendUserCnt(int p_code) {
		return template.selectOne("pattend.viewPattendUserCnt", p_code);
	}
	
	//프로젝트 상태 변경 
	@Override
	public int updateProjectState(ProjectVo project) {
		return template.update("project.updateProjectState", project);
	}

	// 지원자 수락 
	@Override
	public int updateProjectOk(PAttendVo pattendVo) {
		return template.update("pattend.updateProjectOk",pattendVo);
	}

	// 지원자 거절
	@Override
	public int updateProjectNo(PAttendVo pattendVo) {
		return template.update("pattend.updateProjectNo",pattendVo);
	}

	// 지원자 메시지 보내기 (자동)
	@Override
	public int projectStateMsg(MessageVo messageVo) {
		return template.insert("pattend.projectStateMsg", messageVo);
	}

	@Override
	public List<ProjectVo> searchFilterPreiod(PageVo pageVo) {
		return template.selectList("project.searchFilterPreiod", pageVo);
	}

	@Override
	public List<ProjectVo> searchFilterPrice(PageVo pageVo) {
		return template.selectList("project.searchFilterPrice", pageVo);
	}

	@Override
	public int searchFilterPreiodCnt(PageVo pageVo) {
		return template.selectOne("project.searchFilterPreiodCnt",pageVo);
	}

	@Override
	public int searchFilterPriceCnt(PageVo pageVo) {
		return template.selectOne("project.searchFilterPriceCnt",pageVo);
	}
	
	@Override
	public  List<UserVo> selectUserSkillList() {
		return template.selectList("pattend.selectUserSkillList");
	}

	@Override
	public List<UserVo> selectCareerChk() {
		return template.selectList("pattend.selectCareerChk");
	}
	
	@Override
	public int searchFilterPfiledCnt(SearchVo searchVo) {
		return template.selectOne("project.searchFilterPfiledCnt",searchVo);
	}

	@Override
	public List<ProjectVo> searchFilterPfileds(SearchVo searchVo) {
		return template.selectList("project.searchFilterPfileds",searchVo);
	}

	@Override
	public List<ProjectVo> requestProjectList(String user_id) {
		return template.selectList("project.requestProjectList", user_id);
	}

	@Override
	public int requestSend(PAttendVo pattend) {
		return template.update("project.requestSend", pattend);
	}

	@Override
	public List<ProjectVo> requestedApply(String user_id) {
		return template.selectList("project.requestedApply", user_id);
	}

	@Override
	public String sendPhone(String user_id) {
		return template.selectOne("project.sendPhone", user_id);
	}

	@Override
	public String sendTitle(int p_code) {
		return template.selectOne("project.sendTitle", p_code);
	}
	
	@Override
	public List<ProjectVo> contractProjectList(ProjectVo projectVo) {
		return template.selectList("project.contractProjectList",projectVo);
	}

	@Override
	public int contractProjectCnt(ProjectVo projectVo) {
		return template.selectOne("project.contractProjectCnt",projectVo);
	}

	///
	//수정
	@Override
	public int beforefinishProject(int p_code) {
		// TODO Auto-generated method stub
		return template.update("project.beforefinishProject", p_code);
	}

	@Override
	public String selectProjectField(int p_code) {
		// TODO Auto-generated method stub
		return template.selectOne("project.selectProjectField", p_code);
	}
	
	@Override
	public int updatePartnersPAttend(EvaluationVo evaluationVo) {
		
		return template.update("project.updatePartnersPAttend", evaluationVo);
	}
	
	//평가 등록하기 
	@Override
	public int insertPartnersEval(EvaluationVo evaluationVo) {
		return template.insert("project.insertPartnersEval", evaluationVo);
	}
	@Override
	public int updateHistoryVoAfterProject(EvaluationVo evaluationVo) {
		return template.update("project.updateHistoryVoAfterProject", evaluationVo); 
	}

	@Override
	public int updateFinishProject(int p_code) {
		// TODO Auto-generated method stub
		return template.update("project.updateFinishProject" , p_code);
	}

	@Override
	public int checkAlreadyEval(EvaluationVo evaluationVo) {
		// TODO Auto-generated method stub
		return template.selectOne("project.checkAlreadyEval", evaluationVo);
	}

	@Override
	public int checkPAttendFinish(int p_code) {
		// TODO Auto-generated method stub
		return template.selectOne("project.checkPAttendFinish", p_code);
	}

	@Override
	public List<ProjectVo> ingProjectList(Map<String, Object> paramMap) throws SQLException {
		return template.selectList("project.ingProjectList", paramMap);
	}
	
	
}
