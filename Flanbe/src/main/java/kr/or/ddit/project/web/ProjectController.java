package kr.or.ddit.project.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.SearchVo;
import kr.or.ddit.contract.model.MeetingVo;
import kr.or.ddit.contract.service.ContractService;
import kr.or.ddit.evaluation.model.EvaluationVo;
import kr.or.ddit.note.service.NoteService;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.user.model.MessageVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.MessageService;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.view.Coolsms;

@Controller
@RequestMapping("project")
public class ProjectController {

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@Resource(name = "NoteServiceImpl")
	private NoteService noteService;
	
	@Resource(name = "projectService")
	private ProjectService projectService;

	@Resource(name = "contractService")
	private ContractService contractService;
	
	@Resource(name = "messageService")
	private MessageService messageService;

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping("selectProject")
	public String project(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int pageSize,
			Model model, HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		PageVo pageVo = new PageVo(page, pageSize);

		model.addAllAttributes(projectService.PagingProject(pageVo));

		return "t/project/projectList";
	}

	@RequestMapping(path = "insertProject", method = RequestMethod.GET)
	public String insertproject(Model model, UserVo userVo, HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		return "t/project/insertProject";
	}

	@RequestMapping(path = "insertProject", method = RequestMethod.POST)
	public String insertproject(Model model, ProjectVo projectVo, String ps_no) {
		String str = ps_no;
		String[] array = str.split(",");
		int insertCnt = projectService.insertProject(projectVo);
		for (int i = 0; i < array.length; i++) {
			String ps = array[i];
			projectService.insertPskill(ps);
		}
		if (insertCnt == 1) {
			return "redirect:/project/beforeProjectList";
		}
		return "t/project/insertProject";
	}

	@RequestMapping(path="viewProject", method=RequestMethod.GET)
	public String viewproject(Model model, int p_code, HttpSession session) {      // () 안에 있는건 받아오는 값들
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		
		PAttendVo pattend = new PAttendVo();
		pattend.setP_code(p_code);
		pattend.setUser_id(user_id);
  
		model.addAttribute("project", projectService.viewProject(p_code));
		model.addAttribute("applicant", projectService.applicantCnt(p_code));
		model.addAttribute("pstate", projectService.selectPstate(pattend));
		model.addAttribute("pskill", projectService.listPskill(p_code));
  
		return "t/project/viewProject";
	}

	@RequestMapping(path = "insertLike", method = RequestMethod.POST)
	public String insertlike(Model model, PAttendVo pattendVo, RedirectAttributes ra) {

//		logger.debug("pattend : {}", pattendVo);

		int insertCnt = projectService.insertLike(pattendVo);
//		logger.debug("cnt : {}", insertCnt);
		if (insertCnt == 1) {
			ra.addFlashAttribute("msg", "관심등록되었습니다.");
			return "redirect:/project/viewProject?p_code=" + pattendVo.getP_code();
		}
		return "redirect:/project/viewProject?p_code=" + pattendVo.getP_code();
	}

	@RequestMapping(path = "deleteLike", method = RequestMethod.POST)
	public String deletelike(Model model, PAttendVo pattendVo, RedirectAttributes ra) {

		logger.debug("delete패턴vo : {}", pattendVo);
		int deleteCnt = projectService.deletelike(pattendVo);

		if (deleteCnt == 1) {
			ra.addFlashAttribute("msg", "삭제되었습니다.");
			return "redirect:/project/viewProject?p_code=" + pattendVo.getP_code();
		}

		return "redirect:/project/viewProject?p_code=" + pattendVo.getP_code();
	}

	@RequestMapping(path = "insertApply", method = RequestMethod.POST)
	public String insertapply(Model model, PAttendVo pattendVo, RedirectAttributes ra) {

		logger.debug("pattend : {}", pattendVo);

		int insertCnt = projectService.insertApply(pattendVo);
		logger.debug("cnt : {}", insertCnt);
		if (insertCnt == 1) {
			ra.addFlashAttribute("msg", "지원완료.");
			return "redirect:/project/viewProject?p_code=" + pattendVo.getP_code();
		}
		return "t/project/projectList";
	}

