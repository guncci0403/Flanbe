package kr.or.ddit.user.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.model.AttachVo;
import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.common.model.SearchVo;
import kr.or.ddit.evaluation.model.EvaluationVo;
import kr.or.ddit.evaluation.repository.EvaluationDao;
import kr.or.ddit.evaluation.service.EvaluationService;
import kr.or.ddit.project.model.ProjectVo2;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.user.model.CareerVo;
import kr.or.ddit.user.model.HistoryVo;
import kr.or.ddit.user.model.PortfolioVo;
import kr.or.ddit.user.model.USkillVo;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.MessageService;
import kr.or.ddit.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "messageService")
	private MessageService messageService;
	@Resource(name = "projectService")
	private ProjectService projectService;
	
	@Resource(name="evaluationdaoimpl")
	private EvaluationDao evaluationDao;
	@Resource(name="evaluationserviceimpl")
	private EvaluationService evaluationService;
	
	@RequestMapping("partnerList")
	public String partnerList(Model model, @RequestParam(defaultValue = "1") int page, HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		model.addAllAttributes(userService.selectPartnerList(new PageVo(page, 12)));

		return "t/user/partnerList";
	}

	@RequestMapping("searchPartnerList")
	public String searchPartnerList(Model model, String keyword, String searchType, HttpSession session) {
		model.addAttribute("alarmList",
				messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList",
					projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if (((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList",
					projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		if (keyword.equals("") || searchType.equals("")) {
			logger.debug("입력안했을 경우 ");
			return "redirect:/user/partnerList";
		} else if (searchType.equals("id")) {
			model.addAttribute("partnerList", userService.idsearchPartnerList(keyword));
		} else {
			model.addAttribute("partnerList", userService.tnmsearchPartnerList(keyword));
		}
		model.addAttribute("sT", searchType);
		model.addAttribute("kW", keyword);

		return "t/user/partnerList";
	}

	@RequestMapping("filterPartner")
	public String filterPartner(Model model, String value, @RequestParam(defaultValue = "1") int page,
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

		logger.debug("value :{} ", value);

		if (value.equals("")) {
			return "redirect:/user/partnerList?page=" + page;
		} else if (("S").equals(value) || ("T").equals(value)) {

			model.addAllAttributes(userService.filterPartnerList(new PageVo(page, 8, value)));

		} else {
			logger.debug("else ,,, value : {} ", value);
			String[] values = value.split(",");
			SearchVo search = new SearchVo(page, 8, values.length);
			if (values.length == 1) {
				search.setValue1(values[0]);
				logger.debug("한개 일 때 : {}", search);
			} else if (values.length == 2) {
				search.setValue1(values[0]);
				search.setValue2(values[1]);
				logger.debug("두개 일 때 : {}", search);
			} else if (values.length == 3) {
				search.setValue1(values[0]);
				search.setValue2(values[1]);
				search.setValue3(values[2]);
				logger.debug("세개 일 때 : {}", search);
			} else {
				search.setValue1(values[0]);
				search.setValue2(values[1]);
				search.setValue3(values[2]);
				search.setValue4(values[3]);
				logger.debug("네개 일 때 : {}", search);
			}
			model.addAllAttributes(userService.skilFilterList(search));
		}
		model.addAttribute("val", value);

		return "t/user/partnerList";
	}


	/**
	 * 건영형
	 */
	@RequestMapping("profile")
	   public String profile(@RequestParam(defaultValue = "me") String user_id, HttpSession session, Model model) {
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

	      // 회원정보
	      if (user_id.equals("me")) {
	         user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
	      }
	      model.addAttribute("user", userService.selectUser(user_id));
	      
	      // 진행한 프로젝트 여부체크
	      int cntJoinProj = userService.countJoinProject(user_id);
	      model.addAttribute("cntJoinProj", cntJoinProj);

	      // 진행한 프로젝트 분야 차트
	      HistoryVo historyVo = userService.selectProjectHistory(user_id);
	      logger.debug("historyVo : {}", historyVo);

	      Map<String, Object> h_map = new HashMap<>();
	      h_map.put("web", historyVo.getH_web());
	      h_map.put("app", historyVo.getH_app());
	      h_map.put("pub", historyVo.getH_pub());
	      h_map.put("game", historyVo.getH_game());
	      h_map.put("etc", historyVo.getH_etc());

	      model.addAttribute("historyMap", h_map);
	      
	      
	      // 프로젝트 세부 항목 평가 차트
	      // 전문성등등 평가 평균 부분 가지고 오기
	      EvaluationVo evalVo = evaluationService.selectEvaluation(user_id);
	      if(evalVo != null) {
	         evalVo.setUser_id(user_id);
	      }
	      model.addAttribute("evalVo", evalVo);
	      
	      //2) 파트너스의 전체 참여 프로젝트에대한 총 평가 평균
	      double averageEvaluation = Math.round(evaluationDao.averageEvaluation(user_id) * 100) / 100;  
	      logger.debug("averageEvaluation: {}", averageEvaluation);
	      
	      
	      //빈별을 찍어야 하는 갯수 
	      int emptyStar = 0 ; 
	      if((int)averageEvaluation == 5) {
	         emptyStar = 0 ; 
	      }else if((int)averageEvaluation == 0) {
	         emptyStar = 5 ; 
	      }else {
	         emptyStar = 5 - (int)averageEvaluation;  
	      }
	      logger.debug("emptyStar: {}",emptyStar);
	      
	      model.addAttribute("averageEvaluation", averageEvaluation);
	      model.addAttribute("emptyStar", emptyStar); 
	      
	      //최신등록순 프로젝트 리스트
	      List<ProjectVo2> ListProjectVo2 = null;
	      ListProjectVo2 = evaluationService.selectLatestProjectEval2(user_id);
	         
	      System.out.println(ListProjectVo2);
	      model.addAttribute("projectEvalList", ListProjectVo2);
	      
	      
	      // 포트폴리오
	      model.addAttribute("popolVo", userService.selectPopol(user_id));
	      model.addAttribute("reprePopolVo", userService.selectReprePopol(user_id));
	      // 보유 기술
	      model.addAttribute("skillList", userService.selectSkillList(user_id));
	      // 경력
	      model.addAttribute("careerList", userService.selectCareerList(user_id));
	      // 경력 년수
	      model.addAttribute("careerDate", userService.selectCareerDate(user_id));
	      // 평가
	      return "t/profile/profile";
	   }

///////////////////////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping("intro")
	public String intro(@RequestParam(defaultValue = "me") String user_id, HttpSession session, Model model) {
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

		if (user_id.equals("me")) {
			user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		}
		model.addAttribute("user", userService.selectUser(user_id));
		return "t/profile/intro";
	}

	@RequestMapping(path = "updateIntro", method = RequestMethod.POST)
	public String updateIntro(UserVo userVo, HttpSession session, Model model) {
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

		logger.debug("userVo : {}", userVo);
		// update 작업
		int updateCnt = 0;
		try {
			updateCnt = userService.updateIntro(userVo);
			logger.debug("insertcnt :{} ", updateCnt);
		} catch (Exception e) {
			e.printStackTrace();
			updateCnt = 0;
		}
		if (updateCnt == 1) {
			model.addAttribute("msg", "수정 성공!!");
			model.addAttribute("user", userService.selectUser(userVo.getUser_id()));
			return "profile/introAjax";
		} else {
			model.addAttribute("msg", "수정 실패!!");
			model.addAttribute("user", userService.selectUser(userVo.getUser_id()));
			return "profile/introAjax";
		}
	}

	@RequestMapping(path = "updateInfo", method = RequestMethod.GET)
	public String updateInfo(HttpSession session, Model model) {
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

		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		model.addAttribute("user", userService.selectUser(user_id));
		return "t/profile/updateInfo";
	}

	@RequestMapping(path = "updateInfo", method = RequestMethod.POST)
	public String updateInfo(UserVo userVo, MultipartFile p_route, HttpSession session, Model model,
			RedirectAttributes ra) {
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

		if (userVo.getGroup_nm() == null) {
			userVo.setGroup_nm("개인");
		}
		logger.debug("userVo : {}", userVo);
		int updateCnt = 0;
		String originalFilename = "";
		String filename = "";
		logger.debug("p_route : {}", p_route);
		if (p_route.getSize() > 0) {
			originalFilename = p_route.getOriginalFilename();
			filename = UUID.randomUUID().toString() + "."
					+ originalFilename.substring(originalFilename.lastIndexOf(".") + 1);

//			userVo.setPhotoroute("d:\\upload\\" + filename);
			userVo.setPhotoroute("C:\\LastProject\\upload\\" + filename);
			System.out.println(userVo);

			try {
				p_route.transferTo(new File(userVo.getPhotoroute()));

			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} else {
			filename = userVo.getPhotoroute();
			userVo.setPhotoroute(filename);
		}

		try {
			updateCnt = userService.updateInfo(userVo);
			logger.debug("updateCnt : {}", updateCnt);
			System.out.println(userVo);
		} catch (Exception e) {
			e.printStackTrace();
			updateCnt = 0;
		}
		if (updateCnt == 1) {
			return "redirect:/user/updateInfo";
		} else {
			return "redirect:/user/updateInfo";
		}
	}

	@RequestMapping("pass")
	public String pass(HttpSession session, Model model) {
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

		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		model.addAttribute("user", userService.selectUser(user_id));
		return "t/profile/pass";
	}

	@RequestMapping(path = "changePass", method = RequestMethod.POST)
	public String changePass(HttpSession session, Model model) {
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
		
		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();

		model.addAttribute("user", userService.selectUser(user_id));
		return "t/profile/changePass";
	}

	@RequestMapping(path = "changePassComplete", method = RequestMethod.POST)
	public String changePassComplete(UserVo userVo, HttpSession session, Model model, RedirectAttributes ra) {
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

		logger.debug("userVo : {}", userVo);
		int updateCnt = 0;
		try {
			updateCnt = userService.changePass(userVo);
		} catch (Exception e) {
			e.printStackTrace();
			updateCnt = 0;
		}
		if (updateCnt == 1) {
			return "redirect:/user/pass";
		} else {
			return "redirect:/user/changePass";
		}
	}

	@RequestMapping(path = "deleteUser", method = RequestMethod.GET)
	public String deleteUser(HttpSession session, Model model) {
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

		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		model.addAttribute("user", userService.selectUser(user_id));
		return "t/profile/deleteUser";
	}

	@RequestMapping(path = "deleteUser", method = RequestMethod.POST)
	public String deleteUser(String user_id, HttpSession session, Model model, RedirectAttributes ra) {
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

		logger.debug("user_id : {}", user_id);
		int updateCnt = 0;
		try {
			updateCnt = userService.deleteUser(user_id);
			System.out.println(updateCnt);
		} catch (Exception e) {
			e.printStackTrace();
			updateCnt = 0;
		}
		if (updateCnt == 1) {
			return "redirect:/login/view";
		} else {
			return "redirect:/user/deleteUser";
		}
	}

	@RequestMapping("profileImg")
	public void profileImg(HttpServletResponse resp, String user_id, HttpServletRequest req) {

		resp.setContentType("image");

		// userid 파라미터를 이용하여
		// userService 객체를 통해 사용자의 사진 파일 이름을 획득
		// 파일 입출력을 통해 사진을 읽어들여 resp객체의 outputStream으로 응답 생성

		UserVo userVo = userService.selectUser(user_id);

		String path = "";
		if (userVo.getPhotoroute() == null) {
			path = req.getServletContext().getRealPath("/images/unknown.png");
		} else {
			path = userVo.getPhotoroute();
		}

//		logger.debug("path : {}", path);

		try {
			FileInputStream fis = new FileInputStream(path);
			ServletOutputStream sos = resp.getOutputStream();

			byte[] buff = new byte[512];
			while (fis.read(buff) != -1) {
				sos.write(buff);
			}

			fis.close();
			sos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("passCheck")
	public String passCheck(String pass, HttpSession session, Model model) {

		logger.debug("pass : {} ", pass);
		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		UserVo user = userService.selectUser(user_id);
		logger.debug("userpass : {} ", user.getPass());

		if (!user.getPass().equals(pass)) {
			model.addAttribute("msg", "잘못된 비밀번호를 입력하였습니다.");
		} else {
			model.addAttribute("msg", "정말로 탈퇴하시겠습니까?");
		}
		return "jsonView";

	}

	@RequestMapping("passCheck2")
	public String passCheck2(String pass, HttpSession session, Model model) {

		logger.debug("pass : {} ", pass);
		String user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		UserVo user = userService.selectUser(user_id);
		logger.debug("userpass : {} ", user.getPass());

		if (!user.getPass().equals(pass)) {
			model.addAttribute("msg", "잘못된 비밀번호를 입력하였습니다.");
		}
		return "jsonView";
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("joinProject")
	public String joinProject(@RequestParam(defaultValue = "me") String user_id, HttpSession session,
			@RequestParam(defaultValue = "1") int page, Model model) {
		// 공통 //
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}	

		if (user_id.equals("me")) {
			user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		}
		model.addAttribute("user", userService.selectUser(user_id));

		// 진행한 프로젝트 갯수
		int cntJoinProj = userService.countJoinProject(user_id);

		// 누적 프로젝트 금액
		int sumMoney = userService.sumMoney(user_id);

		// 프로젝트 평균 금액
		int avgMoney = userService.avgMoney(user_id);

		// 프로젝트 평균 기간
		int avgPeriod = userService.avgPeriod(user_id);

		// 진행한 프로젝트 분야
		HistoryVo historyVo = userService.selectProjectHistory(user_id);
		logger.debug("historyVo : {}", historyVo);

		// 총합계
		double total = historyVo.getH_app() + historyVo.getH_web() + historyVo.getH_pub() + historyVo.getH_game()
				+ historyVo.getH_etc();

//		//각각 퍼센트로 변환-소수 두째자리에서 반올림 //그래프를 백분율로 표시하고 싶을때 사용
//		double web = Math.round((double)historyVo.getH_web()/total * 100 * 10) / 10;
//		double app = Math.round((double)historyVo.getH_app()/total * 100 * 10) / 10;
//		double pub = Math.round((double)historyVo.getH_pub()/total * 100 * 10) / 10; 
//		double game = Math.round((double)historyVo.getH_game()/total * 100 * 10) / 10; 
//		double etc =  Math.round((double)historyVo.getH_etc()/total * 100 * 10) / 10; 

//		Map<String, Object> h_map = new HashMap<>();
//		h_map.put("web", web);
//		h_map.put("app", app);
//		h_map.put("pub", pub);
//		h_map.put("game", game);
//		h_map.put("etc", etc);

		Map<String, Object> h_map = new HashMap<>();
		h_map.put("web", historyVo.getH_web());
		h_map.put("app", historyVo.getH_app());
		h_map.put("pub", historyVo.getH_pub());
		h_map.put("game", historyVo.getH_game());
		h_map.put("etc", historyVo.getH_etc());

		// 진행한 프로젝트 리스트 페이징 처리
		PageVo pageVo = new PageVo(page, 3);
		pageVo.setUser_id(user_id);
		Map<String, Object> p_map = userService.joinProjectPaging(pageVo);
		int cnt = (int) p_map.get("cnt");
		model.addAttribute("pagination", (int) Math.ceil((double) cnt / 3));
		model.addAttribute("projectMap", p_map.get("projectList"));
		model.addAttribute("page", pageVo);

		model.addAttribute("cntJoinProj", cntJoinProj);
		model.addAttribute("sumMoney", sumMoney);
		model.addAttribute("avgMoney", avgMoney);
		model.addAttribute("avgPeriod", avgPeriod);
		model.addAttribute("historyMap", h_map);

		return "t/profile/joinProject";
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("career")
	public String career(@RequestParam(defaultValue = "me") String user_id, HttpSession session, Model model) {
		// 공통 //
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}

		if (user_id.equals("me")) {
			user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		}
		model.addAttribute("user", userService.selectUser(user_id));
		model.addAttribute("careerList", userService.selectCareerList(user_id));
		// 경력 년수
		model.addAttribute("careerDate", userService.selectCareerDate(user_id));
		return "t/profile/career";
	}

	@RequestMapping(path = "insertCareer", method = RequestMethod.POST)
	public String insertCareer(CareerVo careerVo, HttpSession session, Model model) {
		logger.debug("careerVo : {}", careerVo);
		// insert 작업
		int insertCnt = 0;
		try {
			insertCnt = userService.insertCareer(careerVo);
			logger.debug("insertcnt :{} ", insertCnt);
		} catch (Exception e) {
			e.printStackTrace();
			insertCnt = 0;
		}
		if (insertCnt == 1) {
			model.addAttribute("msg", "추가 성공!!");
			// model.addAttribute("user_id", careerVo.getUser_id());
			model.addAttribute("careerList", userService.selectCareerList(careerVo.getUser_id()));
			return "profile/careerListAjax";
		} else {
			model.addAttribute("msg", "추가 실패!!");
			// model.addAttribute("user_id", careerVo.getUser_id());
			model.addAttribute("careerList", userService.selectCareerList(careerVo.getUser_id()));
			return "profile/careerListAjax";
		}
	}

	@RequestMapping("deleteCareer")
	public String deleteCareer(int c_no, RedirectAttributes ra) {
		int deleteCnt = 0;
		try {
			deleteCnt = userService.deleteCareer(c_no);
		} catch (Exception e) {
			e.printStackTrace();
			deleteCnt = 0;
		}
		ra.addFlashAttribute("cnt", deleteCnt);

		return "jsonView";
	}

	@RequestMapping(path = "updateCareer", method = RequestMethod.POST)
	public String updateCareer(CareerVo careerVo, HttpSession session, Model model) {
		logger.debug("careerVo : {}", careerVo);
		// update 작업
		int updateCnt = 0;
		try {
			updateCnt = userService.updateCareer(careerVo);
			logger.debug("updateCnt :{} ", updateCnt);
		} catch (Exception e) {
			e.printStackTrace();
			updateCnt = 0;
		}
		if (updateCnt == 1) {
			model.addAttribute("msg", "수정 성공!!");
			// model.addAttribute("user_id", careerVo.getUser_id());
			model.addAttribute("careerList", userService.selectCareerList(careerVo.getUser_id()));
			return "profile/careerListAjax";
		} else {
			model.addAttribute("msg", "수정 실패!!");
			// model.addAttribute("user_id", careerVo.getUser_id());
			model.addAttribute("careerList", userService.selectCareerList(careerVo.getUser_id()));
			return "profile/careerListAjax";
		}
	}

///////////////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping("skill")
	public String skill(@RequestParam(defaultValue = "me") String user_id, HttpSession session, Model model) {
		// 공통 //
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}

		if (user_id.equals("me")) {
			user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		}
		model.addAttribute("user", userService.selectUser(user_id));
		model.addAttribute("skillList", userService.selectSkillList(user_id));
		return "t/profile/skill";
	}

	@RequestMapping("deleteSkill")
	public String deleteSkill(int us_no, RedirectAttributes ra) {
		int deleteCnt = 0;
		try {
			deleteCnt = userService.deleteSkill(us_no);
		} catch (Exception e) {
			e.printStackTrace();
			deleteCnt = 0;
		}
		ra.addFlashAttribute("cnt", deleteCnt);

		return "jsonView";
	}

	@RequestMapping("insertSkill")
	public String insertSkill(USkillVo uskillVo, String etc, Model model) {
		logger.debug("uskillVo : {}", uskillVo);
		logger.debug("etc : {}", etc);
		if (uskillVo.getUs_kind().equals("05") && !etc.equals("")) {
			uskillVo.setUs_kind(etc);
		}
		// update 작업
		int updateCnt = 0;
		try {
			updateCnt = userService.updateSkill(uskillVo);
			logger.debug("updateCnt :{} ", updateCnt);
		} catch (Exception e) {
			e.printStackTrace();
			updateCnt = 0;
		}
		if (updateCnt == 1) {
			model.addAttribute("msg", "수정 성공!!");
			model.addAttribute("user", userService.selectUser(uskillVo.getUser_id()));
			model.addAttribute("skillList", userService.selectSkillList(uskillVo.getUser_id()));
			return "profile/skillListAjax";
		} else {
			// insert 작업
			int insertCnt = 0;
			try {
				insertCnt = userService.insertSkill(uskillVo);
				logger.debug("insertcnt :{} ", insertCnt);
			} catch (Exception e) {
				e.printStackTrace();
				insertCnt = 0;
			}
			if (insertCnt == 1) {
				model.addAttribute("msg", "추가 성공!!");
				model.addAttribute("user", userService.selectUser(uskillVo.getUser_id()));
				model.addAttribute("skillList", userService.selectSkillList(uskillVo.getUser_id()));
				return "profile/skillListAjax";
			} else {
				model.addAttribute("msg", "추가 실패!!");
				model.addAttribute("user", userService.selectUser(uskillVo.getUser_id()));
				model.addAttribute("skillList", userService.selectSkillList(uskillVo.getUser_id()));
				return "profile/skillListAjax";
			}
		}

	}
	
	/**
	 * 수연
	 */
	//포트폴리오 메인
	@RequestMapping(path="mainpopol" , method= {RequestMethod.GET})
	public String mainpopol(@RequestParam(defaultValue = "me") String user_id,
						    Model model, HttpSession session) {
		// 공통 //
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}

	      // 회원정보
	      if (user_id.equals("me")) {  
	         user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
	      }
	      model.addAttribute("user", userService.selectUser(user_id));
	      logger.debug("user:{}", userService.selectUser(user_id));
	      model.addAttribute("popolVo", userService.selectPopol(user_id));
	      model.addAttribute("reprePopolVo", userService.selectReprePopol(user_id));
		return "t/profile/mainPopol";
	}
	
	//포트폴리오 등록 화면
	@RequestMapping(path="registpopolView", method= {RequestMethod.GET})
	public String registpopolView(@RequestParam(defaultValue = "me") String user_id, Model model,HttpSession session) {
		// 공통 //
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		// 회원정보
		if (user_id.equals("me")) {  
           user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
        }
        model.addAttribute("user", userService.selectUser(user_id));
		return "t/profile/registPopol";
	}
	
	//포트폴리오 수정 화면
	@RequestMapping(path="modifypopolView", method= {RequestMethod.GET})
	public String modifypopolView(@RequestParam(defaultValue = "me") String user_id, int po_no, Model model, HttpSession session) {
		// 공통 //
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		// 회원정보
		if (user_id.equals("me")) {  
           user_id = ((UserVo) session.getAttribute("S_USER")).getUser_id();
        }
		model.addAttribute("user", userService.selectUser(user_id));
		model.addAttribute("popolVo", userService.getPopolList(po_no));
		model.addAttribute("filesname", userService.selectfiles(po_no));
		logger.debug("modifypopolVo:{}", userService.getPopolList(po_no));
		
		return "t/profile/registPopol";
	}
	
	//포트폴리오 등록(이미지, 파일)
	@RequestMapping(path="registpopol", method= {RequestMethod.POST})
	public String registpopol(PortfolioVo portfoliovo, MultipartFile image,
							  Collection<MultipartFile> insertfile, @RequestParam(defaultValue = "1") int num) {
		
		logger.debug("po_no값: {}", portfoliovo.getPo_no());
		logger.debug("num값: {}",num);
//			logger.debug("image: {}",image);
//			logger.debug("여기portfoliovo: {} ", portfoliovo);
		//대표이미지 등록
		int insertCnt = 0;
		int updateCnt = 0;
		
		String originalImagename = "";
		String imagename = "";

		if (image.getSize() > 0) {
			originalImagename = image.getOriginalFilename();
			imagename = "C:\\LastProject\\fileupload\\"  + UUID.randomUUID().toString() + "."
//					imagename = "d:\\fileupload\\"  + UUID.randomUUID().toString() + "."
						+ originalImagename.substring(originalImagename.lastIndexOf(".") + 1);

			try {
				image.transferTo(new File(imagename));
				portfoliovo.setPo_image(imagename);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		if(num == 1) {
			insertCnt = userService.insertPopol(portfoliovo);
			logger.debug("이미지insertCnt: {} ", insertCnt);
			logger.debug("추가한portfoliovo:{}", portfoliovo);
		}
		else if(num == 2){
			updateCnt = userService.modifyPopol(portfoliovo);
			logger.debug("이미지updatCnt: {} ", updateCnt);
		}

		int maxfileNo = 0;

		//첨부파일 등록
		for (MultipartFile files : insertfile) {  
			int file_cnt = 0;
			String originalFilename = "";
			String filename = "";
			maxfileNo = userService.maxnumFile();
			
			if (files.getSize() > 0) {
				
				originalFilename = files.getOriginalFilename();
				filename = UUID.randomUUID().toString() + "."
						+ originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
				
				AttachVo attachVo = new AttachVo();
				if(num == 1) {
					attachVo.setNo(maxfileNo);
					logger.debug("po_no 여기 확인해야해 : {} " , maxfileNo);
				}else if(num == 2) {
					attachVo.setNo(portfoliovo.getPo_no());
					attachVo.setA_no(maxfileNo);
				}
				attachVo.setA_nm(originalFilename);
//				attachVo.setA_route("d:\\fileupload\\" + filename);
				attachVo.setA_route("C:\\LastProject\\fileupload\\" + filename);

				try {
					files.transferTo(new File(attachVo.getA_route()));				
					file_cnt = userService.insertfiles(attachVo);
					
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		if (insertCnt == 1) {   	 //등록이 정상적으로 되었다면
			return "redirect:/user/mainpopol";
		} else if(updateCnt == 1) {	 //수정이 정상적으로 되었다면
			return "redirect:/user/detailpopol?po_no="+portfoliovo.getPo_no();
		} else {						
			return "user/registpopolView";
		}
	}
	
	//포트폴리오 상세 화면
	@RequestMapping(path="detailpopol", method= {RequestMethod.GET})
	public String detailpopol(int po_no, Model model, HttpSession session) {
		// 공통 //
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
		PortfolioVo portfolio = userService.getPopolList(po_no);
		model.addAttribute("filesList", userService.selectfiles(po_no));
		model.addAttribute("detailpopol", portfolio);
		model.addAttribute("user", userService.selectUser(portfolio.getUser_id()));
		return "t/profile/detailPopol";
	}
	
	//대표 포트폴리오 설정,해제
	@RequestMapping(path="representpopol", method= {RequestMethod.POST})
	public String representpopol(String user_id, String po_no, Model model, HttpSession session) {
		logger.debug("po_no:{}",po_no);
		logger.debug("user_id:{}", user_id);

	    userService.representNPopol(user_id);   //모두 N으로 초기화작업
		if(po_no != null) {
			String str = po_no;
			String[] array = str.split(",");

			for (int i = 0; i < array.length; i++) {
				String ps = array[i];

				int pono = Integer.parseInt(ps);								
				PortfolioVo portfolio = userService.getPopolList(pono);				
				
				if (pono != 0) {
					userService.representYPopol(portfolio);   //Y->N으로 변경작업
				}
			}
		}
		return "redirect:/user/mainpopol";
	}
	
	//포트폴리오 삭제
	@RequestMapping(path="deletepopol", method= {RequestMethod.POST})
	public String deletepopol(int po_no) {

		userService.deletePopol(po_no);
		
		return "redirect:/user/mainpopol";
	}

	//포트폴리오 대표이미지 출력 경로
	@RequestMapping("popolimg")
	public void popolimg(HttpServletResponse resp, int po_no, HttpServletRequest req) {

		resp.setContentType("image");
		PortfolioVo popolVo = userService.getPopolList(po_no);

		String path = "";
		if (popolVo.getPo_image() == null) {
			path = req.getServletContext().getRealPath("/images/popol_unknown.png");
		} else {
			path = popolVo.getPo_image();
		}

		logger.debug("path: {}", path);

		try {
			FileInputStream fis = new FileInputStream(path);
			ServletOutputStream sos = resp.getOutputStream();

			byte[] buff = new byte[512];
			while (fis.read(buff) != -1) {
				sos.write(buff);
			}
			fis.close();
			sos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//포트폴리오 첨부파일 다운로드
	@RequestMapping("popolfileDownload")
	public void popolfileDownload(HttpServletResponse rep,
								  HttpServletRequest req, int a_no) throws UnsupportedEncodingException{
		
		AttachVo attachVo =  userService.getfiles(a_no);
		attachVo.setA_no(a_no);
		logger.debug("attachVo:{}", attachVo);
		
		String path = "";
		String filename = "";
		if(attachVo.getA_nm() == null) {
			path = req.getServletContext().getRealPath("/images/unknown.png");
			filename = "unknown.png";
		}else {
			path = attachVo.getA_route();
			logger.debug("path값: {}", path);
			filename = attachVo.getA_nm();
		}
		
		rep.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(filename, "UTF-8")+"\";");
		
		try {
			FileInputStream fis = new FileInputStream(path);
			ServletOutputStream sos = rep.getOutputStream();
			
			byte[] buff = new byte[512];
			
			while(fis.read(buff) != -1) {
				sos.write(buff);
			}
			
			fis.close();
			sos.close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	//포트폴리오 첨부파일 삭제(ajax)
	@RequestMapping(path="filesDelete")
	public String filesDelete(int a_no){
		int deleteCnt = 0;
		try {
			deleteCnt = userService.deletefiles(a_no);
		}catch (Exception e) {
			e.printStackTrace();
			deleteCnt = 0;
		}
		return "jsonView";
	}
	 	
	//분야필터 적용(ajax)
	@RequestMapping(path="fieldFilter", method = {RequestMethod.POST})
	public Object fieldFilter(@RequestParam(value="checkfield") String checkfield, 
							  @RequestParam(value="userid") String userid, 
							  PortfolioVo portfoliovo, Model model, HttpSession session) {
		String str = checkfield;
		String[] array = str.split(",");
		SearchVo searchVo = new SearchVo(userid, array.length);

		portfoliovo.setPo_field(checkfield);
		portfoliovo.setUser_id(userid);

		if (array.length == 1) {
			searchVo.setValue1(array[0]);
//				logger.debug("1개 :{}", searchVo);
		} else if (array.length == 2) {
			searchVo.setValue1(array[0]);
			searchVo.setValue2(array[1]);
//				logger.debug("2개 :{}", searchVo);
		} else if (array.length == 3) {
			searchVo.setValue1(array[0]);
			searchVo.setValue2(array[1]);
			searchVo.setValue3(array[2]);
//				logger.debug("3개 :{}", searchVo);
		} else if (array.length == 4) {
			searchVo.setValue1(array[0]);
			searchVo.setValue2(array[1]);
			searchVo.setValue3(array[2]);
			searchVo.setValue4(array[3]);
//				logger.debug("4개 :{}", searchVo);
		} else {
			searchVo.setValue1(array[0]);
			searchVo.setValue2(array[1]);
			searchVo.setValue3(array[2]);
			searchVo.setValue4(array[3]);
			searchVo.setValue5(array[4]);
//				logger.debug("5개 :{}", searchVo);
		}
		model.addAttribute("fieldfilter", userService.selectFieldFilter(searchVo));
		return "jsonView";
	}

}