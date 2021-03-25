package kr.or.ddit.main;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.MessageService;

@Controller
@RequestMapping("main")
public class MainController {
	
	
	@Resource(name="messageService")
	private MessageService messageService;
	@Resource(name="projectService")
	private ProjectService projectService;
	
	@RequestMapping("view")
	public String main(Model model, HttpSession session) {
	    model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
	    return "main";
	}
	
	@RequestMapping("instruction")
	public String instruction(Model model, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
	    
		return "t/instruction";
		
	}
}