	@RequestMapping(path = "updateApply", method = RequestMethod.POST)
	public String updateapply(Model model, PAttendVo pattendVo, RedirectAttributes ra) {

		logger.debug("pattend : {}", pattendVo);

		int updateCnt = projectService.updateApply(pattendVo);
		logger.debug("cnt : {}", updateCnt);
		if (updateCnt == 1) {
			ra.addFlashAttribute("msg", "지원완료.");
			return "redirect:/project/viewProject?p_code=" + pattendVo.getP_code();
		}
		return "project/updateapply";
	}

	public class SessionException extends Exception {
		public SessionException() {}
		public SessionException(String msg) {
			super(msg);
		}
	}
	
	
	/** 컨트롤러 처리 프로세스(파라미터구성 -> 검증 -> 서비스 -> 결과전달) 
	 *  1. 파라미터 구성(함수파라미터+세션파라미터+기타) 
	 *  2. 파라미터 검증(메뉴권한, 사용자권한, 주요정보값)
	 *  3. 서비스호출(트랜잭션 단위에 맞게 호출되어야 함) 
	 *    - 타입 : C(create,insert) R(read, select) U(update) D(delete) 
	 *      - 제품판매서비스 : [ 판매마스터관리 + 판매상세관리 + 재고관리 + 전표관리(영수증) ]가 하나의 작업으로 관리 
	 *    - 서비스 : 2번 이상 호출 가능 ?
	 *      - 배치처리(100개)의 처리를 일괄로 한다면 -> 각각의 트랜잭션처리를 통해 오류가 일어나는 것은 향후 다시 처리되도록 설계 
	 *      
	 *     String[] data = null;
			   for (String s : data) {
			   		try {
						서비스
					}catch(SQLException e) {
						
					}
				} 
	 *      
	 *  4. 클라이언트 전송 자료 구축
	 *  5. view 페이지 설정    
	 * @throws SQLException 
	 *        
	 */
	/*
	@RequestMapping("searchProject")
	public String searchProject(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, String sT, String kW, RedirectAttributes ra,
			HttpSession session) throws SessionException, SQLException {
		
		// 1. 파라미터 구성/검증  
		if (kW.equals("") || sT.equals("")) {
			ra.addAttribute("page", page);
			ra.addAttribute("pageSize", pageSize);
			return "redirect:/project/selectProject";
		}
		
		UserVo userVo = (UserVo) session.getAttribute("S_USER");
//		if(userVo==null) {
//			return "redirect:로그인페이지URL";
//			//throw new SessionException("세션이 존재하지 않습니다.");
//		}

		String userId = userVo.getUser_id();
		String purpose = userVo.getPurpose();
		PageVo pageVo = new PageVo(page, pageSize, kW);
		
		//-----------------------------------------------------------------------------------------
		// 읽지 않은 메세지 리스트 
		List<MessageVo> alarmMessage = messageService.alarmMessage(userId);
		
		// 참여중인 프로젝트 리스트  
		Map<String,Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("purpose", purpose);
		map.put("pageInfo", pageVo);
		
		logger.debug("진행중 프로젝트 파라미터 : {} ", map);
		List<ProjectVo> ingProjectList = projectService.ingProjectList(map);
		
		// 프로젝트 목록 조회 
		projectService.getProjectList(map);
		List<ProjectVo> projectVoList = (List<ProjectVo>) map.get("projectList");
		int cnt = (int) map.get("cnt");
		// -------------------------------------------------------------------------------------------
		
		// 클라이언트 자료 전송 내역 
		model.addAttribute("alarmList", alarmMessage);
		model.addAttribute("pList", ingProjectList);
		model.addAttribute("pagination", (int) Math.ceil((double) cnt / pageSize));
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("sT", sT);
		model.addAttribute("kW", kW);
		
		// view 페이지 설정 
		return "t/project/projectList";
		// --------------------------------------------------------------------------------
	}
	*/
	
	
	@RequestMapping("searchProject")
	public String searchProject(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, String sT, String kW, RedirectAttributes ra,
			HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		logger.debug("kW : {} , sT : {} ", kW, sT);
		Map<String, Object> map = null;

		PageVo vo = new PageVo(page, pageSize, kW);
		if (kW.equals("") || sT.equals("")) {
			ra.addAttribute("page", page);
			ra.addAttribute("pageSize", pageSize);
			return "redirect:/project/selectProject";
		} else {
			if (sT.equals("i")) {
				map = projectService.searchProjectid(vo);
			} else if (sT.equals("p")) {
				map = projectService.searchProjectnm(vo);
			}
			int cnt = (int) map.get("cnt");
			model.addAttribute("projectList", map.get("projectList"));
			model.addAttribute("pagination", (int) Math.ceil((double) cnt / pageSize));
			model.addAttribute("pageVo", vo);
			model.addAttribute("sT", sT);
			model.addAttribute("kW", kW);
			return "t/project/projectList";
		}
	}

