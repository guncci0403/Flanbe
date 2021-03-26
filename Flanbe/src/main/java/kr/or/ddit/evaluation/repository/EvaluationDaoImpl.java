package kr.or.ddit.evaluation.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.evaluation.model.EvaluationVo;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.project.model.ProjectVo2;
import kr.or.ddit.user.model.HistoryVo;
import kr.or.ddit.user.model.UserVo;

@Repository("evaluationdaoimpl")
public class EvaluationDaoImpl implements EvaluationDao {
	
	private static final Logger logger = LoggerFactory.getLogger(EvaluationDaoImpl.class);
	
	@Resource(name = "sqlSessionTemplate")
	SqlSessionTemplate sqlSessionTemplate;
	
	//파트너스의 계약한 프로젝트 (프로젝트 참가 테이블 내용 가지고 오기)
	public List<PAttendVo>  selectProjectAttend(String user_id) {
		List<PAttendVo> listPattendVo = sqlSessionTemplate.selectList("eval.selectProjectAttend", user_id);
		return listPattendVo ;
	}
	
	//한명의 파트너스의 평가 세부항목 조회(한 행만 조회하면 된다.) 
	public EvaluationVo selectEvaluation(String user_id){
		EvaluationVo evaluationVo = sqlSessionTemplate.selectOne("eval.selectEvaluation", user_id);
		return evaluationVo ;
	}

	@Override
	public int countFinishProject(String user_id) {
		int cnt = sqlSessionTemplate.selectOne("eval.countFinishProject", user_id);
		return cnt ;
	}

	//파트너스들이 참여한 전체 프로젝트에 대한 평가평균구하기
	@Override
	public int averageEvaluation(String user_id) {
		int average = sqlSessionTemplate.selectOne("eval.averageEvaluation", user_id);
		return average;
	}

	@Override
	public HistoryVo selectProjectHistory(String user_id) {
		
		HistoryVo historyVo = sqlSessionTemplate.selectOne("eval.selectProjectHistory", user_id)  ;
		return historyVo ;
	}

	@Override
	public List<ProjectVo2> selectProjectEvaluation(Map<String, Object> map) {
		
		List<ProjectVo2> projectVo2List = sqlSessionTemplate.selectList("eval.selectProjectEvaluation", map);
		
		
		return projectVo2List;
	}
	
	@Override
	public List<ProjectVo2> selectLatestProjectEval(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("eval.selectLatestProjectEval", map);
	}

	@Override
	public List<ProjectVo2> selectLowScoreProjectEval(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("eval.selectLowScoreProjectEval", map);
	}

	@Override
	public List<ProjectVo2> selectHighScoreProjectEval(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("eval.selectHighScoreProjectEval", map);
	}

	@Override
	public List<ProjectVo2> selectHighCostProjectEval(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("eval.selectHighCostProjectEval", map);
	}
	
	
	

	@Override
	public int selectCountPortfolio(String user_id) {
		return sqlSessionTemplate.selectOne("eval.selectCountPortfolio", user_id);
	}

	@Override
	public int countProjectEvaluation(String user_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("eval.countProjectEvaluation", user_id);
	}

	
	//평가테이블에 존재하는 user_id 만 뽑아 오기 
	
	@Override
	public List<UserVo> viewUserList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("eval.viewUserList");
	}

	/*
	 * @Override public Map<String, List<EvaluationVo>>
	 * selectEvalForPathGraph(String User_id) { // TODO Auto-generated method stub
	 * 
	 * return sqlSessionTemplate.selectList("eval.viewUserList"); }
	 */

	@Override
	public List<EvaluationVo> selectEvalForPathGraph(String User_id) {
		// TODO Auto-generated method stub
		
		return sqlSessionTemplate.selectList("eval.selectEvalForPathGraph", User_id);
	}

	@Override
	public UserVo userInfoForLeftBarHover(String user_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("eval.userInfoForLeftBarHover", user_id);
	}

	@Override
	public EvaluationVo allAverageEval() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("eval.allAverageEval");
	}

	@Override
	public List<EvaluationVo> allTermEvaluation(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("eval.allTermEvaluation", map);
	}

	@Override
	public int allTermEvaluationCnt(String user_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("eval.allTermEvaluationCnt" , user_id);
	}
	
	
	@Override
	public List<EvaluationVo> allAverageForMainInfoGraph(String user_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("eval.allAverageForMainInfoGraph" , user_id);
	}
	@Override
	public List<ProjectVo2> selectLatestProjectEval2(String user_id) {
		return sqlSessionTemplate.selectList("eval.selectLatestProjectEval2", user_id);
	}

	
	

}
