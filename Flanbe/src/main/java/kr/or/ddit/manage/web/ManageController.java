package kr.or.ddit.manage.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.contract.model.ContractVo;
import kr.or.ddit.contract.service.ContractService;
import kr.or.ddit.manage.service.ManageService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.MessageService;

@Controller
@RequestMapping("manage")
public class ManageController {

	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@Resource(name = "manageService")
	private ManageService manageService;
	@Resource(name = "projectService")
	private ProjectService projectService;
	@Resource(name = "messageService")
	private MessageService messageService;
	@Resource(name = "contractService")
	private ContractService contractService;
	
	@RequestMapping("userList")
	public String userList(Model model,  @RequestParam(defaultValue = "C") String div, HttpSession session) {
		// 모든 컨트롤러에서 쓰이는 것 ( 안읽은 쪽지 리스트, 참여중인 프로젝트 리스트 불러오는 부분)
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
//		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
//	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
//	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
//	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
//	    }
		logger.debug("div : {}", div);
		model.addAttribute("dv", div);
		model.addAttribute("userList", manageService.selectUserList(div));
		
		return "t/manage/userList";
	}
	
	@RequestMapping("requestProjectList")
	public String requestProjectList(Model model, HttpSession session) {
		// 모든 컨트롤러에서 쓰이는 것 ( 안읽은 쪽지 리스트, 참여중인 프로젝트 리스트 불러오는 부분)
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
//		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
//	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
//	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
//	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
//	    }
		
		
		model.addAttribute("projectList", manageService.requestProjectList());
		
		return "t/manage/requestProjectList";
	}
	
	@RequestMapping("viewProject")
	public String viewProject(Model model, int p_code, HttpSession session) {
		// 모든 컨트롤러에서 쓰이는 것 ( 안읽은 쪽지 리스트, 참여중인 프로젝트 리스트 불러오는 부분)
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
//		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
//	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
//	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
//	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
//	    }
		model.addAttribute("project",  projectService.viewProject(p_code));
		model.addAttribute("pskill", projectService.listPskill(p_code));
		return "t/manage/projectView";
	}
	
	@RequestMapping("approvalProject")
	public String approvalProject(int p_code, RedirectAttributes ra) {
		
		int cnt = manageService.approvalProject(p_code); 
		if(cnt == 1) {
			ra.addFlashAttribute("msg", "승인되었습니다.");
			return "redirect:/manage/requestProjectList";
		}
		return "redirect:/manage/viewProject?p_code="+ p_code;
	}
	
	@RequestMapping("refusalProject")
	public String refusalProject(int p_code, RedirectAttributes ra) {
		
		int cnt = manageService.refusalProject(p_code);
		if(cnt == 1) {
			ra.addFlashAttribute("msg", "거부되었습니다.");
			return "redirect:/manage/requestProjectList";
		}
		return "redirect:/manage/viewProject?p_code="+ p_code;
	}
	
	@RequestMapping("requestContractList")
	public String requestContractList(Model model, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		model.addAttribute("contractList", manageService.requestContractList());
		
		return "t/manage/requestContractList";
	}
	
	// 계약서 조회 페이지
	@RequestMapping("contractView")
	public String signPageView(Model model, String puser_id, int p_code, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		
		model.addAttribute("contract", contractService.viewContract(new ContractVo(p_code, puser_id)));
		return "t/manage/contractView";
	}
	
	@RequestMapping("updateContract")
	public String updateContract(ContractVo contract, RedirectAttributes ra) {
		logger.debug("ContractVo : {} ", contract);
		contract.setS_no("03");
		
		int cnt = contractService.updateContract(contract);
		if(cnt == 1) {
			ra.addFlashAttribute("msg", "승인되었습니다.");
			manageService.updateState(contract);
		} 
		return "redirect:/manage/requestContractList";
	}
	
	
}
