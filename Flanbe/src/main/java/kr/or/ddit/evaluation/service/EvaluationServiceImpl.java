package kr.or.ddit.evaluation.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.evaluation.model.EvaluationVo;
import kr.or.ddit.evaluation.repository.EvaluationDao;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.project.model.ProjectVo2;
import kr.or.ddit.user.model.HistoryVo;
import kr.or.ddit.user.model.UserVo;

@Service("evaluationserviceimpl")
public class EvaluationServiceImpl implements EvaluationService {

	private static final Logger logger = LoggerFactory.getLogger(EvaluationServiceImpl.class);

	@Resource(name = "evaluationdaoimpl")
	private EvaluationDao dao;

	// 파트너스 한명한명의 완료한 프로젝트 (프로젝트 참가 테이블 내용 가지고 오기)
	@Override
	public List<PAttendVo> selectProjectAttend(String user_id) {
		return dao.selectProjectAttend(user_id);
	}

	// 한명의 파트너스의 평가 세부항목 조회(한 행만 조회하면 된다.)
	@Override
	public EvaluationVo selectEvaluation(String user_id) {
		return dao.selectEvaluation(user_id);
	}

	@Override
	public int countFinishProject(String user_id) {
		// TODO Auto-generated method stub
		return dao.countFinishProject(user_id);
	}

	@Override
	public int averageEvaluation(String user_id) {
		// TODO Auto-generated method stub
		return dao.averageEvaluation(user_id);
	}

	@Override
	public HistoryVo selectProjectHistory(String user_id) {
		return dao.selectProjectHistory(user_id);
	}

	@Override
	public List<ProjectVo2> selectProjectEvaluation(Map<String, Object> map) {
		return dao.selectProjectEvaluation(map);
	}

	@Override
	public List<ProjectVo2> selectLatestProjectEval(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectLatestProjectEval(map);
	}

	@Override
	public List<ProjectVo2> selectLowScoreProjectEval(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectLowScoreProjectEval(map);
	}

	@Override
	public List<ProjectVo2> selectHighScoreProjectEval(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectHighScoreProjectEval(map);
	}

	@Override
	public List<ProjectVo2> selectHighCostProjectEval(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectHighCostProjectEval(map);
	}

	@Override
	public int selectCountPortfolio(String user_id) {
		return dao.selectCountPortfolio(user_id);
	}

	@Override
	public int countProjectEvaluation(String user_id) {
		// TODO Auto-generated method stub
		return dao.countProjectEvaluation(user_id);
	}

	@Override
	public List<UserVo> viewUserList() {
		// TODO Auto-generated method stub
		return dao.viewUserList();
	}

	@Override
	public Map<String, Object> selectSeveralPartnersEval(String[] user_id) {
		// TODO Auto-generated method stub
		// map 의 id 는 각각의 user_id 이고, 그 각각의 user_id 의 evaluation 테이블값(이거는 각각프로젝트마다 평균값을
		// 낸것임) 을 저장해서 반환한다.
		Map<String, Object> map = new HashMap<String, Object>();
		// 각각 들어오는 user_id 에 대한 evaluation 평가 테이블을 여러개의 리턴 값으로 가져온다.

		// nvl, 순서
		for (String id : user_id) {
			EvaluationVo evaluationVo = dao.selectEvaluation(id);
			evaluationVo.setUser_id(id);
			// logger.debug("key 확인 {}" , id);
			map.put(id, evaluationVo);
		}

		return map;
	}

	@Override
	public Map<String, List<EvaluationVo>> selectEvalForPathGraph(String user_id) {

		Map<String, List<EvaluationVo>> resultMap = new HashMap<String, List<EvaluationVo>>();

		// for(String user_id : checkedUser) {
		resultMap.put(user_id, dao.selectEvalForPathGraph(user_id));
		// }

		return resultMap;
	}

	@Override
	public List<UserVo> userInfoForLeftBarHover() {
		
		List<UserVo> userList = dao.viewUserList();
		List<UserVo> UserVoList = new ArrayList<UserVo>();
		for (int i = 0; i < userList.size(); i++) {
			String user_id = userList.get(i).getUser_id();
			UserVo userVo = dao.userInfoForLeftBarHover(user_id);
			userVo.setUser_id(user_id);
			if (userVo != null) {
				UserVoList.add(userVo);
			}
		}
		return UserVoList;
	}

	@Override
	public EvaluationVo allAverageEval() {
		// TODO Auto-generated method stub
		return dao.allAverageEval();
	}

	@Override
	public List<EvaluationVo> allTermEvaluation(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.allTermEvaluation(map);
	}

	@Override
	public int allTermEvaluationCnt(String user_id) {
		// TODO Auto-generated method stub
		return dao.allTermEvaluationCnt(user_id);
	}

	@Override
	public List<EvaluationVo> allAverageForMainInfoGraph(String user_id) {
		// TODO Auto-generated method stub
		return dao.allAverageForMainInfoGraph(user_id);
	}

	// 건영///건영///건영///건영///건영///건영///건영///건영///건영///건영///건영///건영///건영/
	@Override
	public List<ProjectVo2> selectLatestProjectEval2(String user_id) {
		return dao.selectLatestProjectEval2(user_id);
	}

}
