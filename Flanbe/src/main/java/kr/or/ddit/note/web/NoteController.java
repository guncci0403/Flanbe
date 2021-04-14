package kr.or.ddit.note.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.note.model.NoteVo;
import kr.or.ddit.note.model.ReplyVo;
import kr.or.ddit.note.service.NoteService;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.MessageService;

@RequestMapping("note")
@Controller
public class NoteController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoteController.class);

	@Resource(name = "NoteServiceImpl")
	private NoteService noteService;

	@Resource(name = "messageService")
	private MessageService messageService;
	
	@Resource(name ="projectService")
	private ProjectService projectService;
	
	// 업투노트로 가는 페이지 (projectcode 가 필요하다.)
	@RequestMapping(path = "viewMain", method = RequestMethod.GET)
	public String notViewMain(Model model, int p_code) {
		model.addAttribute("p_code", p_code);
		// 임시로 1페이지로 저장해 놓는다.
		int page = 1;
		String key = "0";
		model.addAttribute("key", 0);
		model.addAttribute("page", page);
		return "redirect:/note/main";
	}

	// 노트 메인
	@RequestMapping(path = "main", method = RequestMethod.GET)
	private String NoteMain(int p_code, int page, Model model, String key, HttpSession session) {
		
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		String starCheck = "f";
		
		//진행하는 클라이언트 아이디
		String client_id = null; 
		
		String checkPartOrClient = ((UserVo) session.getAttribute("S_USER")).getUser_id();
		String clientId = noteService.checkFinishProjectBtnAble(p_code);
		//프로젝트 상태가 완성일때는 버튼을 없애야함. 
		 String pstate = projectService.viewProject(p_code).getP_state();
		 if(clientId.equals(checkPartOrClient) && !projectService.viewProject(p_code).getP_state().equals("09")) {
			model.addAttribute("ableFinishProjectBtn", "true");
		}
		 
		 if(projectService.viewProject(p_code).getP_state().equals("09")) {
			model.addAttribute("finalTrue", "finalTrue");
		 }
		
		
		 model.addAttribute("p_title", projectService.viewProject(p_code).getP_title());
		
		// beforeList의페이지가 몇번인지..
		model.addAttribute("p_code", p_code);
		
		// 중요한애를 조회하는지 아닌지
		model.addAttribute("key", key);
		model.addAttribute("starCheck", starCheck);
		return "t/note/workNote";

	}

	// ajax 리스트 페이징처리
	@RequestMapping(path = "ListPaging", method = RequestMethod.POST)
	private String firstListPaging(int p_code, int page, String key, Model model, String checkListType, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }

		String starCheck = "f";
		NoteVo noteVo = new NoteVo();
		int beforeListCnt = 0;
		int ingListCnt = 0;
		int finishListCnt = 0;
		int beforePagination = 0;
		int ingPagination = 0;
		int finishPagination = 0;
		List<NoteVo> beforeListNote = null;
		List<NoteVo> ingListNote = null;
		List<NoteVo> finishListNote = null;

		HashMap<String, Object> map = new HashMap<>();
		map.put("p_code", p_code);
		map.put("page", page);

		// 중요표시한 애만 조회하기
		if (key != null && key.equals("1")) {
			map.put("n_title", "key");
			starCheck = "t";
			// 중요표시된 애의 list count
			noteVo.setN_title("key");
		} else { // 전체 리스트 조회
			map.put("n_title", null);
		}

		// checkListType 01이면 진행전 리스트 02이면 진행중 리스트 03이면 진행후 리스트
		noteVo.setN_state(checkListType);
		noteVo.setP_code(p_code);
		// 공통 적용 model
		// beforeList의페이지가 몇번인지..
		model.addAttribute("p_code", p_code);
		// 현재 페이지
		// 중요한애를 조회하는지 아닌지
		model.addAttribute("key", key);
		// starcheck 가 f이면 전체조회 t이면 중요한것만 조회
		model.addAttribute("starCheck", starCheck);
		if (checkListType.equals("01")) { // 진행전 리스트
			//리스트의 갯수
			beforeListCnt = noteService.countList(noteVo);
			//가져올 노트 리스트 전체 
			beforeListNote = noteService.selectNoteListBefore(map);
			//페이징처리시 페이지의 갯수
			beforePagination = (int) Math.ceil(beforeListCnt / (double) 3);
			model.addAttribute("page1", page);
			model.addAttribute("beforeListCnt", beforeListCnt);
			model.addAttribute("beforePagination", beforePagination);
			model.addAttribute("beforeListNote", beforeListNote);
			return "/note/mainFirstListAjax";

		} else if (checkListType.equals("02")) { // 진행중 리스트
			ingListCnt = noteService.countList(noteVo);
			ingListNote = noteService.selectNoteListIng(map);
			ingPagination = (int) Math.ceil(ingListCnt / (double) 3);
			model.addAttribute("page2", page);
			model.addAttribute("ingListCnt", ingListCnt);
			model.addAttribute("ingPagination", ingPagination);
			model.addAttribute("ingListNote", ingListNote);
			return "/note/mainSecondListAjax";
		} else { // 진행완료 리스트
			finishListCnt = noteService.countList(noteVo);
			finishListNote = noteService.selectNoteListFinish(map);
			finishPagination = (int) Math.ceil(finishListCnt / (double) 3);
			model.addAttribute("page3", page);
			model.addAttribute("finishListCnt", finishListCnt);
			model.addAttribute("finishPagination", finishPagination);
			model.addAttribute("finishListNote", finishListNote);
			return "/note/mainThirdListAjax";
		}
	}

	// 최상위글 등록페이지로 이동
	@RequestMapping(path = "viewInsertNote", method = RequestMethod.GET)
	private String insertNote(Model model, HttpSession session, int p_code) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		String user_id =  ((UserVo)session.getAttribute("S_USER")).getUser_id();
		model.addAttribute("checkParent", "allparent");
		model.addAttribute("user_id", user_id);
		model.addAttribute("p_code", p_code);
		return "t/note/insertNote";

	}

	// 자식 글 등록 등록페이지로 이동

	@RequestMapping(path = "viewInsertChildNote", method = RequestMethod.GET)
	private String insertChildNote(Model model, HttpSession session, int n_parent, int n_gno, int p_code) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		// 상위 번호
		model.addAttribute("n_parent", n_parent);
		// 상위 글의 제목
		String parentTitle = null;
		if (n_parent != 0 && noteService.selectNote(n_parent) != null
				&& noteService.selectNote(n_parent).getN_title() != null) {

			parentTitle = noteService.selectNote(n_parent).getN_title();
			model.addAttribute("parentTitle", parentTitle);
		}

		// 그룹 번호
		model.addAttribute("n_gno", n_gno);
		String user_id = ((UserVo)session.getAttribute("S_USER")).getUser_id();
		model.addAttribute("user_id", user_id);
		// p_code
		model.addAttribute("p_code", p_code);

		return "t/note/insertNote";
	}

	// 실제 글 등록하기
	@RequestMapping(path = "insertNote", method = RequestMethod.POST)
	private String insertNote(Model model, String starCheck, NoteVo noteVo, String etc, String checkParent) {
		int n_no = 0;

		logger.debug("noteVo.getparent {}", noteVo.getN_gno());
		logger.debug("noteVo.group {}", noteVo.getN_parent());
		logger.debug("USER_ID {} ", noteVo.getUser_id());
		logger.debug("P_CODE{} ", noteVo.getP_code());
		logger.debug("noteVo category {}", noteVo.getCategory());

		// starCheck 가 black 일때는 보통 starCheck 가 yellow 일때 중요
		if (starCheck.equals("yello")) {
			noteVo.setN_import("01");
		} else { //
			noteVo.setN_import("02");
		}
		logger.debug("etc{}", etc);
		// 만약 etc 가 null 이 아니면
		if (etc != null && noteVo.getCategory().equals("etc")) {
			noteVo.setCategory(etc);
		}

		logger.debug("noteVo category22 {}", noteVo.getCategory());
		// 만약 checkParent 가 allparent 라면 부모 , 자식이라면 child로 옴

		if (checkParent.equals("allparent")) {
			// 부모 등록으로 보내기
			n_no = noteService.insertNote(noteVo);

		} else {
			// 자식 등록으로 보내기
			n_no = noteService.insertNoteReply(noteVo);
		}

		model.addAttribute("n_no", n_no);

		return "redirect:/note/viewOneNote";

	}

	// 글 한페이지 보기

	@RequestMapping(path = "viewOneNote", method = RequestMethod.GET)
	private String viewOneNote(int n_no, Model model, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		// 부모 글의 타이틀 조회
		String parentTitle = null;
		int p_no = 0;
		// 댓댓글의 부모 아이디 조회
		String parentReplyId = null;

		// 상위 업무의 제목 조회
		NoteVo noteVo = noteService.selectNote(n_no);
		// 상위 업무의 글 게시글 번호

		if (noteVo.getN_parent() != 0) {

			p_no = noteVo.getN_parent();

		}
		if (p_no != 0) {
			parentTitle = noteService.selectNote(p_no).getN_title();
		}

		// 답글 리스트 가지고 오기
		/* noteService.selectReplyNote(n_no); */
		model.addAttribute("noteReplyVoList", noteService.selectReplyNote(n_no));

		// 부모댓글이 있으면 그 아이디 가지고 오기
		model.addAttribute("parentReplyId", parentReplyId);
		// 댓글 리스트 가지고 오기
		/* noteService.selectComment(n_no); */

		model.addAttribute("replyVoList", noteService.selectReply(n_no));

		// 댓글 리스트 불러올때 타입 변환해줘야함.!
		model.addAttribute("p_code", noteVo.getP_code());
		// 글 한개 조회 note
		model.addAttribute("noteVo", noteVo);
		// 상위글 제목
		model.addAttribute("parentTitle", parentTitle);
		return "t/note/viewNote";
	}

	// 수정페이지로 가기

	@RequestMapping(path = "viewUpdate", method = RequestMethod.GET)
	private String viewUpdate(Model model, int n_no, HttpSession session) {

		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		NoteVo noteVo = noteService.selectNote(n_no);

		if (!noteVo.getCategory().equals("structure") && !noteVo.getCategory().equals("interface")
				&& !noteVo.getCategory().equals("safety") && !noteVo.getCategory().equals("test")) {
			model.addAttribute("etcCheck", "etcCheck");
		}
		
		// 저장된 date 타입을 살펴보자
		
		model.addAttribute("noteVo", noteService.selectNote(n_no));
		return "t/note/updateNote";

	}

	// 직접 수정하는 로직

	@RequestMapping("updateNote")
	private String updateNote(Model model, NoteVo noteVo, String etc) {

		// etc가 null 이 아니면 category 를 직접 입력한것 (select 박스 etc 선택)
		if (noteVo.getCategory().equals("etc")) {
			noteVo.setCategory(etc);
		}

		int res = noteService.updateNote(noteVo);
		int n_no = noteVo.getN_gno();

		if (res > 0) { // 글 수정 성공하면
			return "redirect:/note/viewOneNote?n_no=" + n_no;
		} else { // 글 수정 실패하면
			return "redirect:/note/viewUpdate?n_no=" + n_no;
		}

	}

	// 댓글 달기
	@RequestMapping(path = "insertReply", method = RequestMethod.GET)
	private String insertReply(Model model, ReplyVo replyVo, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		int res = 0;
		int r_parent = replyVo.getR_parent();
		int n_no = replyVo.getN_no();
		String user_id = ((UserVo)session.getAttribute("S_USER")).getUser_id();
		
		replyVo.setUser_id(user_id);

		// 자식댓글달때는 최상위번호 즉 그룹번호 r_gno 가 필요하다.
		// r_parent 부모컬럼에 있는 r_gno 값을 그대로 따라가면된다.

		if (r_parent == 0) {
			// 최상위 댓글달기
			res = noteService.insertGroupReply(replyVo);
		} else {
			// 자식 댓글 달기
			res = noteService.insertChildReply(replyVo);
		}

		// 댓글 전제 청보 가지고 오기
		model.addAttribute("replyVoList", noteService.selectReply(n_no));

		if (res > 0) {
			return "/note/noteReplyAjax";
		} else {
			return "redirect:/note/viewOneNote?n_no=" + n_no;
		}

	}

	// 댓글 수정하기
	@RequestMapping(path = "updateReply", method = RequestMethod.GET)
	private String updateReply(Model model, ReplyVo replyVo, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		noteService.updateReply(replyVo);

		int n_no = replyVo.getN_no();
		model.addAttribute("replyVoList", noteService.selectReply(n_no));
		return "/note/noteReplyAjax";
	}

	// 댓글 삭제하기

	@RequestMapping(path = "deleteReply", method = RequestMethod.GET)
	private String deleteReply(Model model, ReplyVo replyVo, HttpSession session) {

		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		// 댓글 삭제 update 로 '삭제된 댓글입니다 뜨기'

		String r_cont = noteService.deleteReply(replyVo);
		// 댓글 내용 불러오기 1개

		int n_no = replyVo.getN_no();
		logger.debug("n_no 댓글 삭제할때 확인해보자 잘 오나 {}", n_no);
		model.addAttribute("replyVoList", noteService.selectReply(n_no));
		logger.debug("댓글 삭제가 됬나요?");
		return "/note/noteReplyAjax";
	}

	// 노트 삭제하기
	@RequestMapping(path = "deleteReplyTrashCan", method = RequestMethod.GET)
	private String deleteReplyTrashCan(Model model, NoteVo noteVo, HttpSession session) {
		
		int n_no = noteVo.getN_no();
		noteService.deleteNote(n_no);
		int p_code = noteVo.getP_code();
		model.addAttribute("p_code", p_code);
		model.addAttribute("page", 1);
		logger.debug("n_no , 댓글 트래쉬캔으로 삭제할때 확인해보자 잘 오나 {}", n_no);
		logger.debug("p_code댓글 트래쉬캔으로 삭제할때 확인해보자 잘 오나 {}", p_code);
		return "redirect:/note/main";
	}

	
	// 참여중인 사용자 조회
	@RequestMapping("userList")
	private String userList(int p_code, Model model, HttpSession session) {
		// 모든 컨트롤러에서 쓰이는 것 ( 안읽은 쪽지 리스트, 참여중인 프로젝트 리스트 불러오는 부분)
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		
		List<UserVo> userList = noteService.userList(p_code);
		//진행하는 클라이언트 아이디
		String client_id = null; 
		for(UserVo userVo : userList) {
			if(userVo.getPurpose().contains("C")) {
				client_id = userVo.getUser_id(); 	
			}
		}
		
	
		model.addAttribute("p_code", p_code);
		model.addAttribute("userList", userList);
		model.addAttribute("client_id", client_id);
		
		return "t/note/userList";
	}
	
	@RequestMapping("excelDownload")
	public String excelDownload(Model model, int p_code) {
		
		List<String> header = new ArrayList<String>();
		header.add("아이디");
		header.add("이름");
		header.add("이메일");
		header.add("전화번호");
		
		model.addAttribute("header", header);
		model.addAttribute("data", noteService.userList(p_code));
		
		return "excelDownloadView";
	}
	
	@RequestMapping(path="inviteUser", method = RequestMethod.GET)
	public String inviteUser(UserVo userVo ,Model model) {
		
		logger.debug("userVo지롱 : {} ", userVo);
		model.addAttribute("userList", noteService.notattenduserList(userVo));
		
		return "jsonView";
	}
	
	@RequestMapping(path="inviteUser", method = RequestMethod.POST)
	public String inviteUser(String userid, int p_code) {
		
		logger.debug("userid : {} ", userid);
		
		PAttendVo pattend = new PAttendVo();
		pattend.setP_code(p_code);
		String[] users = userid.split(", ");
		int cnt = 0;
		for(int i = 0; i < users.length; i++) {
			pattend.setUser_id(users[i]);
			cnt += noteService.inviteUser(pattend);
		}
		
		return "redirect:/note/userList?p_code="+p_code;
	}
	
	
	//협업툴 달력 모두보기 리스트
	@RequestMapping("noteCalendar")
	public String calendar(Model model, NoteVo noteVo, int p_code) {
		model.addAttribute("calendarlist", noteService.calendarListN(noteVo.getP_code()));
//		logger.debug("noteVovovo:{}", noteVo);
		List<UserVo> userList = noteService.userList(p_code);
		//진행하는 클라이언트 아이디
		String client_id = null; 
		for(UserVo userVo : userList) {
			if(userVo.getPurpose().contains("C")) {
				client_id = userVo.getUser_id(); 	
			}
		}
		
		model.addAttribute("p_code", p_code);
		model.addAttribute("userList", userList);
		model.addAttribute("client_id", client_id);
		
//		logger.debug("p_code:{}", p_code);
		
		return"t/note/noteCalendar";
	}
	
	//협업툴 달력 한명만 보기
	@RequestMapping("noteuserCalendar")
	public String noteuserCalendar(Model model, NoteVo noteVo, String user_id, int p_code) {
		
		model.addAttribute("caluserlist", noteService.calendarUser(noteVo));
//		logger.debug(" note user Calendar userid:{}", noteVo);
		List<UserVo> userList = noteService.userList(p_code);
//		진행하는 클라이언트 아이디
		String client_id = null; 
		for(UserVo userVo : userList) {
			if(userVo.getPurpose().contains("C")) {
				client_id = userVo.getUser_id(); 	
			}
		}
		
		model.addAttribute("p_code", p_code);
		model.addAttribute("userList", userList);
		model.addAttribute("client_id", client_id);
		
		return "t/note/noteUserCalendar";
	}
}