	// 지원자 모집중 관심 등록 리스트
	@RequestMapping("selectLikeList")
	public String selectlikelist(Model model, ProjectVo projectvo, HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}

		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();

		model.addAttribute("likeList", projectService.selectLike(user_id));

		return "t/project/selectLikeList";
	}

	// 지원자 모집중 관심 등록 리스트 마감된 프로젝트 삭제
	@RequestMapping(path = "deleteLikeList", method = RequestMethod.POST)
	public String deletelikeList(Model model, PAttendVo pattendVo, RedirectAttributes ra) {

		int deleteCnt = projectService.deletelike(pattendVo);

		if (deleteCnt == 1) {
			ra.addFlashAttribute("msg", "삭제되었습니다.");
			return "redirect:/project/selectLikeList";
		}
		return "t/project/selectLikeList";
	}

	// 지원내역 리스트
	@RequestMapping("applyList")
	public String applyList(Model model, ProjectVo projectvo, HttpSession session) {
		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		model.addAttribute("alarmList", messageService.alarmMessage(user_id));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}

		model.addAttribute("applyList", projectService.applyList(user_id));

		return "t/project/applyList";
	}

	@RequestMapping(path = "deleteApplyList", method = RequestMethod.POST)
	public String deletapplyList(Model model, PAttendVo pattendVo, RedirectAttributes ra) {
		int deleteCnt = projectService.deletelike(pattendVo);

		if (deleteCnt == 1) {
			ra.addFlashAttribute("msg", "삭제되었습니다.");
			return "redirect:/project/applyList";
		}
		return "project/applyList";
	}

	@RequestMapping("ingProjectList")
	public String ingprojectlist(Model model, ProjectVo projectvo, HttpSession session) {

		/** 외부 파라미터 조회 - 이하 로직에서 사용할 목적, 검증 */
		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		String purpose = ((UserVo) session.getAttribute("S_USER")).getPurpose();
		
		
		/** 검증 : Validation */ 

		/** 서비스 호출 */ 
		model.addAttribute("alarmList", messageService.alarmMessage(user_id));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		logger.debug("ㅎㅎ : {}", purpose);
		if (purpose.equals("C")) {
			model.addAttribute("ingProjectList", projectService.ingProjectListC(user_id));
			logger.debug("나는 C : {}", purpose);
		} else {
			model.addAttribute("ingProjectList", projectService.ingProjectListP(user_id));
			logger.debug("나는 P : {}", purpose);
		}
		
		/** client 전송할 자료 입력 */ 
		
		
		/** 화면(view) 설정 */ 
		return "t/project/ingProjectList";
	}

	@RequestMapping("finishProjectList")
	public String finishprojectlist(Model model, ProjectVo projectvo, HttpSession session) {

		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		model.addAttribute("alarmList", messageService.alarmMessage(user_id));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		String purpose = ((UserVo) session.getAttribute("S_USER")).getPurpose();

		if (purpose.equals("C")) {
			model.addAttribute("finishProjectList", projectService.finishProjectListC(user_id));
		} else {
			model.addAttribute("finishProjectList", projectService.finishProjectListP(user_id));
		}
		return "t/project/finishProjectList";
	}

	@RequestMapping("beforeProjectList")
	public String beforeprojectlist(Model model, ProjectVo projectvo, HttpSession session) {

		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		model.addAttribute("alarmList", messageService.alarmMessage(user_id));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		model.addAttribute("beforeprojectList", projectService.beforeProject(user_id));

		return "t/project/beforeProjectList";
	}

	// 클라이언트 --> 파트너스 지원요청받은 리스트
	@RequestMapping("requestedapplylist")
	public String requestedapplylist(Model model, ProjectVo projectVo, HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		logger.debug("여기왔니?{}");
		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		 
		model.addAttribute("reqapplyList", projectService.requestedApply(user_id));
		return "t/project/requestedApplyList";
	}
	
	/**
	 * 수진
	 */
	// 지원자 모집중
	@RequestMapping("selectUserProject")
	public String selectUserProject(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, String user_id, Model model, HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		ProjectVo pageVo = new ProjectVo(page, pageSize, user_id);
		model.addAllAttributes(projectService.selectUserProject(pageVo));
		return "t/project/recruitment";
	}

	// 지원자 조회
	@RequestMapping("viewPattendUser")
	public String viewPattendUser(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize, int p_code , String user_id, Model model,
			RedirectAttributes ra, HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		PageVo pageVo = new PageVo(page, pageSize);
		pageVo.setP_code(p_code);
		model.addAllAttributes(projectService.viewPattendUser(pageVo));

		List<UserVo> userList = (List<UserVo>) projectService.viewPattendUser(pageVo).get("userList");
//		Map<String, Object> map = projectService.viewPattendUser(pageVo);
		if (userList.isEmpty()) {
			ra.addFlashAttribute("msg", "지원자가 없습니다.");
			return "redirect:/project/selectUserProject?user_id=" + user_id;
		}

		return "t/project/recruitmentUser";

	}

	// 마감완료 변경 - 상태 04
	@RequestMapping(path = "updateProjectState", method = RequestMethod.GET)
	public String updateProjectState(Model model, ProjectVo projectVo, RedirectAttributes ra) {
		int updateCnt = projectService.updateProjectState(projectVo);
		if (updateCnt == 1) {
			ra.addFlashAttribute("msg", "프로젝트가 마감되었습니다.");
			return "redirect:/project/selectUserProject?user_id=" + projectVo.getUser_id();
		}
		return "t/project/selectUserProject";
	}

	// 지원자 수락
	@RequestMapping(path = "projectOk", method = RequestMethod.POST)
	public String projectOk(HttpServletRequest request, Model model, PAttendVo pattendVo, String user_nm, RedirectAttributes ra, HttpSession session, MeetingVo meeting) {
		
//		String api_key = "key";
//	    String api_secret = "secret";
//	    Coolsms coolsms = new Coolsms(api_key, api_secret);
//	    
//		HashMap<String, String> set = new HashMap<String, String>();
//		
//		set.put("to", projectService.sendPhone(pattendVo.getUser_id())); // 수신번호
//        set.put("from", ((UserVo)session.getAttribute("S_USER")).getPhone()); // 발신번호, jsp에서 전송한 발신번호를 받아 map에 저장한다.
//        set.put("text", projectService.sendTitle(pattendVo.getP_code()) + " 승인되었습니다."); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
//        set.put("type", "sms"); // 문자 타입
//        
//	    System.out.println(set);

//	    JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		
		
		String client = ((UserVo)session.getAttribute("S_USER")).getUser_id();
		logger.debug(client);
		int updateCnt = projectService.updateProjectOk(new PAttendVo(pattendVo.getP_code(), pattendVo.getUser_id()));
		if (updateCnt == 1) {
			meeting.setPtn_id(pattendVo.getUser_id());
			contractService.insertContract(meeting);
			logger.debug(" 여기 : {} ", meeting);
			
			ra.addFlashAttribute("msg", user_nm + "님 수락 되었습니다.");
			projectService.projectStateMsg(new MessageVo(
					"안녕하세요 클라이언트 수락 요청입니다. <br> 프로젝트에 참가하게 되었습니다  <div class='font-icon-list p-2 border mx-1 mb-2'>"
							+ "<a href='http://localhost:80/project/viewProject?p_code=" + pattendVo.getP_code()
							+ "'>참가하는 프로젝트 보기</a></div>",
					pattendVo.getUser_id(), client));
			
//			if ((boolean)result.get("status") == true) {
//			      // 메시지 보내기 성공 및 전송결과 출력
//			      System.out.println("성공");
//			      System.out.println(result.get("group_id")); // 그룹아이디
//			      
//			      System.out.println(result.get("result_code")); // 결과코드
//			      System.out.println(result.get("result_message")); // 결과 메시지
//			      System.out.println(result.get("success_count")); // 메시지아이디
//			      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
//			}else {
//			      // 메시지 보내기 실패
//			      System.out.println("실패");
//			      System.out.println(result.get("code")); // REST API 에러코드
//			      System.out.println(result.get("message")); // 에러메시지
//			}
		}
		return "redirect:/project/viewPattendUser?p_code=" + pattendVo.getP_code();
	}

	// 지원자 거절
	@RequestMapping(path = "projectNo", method = RequestMethod.POST)
	public String projectNo(Model model, PAttendVo pattendVo, HttpSession session, RedirectAttributes ra) {
		
		String client = ((UserVo)session.getAttribute("S_USER")).getUser_id();
		
		int updateCnt = projectService.updateProjectNo(new PAttendVo(pattendVo.getP_code(), pattendVo.getUser_id()));
		if (updateCnt == 1) {
			ra.addFlashAttribute("msg", "거절 되었습니다.");
			projectService.projectStateMsg(
					new MessageVo("안타깝지만 요청한 프로젝트에 거절되었습니다.<br> 다음에 다시 지원 부탁드립니다.", pattendVo.getUser_id(), client));
		}
		return "redirect:/project/viewPattendUser?p_code=" + pattendVo.getP_code();
	}

	// 필터 검색 - 금액
	@RequestMapping(path = "searchFilterPrice", method = RequestMethod.GET)
	public String searchFilterPrice(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, @RequestParam(defaultValue = "0") String st,
			@RequestParam(defaultValue = "") String end, String state, RedirectAttributes ra, HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		if(st.equals("0") && end.equals("") ) {
			return "redirect:/project/selectProject";
		}
		PageVo vo = new PageVo(page, pageSize);
		if (!st.equals("0") && end.equals("") ) {
			logger.debug("1");
			vo.setStart(st+ "0000");
			model.addAttribute("state", "price");
			model.addAllAttributes(projectService.searchFilterPrice(vo));
//			return "t/project/projectSearch";
		} else if (!st.equals("") && !end.equals("")) {
			vo.setStart(st+"0000");
			vo.setEnd(end+"0000");
			logger.debug("2");
			model.addAttribute("state", "price");
			model.addAllAttributes(projectService.searchFilterPrice(vo));
//			return "t/project/projectSearch";
		} else if ((st.equals("0") && !end.equals(""))) {
			vo.setStart(st+"0000");
			vo.setEnd(end+"0000");
			logger.debug("3");
			model.addAttribute("state", "price");
			model.addAllAttributes(projectService.searchFilterPrice(vo));
		}
//		model.addAttribute("st", st.substring(0, st.length() - 4));
//		model.addAttribute("end", end.substring(0, end.length() - 4));
		logger.debug("st : {} , end : {} ", st, end);
		return "t/project/projectSearch";
//		}
	}

	// 필터 검색 - 기간
	@RequestMapping(path = "searchFilterPreiod", method = RequestMethod.GET)
	public String searchFilterPreiod(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, @RequestParam(defaultValue = "0") String st,
			@RequestParam(defaultValue = "") String end, String state, RedirectAttributes ra, HttpSession session) {

		logger.debug("st : {} , end : {} ", st, end);

		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		PageVo vo = new PageVo(page, pageSize);
		if (st.equals("") && end.equals("")) {
			logger.debug("1");
			vo.setStart(st);
			model.addAttribute("state", "preiod");
			model.addAllAttributes(projectService.searchFilterPreiod(vo));
//			return "t/project/projectSearch";
		} else if (!st.equals("") && !end.equals("")) {
			vo.setStart(st);
			vo.setEnd(end);
			logger.debug("2");
			model.addAttribute("state", "preiod");
			model.addAllAttributes(projectService.searchFilterPreiod(vo));
//			return "t/project/projectSearch";
		} else if ((!st.equals("") && end.equals("") || st.equals("0") && !end.equals(""))) {
			vo.setStart(st);
			vo.setEnd(end);
			logger.debug("3");
			model.addAttribute("state", "preiod");
			model.addAllAttributes(projectService.searchFilterPreiod(vo));
		}
		return "t/project/projectSearch";
	}

	// 필터 검색 - 페이징
	@RequestMapping("searchFilter")
	public String searchFilterPaging(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, @RequestParam(defaultValue = "0") String st,
			@RequestParam(defaultValue = "") String end, String p_filed, String state) {

		logger.debug("st : {} , end : {} ", st, end);
		logger.debug("state : {} ", state);
		// 필터 - 가격 검색
		if (state.equals("price")) {
			logger.debug("진입 1");
			return "redirect:/project/searchFilterPrice?page=" + page + "&pageSize=" + pageSize + "&st=" + st + "&end="
					+ end + "&state=" + state;
		} // 체크박스 필터일 때
		else if (state.equals("filed")) {
			logger.debug("filed ㅎㅎ : {} "+ p_filed);
			return "redirect:/project/searchFilterpfileds?page=" + page + "&pageSize=" + pageSize + "&p_filed=" + p_filed
					+ "&state=" + state;
		} // 필터 - 기간 검색
		else {
			return "redirect:/project/searchFilterPreiod?page=" + page + "&pageSize=" + pageSize + "&st=" + st + "&end="
					+ end + "&state=" + state;
		}
	}

	// 필터 체크박스 검색
	@RequestMapping(path = "searchFilterpfileds", method = RequestMethod.GET)
	public String searchFilterpfiled(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, String p_filed, String state, Model model,
			HttpSession session) {
		logger.debug("p_filed{}", p_filed);
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		if (p_filed == null || p_filed.equals("")) {
			return "redirect:/project/selectProject";
		} else {
			String[] p_fileds = p_filed.split(",");
			SearchVo searchVo = new SearchVo(page, pageSize, p_fileds.length);
			if (p_fileds.length == 1) {
				searchVo.setValue1(p_fileds[0]);
				logger.debug("한개 : {}", searchVo);
			} else if (p_fileds.length == 2) {
				searchVo.setValue1(p_fileds[0]);
				searchVo.setValue2(p_fileds[1]);
				logger.debug("두개 : {}", searchVo);
			} else if (p_fileds.length == 3) {
				searchVo.setValue1(p_fileds[0]);
				searchVo.setValue2(p_fileds[1]);
				searchVo.setValue3(p_fileds[2]);
				logger.debug("세개 : {}", searchVo);
			} else if (p_fileds.length == 4) {
				searchVo.setValue1(p_fileds[0]);
				searchVo.setValue2(p_fileds[1]);
				searchVo.setValue3(p_fileds[2]);
				searchVo.setValue4(p_fileds[3]);
				logger.debug("네개 : {}", searchVo);
			}
			model.addAttribute("state", state);
			model.addAttribute("chk", p_filed);
			logger.debug("p_filed 여기 : {} ", p_filed);
			model.addAttribute("p_filed", p_filed);
			model.addAllAttributes(projectService.searchFilterPfileds(searchVo));
		}
		return "t/project/projectSearch";
	}

