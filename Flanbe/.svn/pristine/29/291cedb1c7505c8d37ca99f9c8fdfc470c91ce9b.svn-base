package kr.or.ddit.user.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.user.model.MessageVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.MessageService;

@Controller
@RequestMapping("message")
public class MessageController {

	@Resource(name="messageService")
	private MessageService messageService;
	@Resource(name="projectService")
	private ProjectService projectService;
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	//쪽지 메인
	@RequestMapping(path="main", method= {RequestMethod.GET})
	public String messageView(Model model, HttpSession session, @RequestParam(defaultValue = "1") int num) {
		
		String user_id = ((UserVo)session.getAttribute("S_USER")).getUser_id();
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		logger.debug("num:{}", num);
		
		model.addAttribute("alarmList", messageService.alarmMessage(user_id)); //추가
		model.addAttribute("messagecont", messageService.countMessage(user_id));
		
		if(num == 1) {
			model.addAttribute("messageList", messageService.inboxMessage(user_id));
		} else {
			model.addAttribute("messageList", messageService.sentMessage(user_id));
			model.addAttribute("num", num);
		}
		
		return "t/message/messageMain";
	}
	
	//상세 쪽지
	@RequestMapping("messagedetail")
	public String messageDetail(int m_no, HttpSession session, Model model) {
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		
		MessageVo message = messageService.detailMessage(m_no);
		model.addAttribute("messagecont", messageService.countMessage(((UserVo)session.getAttribute("S_USER")).getUser_id())); 
		model.addAttribute("detailList", message);
		
		logger.debug("messsageVo : {}", message);
		
		if(!((UserVo) session.getAttribute("S_USER")).getUser_id().equals(message.getS_id()) ){
			messageService.stateMessage(m_no);
		}
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo)session.getAttribute("S_USER")).getUser_id())); 
		
		return "t/message/messageDetail";
	}
	
	//쪽지 삭제
	@RequestMapping("messageDelete")
	public String messageDelete(MessageVo messageVo, String user_id) {  
		
		int deleteCnt = 0;
		
		try {
			deleteCnt = messageService.deleteMessage(messageVo.getM_no());
		} catch (Exception e) {
			deleteCnt = 1;
		}
		if(deleteCnt == 1) {    
			return "redirect:/message/main?user_id="+user_id;
		}else {
			return "redirect:/message/main?user_id="+user_id;
		}
	}
	
	//쪽지 작성
	@RequestMapping(path="messageRegist" , method = {RequestMethod.POST})
	public String messageRegist(MessageVo messageVo, int m_no) {
		
		logger.debug("messageRegist : {} " , messageVo);
		
		int insertCnt = 0;
		
		insertCnt = messageService.registMessage(messageVo);
		
		if(insertCnt == 1) {
			return "redirect:/message/main?user_id="+messageVo.getS_id();
		} else {
			return "t/message/messageDetail?m_no="+messageVo.getM_no();
		}
	}
	
	@RequestMapping("messageSend")
	public String messageSend(MessageVo messageVo, HttpSession session, Model model) {
		String user_id = ((UserVo)session.getAttribute("S_USER")).getUser_id();
		messageVo.setS_id(user_id);
		logger.debug("메시지 전송 폼 : {} ", messageVo);
		int cnt = messageService.registMessage(messageVo);
		logger.debug("cnt : {} ", cnt);
		model.addAttribute("cnt", cnt);
		
		return "jsonView";
	}
}