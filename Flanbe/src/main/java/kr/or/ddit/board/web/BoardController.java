package kr.or.ddit.board.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.board.model.PostVo;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.common.model.AttachVo;
import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.MessageService;

@RequestMapping("board")
@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name = "boardService")
	private BoardService boardService;
	@Resource(name ="messageService")
	private MessageService messageService;
	@Resource(name ="projectService")
	private ProjectService projectService;
	
	@RequestMapping("view")
	public String view(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "1") int b_no, Model model, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		//게시판 리스트 출력
		model.addAttribute("boardList", boardService.selectAllBoardList());
		model.addAttribute("selectBoard", boardService.selectBoard(b_no));
		model.addAttribute("bno",b_no);
		
		//게시글 리스트 페이징 처리
		PageVo pageVo = new PageVo(page, 5, b_no);
		Map<String, Object> map = boardService.selectPagingPost(pageVo);
		int cnt = (int)map.get("cnt");
		model.addAttribute("pagination", (int)Math.ceil((double)cnt/5));
		model.addAttribute("postList", map.get("postList"));
		model.addAttribute("page", pageVo);

		
		return "t/board/board";
	}
	
	@RequestMapping("searchView")
	public String searchView(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "1") int b_no, String keyword, Model model, HttpSession session) {
		logger.debug("b_no : {} ", b_no);
		
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
			model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		} else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
			model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		}
	
		
		logger.debug("keyword:{}",keyword);
		if (keyword.equals("")) {
			model.addAttribute("page", page);
			model.addAttribute("b_no",b_no);
			logger.debug("입력안했을 경우 ");
			return "redirect:/board/view";
		}
		else {
			//게시판 리스트 출력
			model.addAttribute("boardList", boardService.selectAllBoardList());
			model.addAttribute("selectBoard", boardService.selectBoard(b_no));
			model.addAttribute("bno",b_no);
			//게시글 리스트 페이징 처리
			PageVo pageVo = new PageVo(page, 5, b_no);
			pageVo.setP_field(keyword);
			Map<String, Object> map = boardService.searchPagingPost(pageVo);
			int cnt = (int)map.get("cnt");
			model.addAttribute("pagination", (int)Math.ceil((double)cnt/5));
			model.addAttribute("postList", map.get("postList"));
			model.addAttribute("page", pageVo);
			model.addAttribute("key", keyword);
		}
		return "t/board/board";
	}
	
	@RequestMapping("selectPost")
	public String selectPost(int p_no, int b_no, int page, Model model, HttpSession session) {
		
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		//게시판 리스트 출력
		model.addAttribute("boardList", boardService.selectAllBoardList());
		model.addAttribute("selectBoard", boardService.selectBoard(b_no));
		model.addAttribute("bno", b_no);
		model.addAttribute("page", page);
		
		//게시글 상세 조회
		Map<String, Object> map = boardService.selectPost(p_no);
		model.addAllAttributes(map);
		return "t/board/post";
	}
	
	
	@RequestMapping(path="insertPost", method = RequestMethod.GET)
	public String insertPost(int b_no, int page, Model model, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		//게시판 리스트 출력
		model.addAttribute("boardList", boardService.selectAllBoardList());
		model.addAttribute("selectBoard", boardService.selectBoard(b_no));
		model.addAttribute("bno", b_no);
		model.addAttribute("page", page);
		
		//model.addAttribute("viewName", "t/board/insertPost");
		//return "/template/main";
		return "t/board/insertPost";
	}
	
	@RequestMapping(path="insertPost", method = RequestMethod.POST)
	public String insertPost(@Valid PostVo postVo, int page, Collection<MultipartFile> file, Model model, RedirectAttributes ra) {
	
		//게시글 등록
		postVo.setP_regdt(new Date());
		
		int insertCnt = 0;
		int seq = 0;
		try {
			insertCnt = boardService.insertPost(postVo);
			logger.debug("insertcnt :{} ", insertCnt );
			seq = boardService.selectSeq();
			
			for(MultipartFile files : file) {
				int a_cnt = 0;
				String originalFilename = "";
				String filename = "";
				if(files.getSize() > 0) {
					originalFilename = files.getOriginalFilename();
					filename = UUID.randomUUID().toString() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
					
					AttachVo attach = new AttachVo();
					attach.setA_nm(originalFilename);
//					attach.setA_route("d:\\postAttach\\"+filename);
					attach.setA_route("C:\\LastProject\\postAttach\\"+filename);
					
					attach.setNo(seq);
					
					try {
						files.transferTo(new File(attach.getA_route()));
						a_cnt = boardService.addAttach(attach);
						logger.debug("a_cnt :{} ", a_cnt );
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			insertCnt = 0;
			seq = 0;
		}
		if(insertCnt == 1){
			ra.addAttribute("p_no", seq);
			ra.addAttribute("b_no", postVo.getB_no());
			ra.addAttribute("page", 1);
			return "redirect:/board/selectPost";
		}
		else {
			ra.addAttribute("b_no", postVo.getB_no());
			return "redirect:/board/insertPost";
		}	
	}
	
	@RequestMapping(path = "updatePost", method = RequestMethod.GET)
	public String updatePost(int p_no, int b_no, int page, Model model, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		model.addAttribute("boardList", boardService.selectAllBoardList());
		model.addAttribute("selectBoard", boardService.selectBoard(b_no));
		model.addAttribute("bno", b_no);
		model.addAttribute("page", page);
		
		Map<String, Object> map = boardService.selectPost(p_no);
		model.addAttribute("post", map.get("selectPost"));
		model.addAttribute("attachList", map.get("attachList"));
		return "t/board/updatePost";
	}
	@RequestMapping(path="updatePost", method = RequestMethod.POST)
	public String updatePost(@Valid PostVo postVo, int page, Collection<MultipartFile> file, Model model, RedirectAttributes ra) {
		postVo.setP_regdt(null);
		int updateCnt = 0;
		  
		try {
			updateCnt = boardService.updatePost(postVo);
			for(MultipartFile files : file) {
				String originalFilename = "";
				String filename = "";
				if(files.getSize() > 0) {
					originalFilename = files.getOriginalFilename();
					filename = UUID.randomUUID().toString() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
					
					AttachVo attach = new AttachVo();
					attach.setA_nm(originalFilename);
//					attach.setA_route("d:\\postAttach\\"+filename);
					attach.setA_route("C:\\LastProject\\postAttach\\"+filename);
					
					attach.setNo(postVo.getP_no());
					
					try {
						files.transferTo(new File(attach.getA_route()));
						boardService.addAttach(attach);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e) {
			updateCnt = 0;
		}

		if(updateCnt == 1){
			ra.addAttribute("p_no", postVo.getP_no());
			ra.addAttribute("b_no", postVo.getB_no());
			ra.addAttribute("page", page);
			return "redirect:/board/selectPost";
		}
		else {
			ra.addFlashAttribute("p_no", postVo.getP_no());
			return "redirect:/board/updatePost";
		}	
	}
	
	@RequestMapping("deletePost")
	public String deletePost(int p_no, int b_no, RedirectAttributes ra) {
		logger.debug("p_no : {} , b_no :{}", p_no, b_no);
		int updateCnt = 0;
		try {
			updateCnt = boardService.deletePost(p_no);
		} catch (Exception e) {
			e.printStackTrace();
			updateCnt = 0;
		}
		if(updateCnt == 1) {
			ra.addAttribute("page", 1);
			return "redirect:/board/view?b_no="+b_no;	
		} else {
			return "redirect:/board/selectPost?p_no="+p_no;
		}
		
	}
	
	@RequestMapping(path = "insertRePost", method =RequestMethod.GET)
	public String insertRePost(int b_no, int page, int pa_no, Model model, HttpSession session) {
		model.addAttribute("alarmList", messageService.alarmMessage(((UserVo) session.getAttribute("S_USER")).getUser_id()));
		if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("C")) {
	    	model.addAttribute("pList", projectService.ingProjectListC(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    } else if(((UserVo) session.getAttribute("S_USER")).getPurpose().equals("P")) {
	    	model.addAttribute("pList", projectService.ingProjectListP(((UserVo) session.getAttribute("S_USER")).getUser_id()));
	    }
		model.addAttribute("boardList", boardService.selectAllBoardList());
		model.addAttribute("selectBoard", boardService.selectBoard(b_no));
		model.addAttribute("bno", b_no);
		model.addAttribute("page", page);
		
		model.addAttribute("pa_no", pa_no);
		return "t/board/insertRePost";
	}
	
	@RequestMapping(path="insertRePost", method = RequestMethod.POST)
	public String insertRePost(@Valid PostVo postVo, int page, int pa_no, Collection<MultipartFile> file, Model model, RedirectAttributes ra) {
		// 부모글 정보
		PostVo pa_postVo = (PostVo) boardService.selectPost(pa_no).get("selectPost");
		postVo.setB_no(pa_postVo.getB_no());
		postVo.setP_regdt(new Date());
		postVo.setP_parent(pa_postVo.getP_no());
		postVo.setP_gno(pa_postVo.getP_gno());
		
		
		int insertCnt = 0;
		int seq = 0;
		try {
			insertCnt = boardService.insertRePost(postVo);
			logger.debug("insertcnt :{} ", insertCnt );
			seq = boardService.selectSeq();
			
			for(MultipartFile files : file) {
				int a_cnt = 0;
				String originalFilename = "";
				String filename = "";
				if(files.getSize() > 0) {
					originalFilename = files.getOriginalFilename();
					filename = UUID.randomUUID().toString() + "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
					
					AttachVo attach = new AttachVo();
					attach.setA_nm(originalFilename);
//					attach.setA_route("d:\\postAttach\\"+filename);
					attach.setA_route("C:\\LastProject\\postAttach\\"+filename);
					attach.setNo(seq);
					
					try {
						files.transferTo(new File(attach.getA_route()));
						a_cnt = boardService.addAttach(attach);
						logger.debug("a_cnt :{} ", a_cnt );
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			insertCnt = 0;
			seq = 0;
		}
		if(insertCnt == 1) {
			ra.addAttribute("p_no", seq);
			ra.addAttribute("b_no", postVo.getB_no());
			ra.addAttribute("page", page);
			return "redirect:/board/selectPost";
		}
		else {
			ra.addFlashAttribute("pa_no", pa_no);
			return "redirect:board/insertRePost";
		}
	}
	
	@RequestMapping("fileDelete")
	public String fileDelete(int a_no, RedirectAttributes ra) {
		int deleteCnt = 0;
		try {
			deleteCnt = boardService.deleteAttach(a_no);
		} catch (Exception e) {
			e.printStackTrace();
			deleteCnt = 0;
		}
		ra.addFlashAttribute("cnt" , deleteCnt);
		
		return "jsonView";
	}
	
	@RequestMapping("fileDownload")
	public void fileDownload(HttpServletResponse response, int a_no) {
		
		AttachVo attach = boardService.selectAttach(a_no);
		response.setHeader("Content-Disposition", "attachement; filename=" + attach.getA_nm());
		ServletOutputStream sos;
		try {
			
			sos = response.getOutputStream();
			FileInputStream fis = new FileInputStream(new File(attach.getA_route()));
			byte[] buf = new byte[512];
			
			while(fis.read(buf) != -1) {
				sos.write(buf);
			}
			fis.close();
			sos.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	

}
