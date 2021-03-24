package kr.or.ddit.board.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.model.PostVo;
import kr.or.ddit.common.model.AttachVo;
import kr.or.ddit.common.model.PageVo;


@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<BoardVo> selectAllBoardList() {
		return template.selectList("board.selectAllBoardList");
	}	
	
	@Override
	public BoardVo selectBoard(int b_no) {
		return template.selectOne("board.selectBoard", b_no);
	}

	@Override
	public List<PostVo> selectPagingPost(PageVo page) {
		return template.selectList("board.selectPagingPost", page);
	}

	@Override
	public int selectPostCnt(int b_no) {
		return template.selectOne("board.selectPostCnt", b_no);
	}
	
	@Override
	public List<PostVo> searchPagingPost(PageVo page) {
		return template.selectList("board.searchPagingPost", page);
	}

	@Override
	public int searchPostCnt(PageVo page) {
		return template.selectOne("board.searchPostCnt", page);
	}
	
	@Override
	public PostVo selectPost(int p_no) {
		return template.selectOne("board.selectPost", p_no);
	}

	@Override
	public int insertPost(PostVo postVo) {
		return template.insert("board.insertPost", postVo);
	}

	@Override
	public int updatePost(PostVo postVo) {
		return template.update("board.updatePost", postVo);
	}

	@Override
	public int deletePost(int p_no) {
		return template.delete("board.deletePost", p_no);
	}

	@Override
	public int selectSeq() {
		return template.selectOne("board.selectSeq");
	}

	@Override
	public int insertRePost(PostVo postVo) {
		return template.insert("board.insertRePost", postVo);
	}

	@Override
	public int countView(int p_no) {
		return template.update("board.countView", p_no);
	}

	@Override
	public List<AttachVo> attachList(int no) {
		return template.selectList("board.attachList", no);
	}

	@Override
	public int addAttach(AttachVo attachVo) {
		return template.insert("board.addAttach", attachVo);
	}

	@Override
	public int deleteAttach(int a_no) {
		return template.delete("board.deleteAttach", a_no);
	}

	@Override
	public AttachVo selectAttach(int a_no) {
		return template.selectOne("board.selectAttach", a_no);
	}
	
}
