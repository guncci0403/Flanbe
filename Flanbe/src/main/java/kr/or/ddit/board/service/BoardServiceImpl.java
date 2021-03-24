package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.model.PostVo;
import kr.or.ddit.board.repository.BoardDao;
import kr.or.ddit.common.model.AttachVo;
import kr.or.ddit.common.model.PageVo;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@Override
	public List<BoardVo> selectAllBoardList() {
		return boardDao.selectAllBoardList();
	}
	
	@Override
	public BoardVo selectBoard(int b_no) {
		return boardDao.selectBoard(b_no);
	}
	

	@Override
	public Map<String, Object> selectPagingPost(PageVo page) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("postList", boardDao.selectPagingPost(page));
		map.put("cnt", boardDao.selectPostCnt(page.getB_no()));
		
		return map;
	}
	
	@Override
	public Map<String, Object> searchPagingPost(PageVo page) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("postList", boardDao.searchPagingPost(page));
		map.put("cnt", boardDao.searchPostCnt(page));
		
		return map;
	}

	@Override
	public Map<String, Object> selectPost(int p_no) {
		
		// 조회 수 증가
		boardDao.countView(p_no);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("selectPost", boardDao.selectPost(p_no));
		map.put("attachList", boardDao.attachList(p_no));
		
		return map;
	}

	@Override
	public int insertPost(PostVo postVo) {
		return boardDao.insertPost(postVo);
	}

	@Override
	public int updatePost(PostVo postVo) {
		return boardDao.updatePost(postVo);
	}

	@Override
	public int deletePost(int p_no) {
		return boardDao.deletePost(p_no);
	}

	@Override
	public int selectSeq() {
		return boardDao.selectSeq();
	}

	@Override
	public int insertRePost(PostVo postVo) {
		return boardDao.insertRePost(postVo);
	}



	@Override
	public int addAttach(AttachVo attachVo) {
		return boardDao.addAttach(attachVo);
	}

	@Override
	public int deleteAttach(int a_no) {
		return boardDao.deleteAttach(a_no);
	}

	@Override
	public AttachVo selectAttach(int a_no) {
		return boardDao.selectAttach(a_no);
	}


}