//	// 사인 페이지
//	@RequestMapping("signPage")
//	public String signPage() {
//
//		return "t/project/siginPage";
//	}

	@RequestMapping(path="requestSend", method = RequestMethod.GET)
	public String requestSend(HttpSession session, Model model) {
		logger.debug("여기들어옴");
		model.addAttribute("projectTList", projectService.requestProjectList(((UserVo) session.getAttribute("S_USER")).getUser_id()));
				
		return "jsonView";
	}
	
	@RequestMapping(path="requestSend", method = RequestMethod.POST)
	public String requestSend(int p_code, String user_id, Model model) {
		
		int cnt = projectService.requestSend(new PAttendVo(p_code, user_id));
		model.addAttribute("cnt", cnt);
		logger.debug("요청전송cnt : {} ", cnt);
		return "jsonView";
	}
	
	//수정이가 씀 프로젝트 종료 버튼 클릭하면 프로젝트 상태와 유저 p_attend 상태가 평가 대기상태로 update 된다. 
	@RequestMapping(path="projectFinishButton" )
	public String projectFinishButton(int p_code , RedirectAttributes ra, Model model) {
		boolean check = true; 
		//프로젝트가 상태가 참여중이라면 
		//p_attend 랑 project 대기중으로 하기  
		ProjectVo projectVo = projectService.viewProject(p_code); 
		//6번 상태이면 진행중인상태 => 평가 대기로 변경해준다.  = 유저리스트로가서 평가버튼이 있는 페이지로 간다. 
		if(!projectVo.getP_state().equals(null) && projectVo.getP_state().equals("06") ) {
			projectService.beforefinishProject(p_code);
			return "redirect:/note/userList?p_code=" + p_code;
			
		}else if(!projectVo.getP_state().equals(null) && projectVo.getP_state().equals("07") )  {
			//07 이면 평가대기인 상태. => 회원들이 전부 평가가 완료되었는지 확인하기. 
			//p_attend 테이블의 p_state 가 10 인 (대기상태인) 사람들의 수 (=> 0 이면 최종 업데이트)
			int stateIsTenCount = projectService.checkPAttendFinish(p_code); 
				if(stateIsTenCount == 0 ) {
					//최종 프로젝트까지 완료했다는 것을 보이기 
					logger.debug("최종 프로젝트 파이널 완료"); 
				}else {
					//모든 파트너스의 평가가 완료 되어 있지 않으면 
					//alert 창을 띄워주면서 파트너스 평가를 완료하라고 해줌 
					logger.debug("모든 평가가 완료되어 있지 않으면");
					//평가한후 ㅍ로젝트 완료 버튼 누르게 만듬 
					check = false; 
				}
			
			if(check == true) {
				projectService.updateFinishProject(p_code);
				return "redirect:/note/viewMain?p_code=" + p_code; 
			}else {
				ra.addFlashAttribute("msg", "msg");
				return "redirect:/note/userList?p_code=" + p_code;
			}
			
		}
		
		return "redirect:/note/viewMain?p_code=" + p_code; 
		
	}
	
	//수정이가 씀 프로젝트 평가대기후 각 파트너스 평가 하기 
	
	@RequestMapping(path="starRating" , method = RequestMethod.POST)
	public String starRating(Model model, EvaluationVo evaluationVo  ) {
		int p_code = evaluationVo.getP_code();
		logger.debug("이거까지만하면 끝 {}");
		//(service 는 한개만 호출할거고 / service 에서 dao 여러개 호출할거다 (트랜잭션 제어를 service에 걸어놔서))
		//check  를 해봐야 한다. 이사람이 평가를 했는지. 혹시나 모르는 상황에 대비. 
		int checkAlreadyEval = projectService.checkAlreadyEval(evaluationVo); 
		if(checkAlreadyEval == 0 ) {
			//평균구하기
			double beforeAverage = (evaluationVo.getActivity() + evaluationVo.getComm() + evaluationVo.getOntime() + evaluationVo.getPro() + evaluationVo.getSat()) / 5.0 ; 
			evaluationVo.setAverage((double)Math.round(beforeAverage * 100) / 100);   
			
			projectService.partnersEvalFinish(evaluationVo); 
			
		}
		return "redirect:/note/userList?p_code=" + p_code ;
	}
}
