package kr.or.ddit.login;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.email.MailSendService;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;

@Controller
@RequestMapping("login")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MailSendService mailsender;
	
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping("view")
	public String view() {
		return "login";
	}

	@RequestMapping("process")
	public String process(String user_id, String pass, HttpSession session,
							Model model, RedirectAttributes ra) {
		
		UserVo user = userService.loginUser(user_id);
		
		if(user != null && user.getPass().equals(pass)) {
			
			session.setAttribute("S_USER", user);
//			return "t/main";
			return "redirect:/main/view";
		} else {
			ra.addFlashAttribute("msg", "다시 입력하시오.");
			return "redirect:/login/view";
		}
	}
	
	// 회원가입 폼 출력
	@RequestMapping(path="signin", method = RequestMethod.GET)
	public String signup() {
		
		return "user/signin";
	}
	
	@RequestMapping("idcheck")
	public String idcheck(String user_id, Model model) {
		
		logger.debug("user_id : {} ", user_id);
		UserVo user = userService.selectUser(user_id);
		if(user == null) {
			model.addAttribute("msg", "사용가능한 아이디입니다.");
		} else {
			model.addAttribute("msg", "이미 존재하는 아이디입니다.");
		}
		
		return "jsonView";
	}
	
	@RequestMapping(path="signin", method = RequestMethod.POST)
	public String signin(Model model, UserVo user, RedirectAttributes ra, HttpServletRequest request) {
		
		logger.debug("user : {}", user);
		if(user.getGroup_nm() == null) {
			user.setGroup_nm("개인");
		}
		logger.debug("user : {}", user);
		int cnt = 0;
		
		try {
			cnt = userService.insertUser(user);
		} catch (Exception e) {
			cnt = 0;
		}
		
		if(cnt == 1) {
			mailsender.mailSendWithUserKey(user.getEmail(), user.getUser_id(), request);
			ra.addFlashAttribute("msg", "가입 완료! 이메일 인증 후 로그인 가능합니다.");
			return "redirect:/login/view";
		} else {
			return "redirect:/login/signin";
		}
		
	}
	
	@RequestMapping(path="idfind", method = RequestMethod.GET)
	public String idfind() {
		return "user/idfind";
	}
	
	@RequestMapping(path="idfind", method = RequestMethod.POST)
	public String idfind(UserVo user, Model model) {
		logger.debug("user:{}", user);
		
		List<String> useridList = userService.selectUserid(user);
		
		model.addAttribute("useridList", useridList);
		
		return "jsonView";
	}
	
	@RequestMapping(path="passfind", method = RequestMethod.GET)
	public String passfind() {
		return "user/passfind";
	}
	
	@RequestMapping(path="passfind", method = RequestMethod.POST)
	public String passfind(UserVo user, HttpServletRequest request, Model model) {
		
		// 해당 id와 email로 등록된 회원이 존재하는지 체크
		int cnt = userService.selectUserWhether(user);
		logger.debug("cnt : {}" , cnt);
		if(cnt == 1) {
			// 	비밀번호 랜덤함수로 업데이트
			mailsender.mailSendPass(user.getEmail(), user.getUser_id(), request);
		}			
		model.addAttribute("cnt", cnt);
		
		return "jsonView";
	}
	
	@RequestMapping("certified")
	public String certified(UserVo user, RedirectAttributes ra) {
		
		logger.debug("user: {}", user);
		
		int cnt = userService.updateUAct(user);
		if(cnt == 1) {
			String purpose = userService.userPurpose(user.getUser_id());
			// 사용자가 파트너스일 때 프로젝트 수행이력 테이블 생성
			if("P".equals(purpose)) {
				userService.insertHistory(user.getUser_id());
			}
			
			ra.addFlashAttribute("msg", "인증 완료되었습니다.");
		}
		return "redirect:/login/view";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session, RedirectAttributes ra) {
		
		session.invalidate();
		ra.addFlashAttribute("msg", "로그아웃되었습니다.");
		return "redirect:/login/view";
	}
}
