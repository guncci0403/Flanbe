package kr.or.ddit.evaluation.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.evaluation.model.EvaluationVo;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.project.model.ProjectVo2;
import kr.or.ddit.user.model.HistoryVo;
import kr.or.ddit.user.model.UserVo;

public interface EvaluationDao {
	
	// (프로젝트 참가 테이블 내용 가지고 오기)
	public List<PAttendVo>  selectProjectAttend(String user_id);

	//한명의 파트너스의 평가 세부항목 조회(한 행만 조회하면 된다.) 
	public EvaluationVo selectEvaluation(String user_id);
	
	//파트너스 한명한명의 완료한 프로젝트수 
	public int countFinishProject(String user_id);

	//파트너스들이 참여한 전체 프로젝트에 대한 평가평균구하기
	public int averageEvaluation(String user_id);
	
	//진행한 프로젝트 분야(프로젝트 수행 이력 테이블 가지고 오기)
	public HistoryVo selectProjectHistory(String user_id);
	
	//기본 : 진행한 프로젝트리스트 (클라이언트 평가)
	public List<ProjectVo2> selectProjectEvaluation(Map<String, Object> map);
	
	//최신 등록순  : 진행한 프로젝트리스트 (+ 클라이언트 평가) 
	public List<ProjectVo2> selectLatestProjectEval(Map<String, Object> map);
	
	//평점 높은 순 
	public List<ProjectVo2> selectLowScoreProjectEval(Map<String, Object> map); 
	
	//평점 낮은 순 
	public List<ProjectVo2> selectHighScoreProjectEval(Map<String, Object> map);
	
	//금액 높은 순 
	public List<ProjectVo2> selectHighCostProjectEval(Map<String, Object> map);
	
	//회원들이 작성한 포트폴리오 수 갯수
	public int selectCountPortfolio(String user_id);
	
	//프로젝트 평가 리스트 갯수(페이징 처리 위함)
	public int countProjectEvaluation(String user_id);
	
	//평가를 위해 고객을 선택하는데 선택하기 위한 기본 유저 리스트 가져오기 
	public List<UserVo>  viewUserList();
	
	//건영///건영///건영///건영///건영///건영///건영///건영///건영///건영///건영///건영///건영/
	public List<ProjectVo2> selectLatestProjectEval2(String user_id);
}