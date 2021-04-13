package kr.or.ddit.evaluation.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.common.model.PaginationVo;
import kr.or.ddit.evaluation.model.EvaluationVo;
import kr.or.ddit.evaluation.repository.EvaluationDao;
import kr.or.ddit.evaluation.service.EvaluationService;
import kr.or.ddit.project.model.ProjectVo2;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.user.model.HistoryVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.MessageService;
import kr.or.ddit.user.service.UserService;

@RequestMapping("evaluation")
@Controller
public class EvaluationController {

	// 다오 주입
	@Resource(name = "evaluationdaoimpl")
	private EvaluationDao evaluationDao;

	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "messageService")
	private MessageService messageService;
	@Resource(name = "projectService")
	private ProjectService projectService;
	// 서비스 주입
	@Resource(name = "evaluationserviceimpl")
	private EvaluationService evaluationService;

	private static final Logger logger = LoggerFactory.getLogger(EvaluationController.class);

	@RequestMapping("viewmain")
	public String viewEvaluation(HttpSession session, Model model, @RequestParam(defaultValue = "me") String user_id) {

		// 공통 //
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}

		// 나중에 임의로 정한 아이디 대신 넘겨주는 파라미터값 정하기 page 도 바꿔주기
		int page = 1;
		// 회원정보
		if (user_id.equals("me")) {
			user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		}
		model.addAttribute("user", userService.selectUser(user_id));
		model.addAttribute("user_id", user_id);
		return "t/evaluation/viewPartnersEvaluation2";
	}

	// 참여한 프로젝트 + 클라이언트평가 리스트로 만들어서 ajax
	@RequestMapping(path = "evalMainBoard", method = RequestMethod.POST)
	public String evalMainBoard(int page, String user_id, Model model, String check) {
		// logger.debug("check {}" , check);
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		List<ProjectVo2> ListProjectVo2 = null;
		pagingMap.put("page", page);
		pagingMap.put("user_id", user_id);
		// 참여한 프로젝트 평가부분

		// 페이지(동적으로 변경해주기 지금은 기본 1 )
		// page = 1 ;
		// 클릭했을때 그 사람의 id 가져와야함 나중에 변경해주기

		// 기본 프로젝트 리스트
		if (check.equals("basic")) { // 기본 조회
			ListProjectVo2 = evaluationService.selectProjectEvaluation(pagingMap);
		} else if (check.equals("latest")) { // 최신 등록순 조회
			ListProjectVo2 = evaluationService.selectLatestProjectEval(pagingMap);
		} else if (check.equals("highScore")) { // 평점 높은 순 조회
			ListProjectVo2 = evaluationService.selectHighScoreProjectEval(pagingMap);
		} else if (check.equals("lowScore")) { // 평점 낮은 순 조회
			ListProjectVo2 = evaluationService.selectLowScoreProjectEval(pagingMap);
		} else if (check.equals("highMoney")) { // 금액이 높은 순 조회
			ListProjectVo2 = evaluationService.selectHighCostProjectEval(pagingMap);
		}
		if (ListProjectVo2.size() == 0) {
			model.addAttribute("EvalNullcheck", "k");
		}

		// pagination 구하기
		int pagination = (int) (Math.ceil(ListProjectVo2.size() / (double) 6));
		// logger.debug("pagination {}" , pagination);

		model.addAttribute("pagination", pagination);
		model.addAttribute("page", page);
		model.addAttribute("check", check);
		model.addAttribute("projectEvalList", ListProjectVo2);
		model.addAttribute("user_id", user_id);

		return "/evaluation/projectEvalListAjax";

	}

