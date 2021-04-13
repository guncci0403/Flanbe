package kr.or.ddit.contract.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.contract.model.ContractVo;
import kr.or.ddit.contract.model.MeetingVo;
import kr.or.ddit.contract.service.ContractService;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.web.ProjectController;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.MessageService;
import kr.or.ddit.user.service.UserService;

@Controller
@RequestMapping("contract")
public class ContractController {

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "projectService")
	private ProjectService projectService;

	@Resource(name = "contractService")
	private ContractService contractService;

	@Resource(name = "messageService")
	private MessageService messageService;

	
	// 계약 프로젝트 페이지
	@RequestMapping("contractListP")
	public String contractListP(ProjectVo projectVo, String type, Model model, HttpSession session ) {
		
		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		
		model.addAttribute("alarmList", messageService.alarmMessage(user_id));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(user_id));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(user_id));
		}
		if("f".equals(type)) {
			model.addAttribute("contractList", contractService.completeContractListP(user_id));
		} else {
			model.addAttribute("contractList", contractService.ingContractListP(user_id));
		}
		
		model.addAttribute("type", type);
		return "t/contract/contractListP";
	}
	
	// 계약 프로젝트 페이지
	@RequestMapping("contractList")
	public String contractList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, 
//			@RequestParam(defaultValue = "04") String p_state, String p_state2, String p_state3, String type,
			ProjectVo projectVo, String type,
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
		projectVo.setPage(page);
		projectVo.setPageSize(pageSize);
		logger.debug("projcetVo : {} ",projectVo);
		logger.debug("type : {} ", type);
		if("f".equals(type)) {
			logger.debug("타입이 f");
			String p_state = "06";
			String p_state2 = "07";
			String p_state3 = "09";
			projectVo.setP_state(p_state);
			projectVo.setP_state2(p_state2);
			projectVo.setP_state3(p_state3);
//			project = projectVo(p_state, p_state2, p_state3);
		} else {
			logger.debug("타입이 s");
			String p_state = "04";
			projectVo.setP_state(p_state);
		}
		model.addAllAttributes(projectService.contractProjectList(projectVo));
		logger.debug("여기1");
		if (projectVo.getP_state().equals("04")) { // project state 는 p_state
			model.addAttribute("state1", "06"); // p_attend p_state 는 state1,2,3으로 표시
			model.addAttribute("state2", "08");
			model.addAttribute("state3", "09");
			model.addAttribute("type", "s");
		} else {
			model.addAttribute("state1", "04");
			model.addAttribute("state2", "05");
			model.addAttribute("state3", "09");
			model.addAttribute("type", "f");
		}
		return "t/contract/contractList";
	}

	// 계약 프로젝트 페이지
	@RequestMapping("selectContractUser")
	public String selectContractUser(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int pageSize, ProjectVo projectVo, Model model, String state1,
			String state2, String state3, String type, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		logger.debug("여기여기여기 : {}", projectVo );
		model.addAttribute("p_state", projectVo.getP_state());
		logger.debug("p_state:{}", projectVo.getP_state());
		logger.debug("userid:{}", projectVo.getUser_id());

		if (type.equals("s")) {
			model.addAttribute("type", "s"); // 계약 중 type - s
		} else {
			model.addAttribute("type", "f"); // 계약 완료 type - f
		}
		model.addAllAttributes(
				contractService.selectContractUser(new ProjectVo(projectVo.getP_code(), state1, state2, state3)));
		model.addAttribute("state1", state1);
		model.addAttribute("state2", state2);
		model.addAttribute("state3", state3);
		return "t/contract/contractUserList";
	}

	// 미팅완료 상태 변경
	@RequestMapping("updateMeetFinish")
	public String updateMeetFinish(Model model, UserVo userVo, String type, String state1, String state2, String state3,
			RedirectAttributes ra) {

		int updateCnt = contractService.updateMeetFinish(new UserVo(userVo.getUser_id(), userVo.getP_code()));
		logger.debug("cnt : {}", updateCnt);
		if (updateCnt == 1) {
			ra.addFlashAttribute("msg", "변경 되었습니다.");
			return "redirect:/contract/selectContractUser?user_id=" + userVo.getUser_id() + "&p_code="
					+ userVo.getP_code() + "&state1=" + state1 + "&state2=" + state2 + "&state3=" + state3 + "&type="
					+ type;
		}
		return "redirect:/contract/selectContractUser?user_id=" + userVo.getUser_id() + "&p_code=" + userVo.getP_code()
				+ "&state1=" + state1 + "&state2=" + state2 + "&state3=" + state3 + "&type=" + type;
	}

	// 탈락 상태 변경
	@RequestMapping("updateUserDelete")
	public String updateUserDelete(Model model, UserVo userVo, String type, String state1, String state2, String state3,
			RedirectAttributes ra) {
		int updateCnt = contractService.updateUserDelete(new UserVo(userVo.getUser_id(), userVo.getP_code()));
		logger.debug("cnt : {}", updateCnt);
		if (updateCnt == 1) {
			ra.addFlashAttribute("msg", "탈락 되었습니다.");
			return "redirect:/contract/selectContractUser?user_id=" + userVo.getUser_id() + "&p_code="
					+ userVo.getP_code() + "&state1=" + state1 + "&state2=" + state2 + "&state3=" + state3 + "&type="
					+ type;
		}
		return "redirect:/contract/selectContractUser?user_id=" + userVo.getUser_id() + "&p_code=" + userVo.getP_code()
				+ "&state1=" + state1 + "&state2=" + state2 + "&state3=" + state3 + "&type=" + type;
	}

	// 계약서 작성 페이지
	@RequestMapping(path="insertContract", method = RequestMethod.GET)
	public String insertContract(String user_id, int p_code, String p_title, String client_id, Model model, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		// 사인페이지에 가져오는 param
//			user_id=${user.user_id}&p_title=${pVo.p_title }&p_code=${pVo.p_code }&client_id=${S_USER.user_id}
		model.addAttribute("pVo", projectService.viewProject(p_code));
		model.addAttribute("partner", userService.selectUser(user_id));
		model.addAttribute("client", userService.selectUser(client_id));
		return "t/contract/contract";
	}

	@RequestMapping(path="insertContract", method = RequestMethod.POST)
	public String insertContract(Model model, ContractVo contract) {
		logger.debug("contract : {} ", contract);
		int cnt = contractService.registContract(contract);
		// p_code , user_id, p_state
		model.addAttribute("p_code", contract.getP_code());
		model.addAttribute("puser_id", contract.getPuser_id());
		
		return "redirect:/contract/view";
	}
	// 계약서 조회 페이지
	@RequestMapping("view")
	public String signPageView(Model model, String puser_id, int p_code, HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		
		model.addAttribute("contract", contractService.viewContract(new ContractVo(p_code, puser_id)));
		return "t/contract/viewContract";
	}

	@RequestMapping("calendar")
	public String calendar(Model model, MeetingVo meetingVo, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
			model.addAttribute("Mtdt", contractService.calendarListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
			model.addAttribute("Mtdt", contractService.calendarListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		
		return "t/meeting/calendar";
	}

	@RequestMapping(path = "updatemeeting", method = RequestMethod.GET)
	public String updatemeeting(Model model, MeetingVo meetingVo, int m_no, RedirectAttributes ra) {
//	      logger.debug("m_no : {} " , m_no);
//	      logger.debug("여기 들어왔는지 확인 :{} ", meetingVo);
		model.addAttribute("view", contractService.meetingview(m_no));

		return "meeting/updateMeeting";
	}

	@RequestMapping(path = "updatemeeting", method = RequestMethod.POST)
	public String updatemeeting2(Model model, MeetingVo meetingVo, RedirectAttributes ra) {
		logger.debug("여기 들어왔어?");
		logger.debug("mettingVo : {} ", meetingVo);
		int updateCnt = contractService.calendarupdate(meetingVo);

		if (updateCnt == 1) {
			logger.debug("여기 들어왔어?2:{}", updateCnt);
	         ra.addFlashAttribute("msg", "수정완료.");
			return "jsonView";
		}
		return "meeting/calendar";
	}

	@RequestMapping(path="viewmeeting", method=RequestMethod.GET)
	public String viewmeeting(Model model, int m_no, HttpSession session) {
		
		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		
		model.addAttribute("alarmList", messageService.alarmMessage(user_id));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(user_id));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(user_id));
		}
		
		ProjectVo projectvo = new ProjectVo();
		projectvo.setUser_id(user_id);
		
		model.addAttribute("view", contractService.meetingview(m_no));
//		logger.debug("m_no{}:", m_no);
		
		return "meeting/viewMeeting";
	}
	
	@RequestMapping("updateContract")
	public String updateContract(ContractVo contract, RedirectAttributes ra) {
		logger.debug("ContractVo : {} ", contract);
		contract.setS_no("02");
		
		int cnt = contractService.updateContract(contract);
		if(cnt == 1) {
			ra.addFlashAttribute("msg", "승인되었습니다.");
		} 
		return "redirect:/contract/contractListP?type=s";
	}
}