//	// 참가한 프로젝트 평가
//	@RequestMapping(path = "projectEval", method = RequestMethod.POST)
//	public String projectEval(String user_id, Model model) {
//		// logger.debug("4번 확인");
//
//		// 전문성등등 평가 평균 부분 가지고 오기
//
//		EvaluationVo evalVo = evaluationService.selectEvaluation(user_id);
//		// logger.debug("4번 확인 2 {}" , evalVo.getPro());
//
//		HistoryVo historyVo = evaluationService.selectProjectHistory(user_id);
//
//		// 두번째 그래프값 가지고 오기
//
//		// 총합계
//
//		double total = historyVo.getH_app() + historyVo.getH_game() + historyVo.getH_pub() + historyVo.getH_etc()
//				+ historyVo.getH_web();
//		// logger.debug("여기는 잘와? {}");
//		// 각각 퍼센트로 변환
//		/* int app = Math.round(historyVo.getH_app() / total * 100); */
//		// logger.debug("historyget{} " , historyVo.getH_app() );
//
//		double app = Math.round((double) historyVo.getH_app() / total * 100 * 10) / 10;
//		double web = Math.round((double) historyVo.getH_web() / total * 100 * 10) / 10;
//		double pub = Math.round((double) historyVo.getH_pub() / total * 100 * 10) / 10;
//		double game = Math.round((double) historyVo.getH_game() / total * 100 * 10) / 10;
//		double sw = Math.round((double) historyVo.getH_etc() / total * 100 * 10) / 10;
//
//		Map<String, Object> map = new HashMap<>();
//		map.put("app", app);
//		map.put("web", web);
//		map.put("pub", pub);
//		map.put("game", game);
//		map.put("sw", sw);
//
//		model.addAttribute("historyMap", map);
//		model.addAttribute("evalVo", evalVo);
//		model.addAttribute("historyVo", historyVo);
//		return "jsonView";
//
//	}
	// 기본 정보 보여주기

	@RequestMapping(path = "projectEvalInfo", method = RequestMethod.POST)
	public String projectEvalInfo(String user_id, Model model) {
		// 1) 파트너스가 참여한 프로젝트 갯수
		int finishProject = evaluationDao.countFinishProject(user_id);

		// 2) 파트너스의 전체 참여 프로젝트에대한 총 평가 평균
		double averageEvaluation = Math.round(evaluationDao.averageEvaluation(user_id) * 100) / 100;
		// logger.debug("기본정보 보여주기 컨트롤러averageEvaluation" + averageEvaluation);

		// 빈별을 찍어야 하는 갯수
		int emptyStar = 0;
		if ((int) averageEvaluation == 5) {
			emptyStar = 0;
		} else if ((int) averageEvaluation == 0) {
			emptyStar = 5;
		} else {
			emptyStar = 5 - (int) averageEvaluation;
		}
		// logger.debug("기본정보 보여주기 컨트롤러emptyStar" +emptyStar);
		// 포트폴리오 수 가져오기

		int countPortfolio = evaluationService.selectCountPortfolio(user_id);
		// logger.debug("기본정보 보여주기 컨트롤러countPortfolio" +countPortfolio);

		// 맨처음 그래프에서 모든 회원들의 (평가가 있다는 가정으로) 평균값을 가지고 그래프로 그려줄 것임
		List<EvaluationVo> allUserEvalAverageList = evaluationService.allAverageForMainInfoGraph(user_id);
		// 앱인지 웹인지부분 가지고 오기(그래프 부분에서 보여줄 애들)
		HistoryVo userHistoryVo = evaluationService.selectProjectHistory(user_id);

		// radar 그래프에 나타낼 전체 리스트의 평균값
		EvaluationVo avgAllListEval = evaluationService.selectEvaluation(user_id);

		// 클릭한 파트너스의 평가페이지를 보여 주고 있는데 그 클릭한 파트너스의 평균을 가지고 와서 첫번째 graph 에 넣어주기
		double oneUserAverage = evaluationService.selectEvaluation(user_id).getAverage();

		model.addAttribute("finishProject", finishProject);
		model.addAttribute("averageEvaluation", averageEvaluation);
		model.addAttribute("finishProject", finishProject);
		model.addAttribute("emptyStar", emptyStar);
		model.addAttribute("countPortfolio", countPortfolio);
		model.addAttribute("allUserEvalAverageList", allUserEvalAverageList);
		model.addAttribute("userHistoryVo", userHistoryVo);
		model.addAttribute("avgAllListEval", avgAllListEval);
		model.addAttribute("oneUserAverage", oneUserAverage);
		model.addAttribute("oneUserId", user_id);

		return "/evaluation/mainInfoAjax";
	}

	// 기본 정보 페이지에서 테이블 부분

	@RequestMapping(path = "projectEvalInfoTable")
	public String projectEvalInfoTable(@RequestParam(defaultValue = "1") int curPage, String user_id, Model model) {
		// 테이블 : 모든 기간의 평점list 가지고 오기 , 모든기간의 클라이언트가 남긴 평가말 가지고 오기 (같이 List 에 들어 있다.)
		// 페이징 처리를 해야함
		// 기초 Pagination
		// 평가 구하려고 하는 list 의 숫자 구하기
		int listCnt = evaluationService.allTermEvaluationCnt(user_id);
		PaginationVo pageNation = new PaginationVo(listCnt, curPage);
		// 본격 list 값에 넣어줌
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		// start 값 넣어주기
		map.put("start", pageNation.getStartIndex() + 1);
		// END 값 넣어주기
		map.put("end", pageNation.getStartIndex() + pageNation.getPageSize());
		List<EvaluationVo> evaluationList = evaluationService.allTermEvaluation(map);

		model.addAttribute("pageNation", pageNation);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("evaluationList", evaluationList);

		return "/evaluation/evalContTableAjax";
	}

	// 회원 목록 가지고 오기
	@RequestMapping(path = "viewUserList")
	public String viewUserList(Model model) {
		// hober 를 위한 정보도 가지고 와야한다.
		List<UserVo> userVoList = evaluationService.userInfoForLeftBarHover();
		model.addAttribute("userList", userVoList);
		// model.addAttribute("userList", userList);
		return "jsonView";
	}

	// 차트 만들기

	// 첫번째 차트 만들기 : pathGraph

	@RequestMapping(path = "pathGraph", method = RequestMethod.POST)
	public String pathGraph(Model model, String[] checkedUser) {

//			for(String check : checkedUser) {
//				logger.debug("첫번째 그래프 checkedUser {} :" , check);
//				
//			}

		Map<String, List<EvaluationVo>> resultMap = new HashMap<String, List<EvaluationVo>>();
		// 가져온 아이디의 값들의 갯수각각에 따른 map(id , evaluationVo)
		// evaluationVo 에는 만족성 , 전문성, 평균 값만 들어 있다.
		resultMap = evaluationService.selectEvalForPathGraph(checkedUser[0]);
		logger.debug("첫번째 차트 key 값 확인{}", resultMap.keySet());

		List<EvaluationVo> listvo = resultMap.get(checkedUser[0]);

		for (EvaluationVo d : listvo) {
			logger.debug("졸려1 : {} ", d.getSat());
			logger.debug("졸려2 : {} ", d.getAverage());
			logger.debug("졸려3 : {} ", d.getPro());
		}

		// model.addAttribute("checkedUser", checkedUser);
		// user_id 값 찍어주기
		model.addAttribute("user_id", checkedUser[0]);
		// user_id 의 list<EvaluationVo> 값 찍어주기
		model.addAttribute("evalListVo", resultMap.get(checkedUser[0]));
		model.addAttribute("allUserList", evaluationService.viewUserList());
		return "/evaluation/pathGraphAjax";
	}

	// 두번째 차트 만들기. barChart

	@RequestMapping(path = "varChart", method = RequestMethod.POST)
	public String varChart(Model model, String[] checkedUser, int graphCheck) throws JsonProcessingException {
		Map<String, Object> map = null;

		List<String> checkUserList = new ArrayList<String>();

		// checkedUser => 체크된 사람들의 아이디를 배열로 가져온다.
		// 평가페이지의 originalUser 인 애는 꼭 평가그래프에 넣어야

		// 첫번쨰 그래프 만들기
		// 비교하고 싶은 데이터들 checkUser 안에 있는 사람들의 user_id . 평균(graphCheck = 1) , 전문성(2) ,
		// 만족도(3) , 의사소통(4) , 일정준수(5) , 적극성(6) , 평균(기본으로 나옴)(7)
		// 기본은 1가 나와야 하고 graphCheck이 1이면 평균값을 구하는 것이다.

		// map 의 key : 각각 배열로 받아온 key들 , map 의 value 는 : 각각의 user_id 에 대한 평가들의 평균

		map = evaluationService.selectSeveralPartnersEval(checkedUser);
		String barChartTitle = null;
		if (graphCheck == 1) {
			barChartTitle = "평균";
		} else if (graphCheck == 2) {
			barChartTitle = "전문성";
		} else if (graphCheck == 3) {
			barChartTitle = "만족도";
		} else if (graphCheck == 4) {
			barChartTitle = "의사소통";
		} else if (graphCheck == 5) {
			barChartTitle = "일정준수";
		} else if (graphCheck == 6) {
			barChartTitle = "적극성";
		}

		for (String key : map.keySet()) {
			// logger.debug("ket 값 체크해보자 잘나오는지{}" , key);
			checkUserList.add(key);
			// logger.debug("userList 체크해보자 체크된 애들이 잘 리스트에 찍히는지 {}" , checkUserList);
		}

		// 각각의 user_id 에 대한 평가 평균
		model.addAttribute("partnerEvalMap", map);
		// 각 키의 값을 가지고 가자.
		// 나중에 PARSING 한 JSON 데이터를 KEY 만을 가지고 MODAL 창에 CHECK 가 되도록 할것이다.
		ObjectMapper mapper = new ObjectMapper();

		model.addAttribute("checkUserList", mapper.writeValueAsString(checkUserList));
		model.addAttribute("barChartTitle", barChartTitle);
		model.addAttribute("graphCheck", graphCheck);
		return "/evaluation/chartAjax";
	}

	// 세번째 차트 만들기

	@RequestMapping(path = "allAverageEval", method = RequestMethod.POST)
	public String allAverageEval(Model model, String user_id) {

		// 전체 사람들의 평가 평균값
		EvaluationVo allUserEvaluationVo = evaluationService.allAverageEval();

		// 현재 페이지의 회원의 아이디로 그 사람의 평가의 평균값 구해오기

		EvaluationVo oneAverageEval = evaluationService.selectEvaluation(user_id);

		// 한사람의 실행했던 분야

		HistoryVo oneHistoryVo = evaluationService.selectProjectHistory(user_id);

		model.addAttribute("allUserEvaluationVo", allUserEvaluationVo);
		model.addAttribute("oneAverageEval", oneAverageEval);
		model.addAttribute("user_id", user_id);
		model.addAttribute("oneHistoryVo", oneHistoryVo);
		return "/evaluation/radarAjax";
	}

}
