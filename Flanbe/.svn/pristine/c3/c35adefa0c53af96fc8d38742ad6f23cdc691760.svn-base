package kr.or.ddit.board.repository;

import java.util.List;

import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.model.PostVo;
import kr.or.ddit.common.model.AttachVo;
import kr.or.ddit.common.model.PageVo;

public interface BoardDao {

	// 모든 게시판 조회
	List<BoardVo> selectAllBoardList();
	
	// 선택한 게시판 조회
	BoardVo selectBoard(int b_no);
	
	// 게시판에 맞는 게시글 페이징처리 후 조회
	List<PostVo> selectPagingPost(PageVo page);
	
	// 게시글 수 조회
	int selectPostCnt(int b_no);
	
	// 검색된 게시글 페이징 처리
	List<PostVo> searchPagingPost(PageVo page);

	// 검색된 게시글 수 조회
	int searchPostCnt(PageVo page);
	
	
	// 게시글 상세 조회
	PostVo selectPost(int p_no);
	
	// 게시글 등록
	int insertPost(PostVo postVo);
	
	// 게시글 수정
	int updatePost(PostVo postVo);
	
	// 게시글 삭제
	int deletePost(int p_no);
	
	// 추가된 게시글 번호 조회
	int selectSeq();
	
	// 답글 등록
	int insertRePost(PostVo postVo);
	
	// 조회수 증가
	int countView(int p_no);
	
	// 게시글의 첨부파일 조회
	List<AttachVo> attachList(int no);
	
	// 첨부파일 등록
	int addAttach(AttachVo attachVo);
	
	// 첨부파일 삭제
	int deleteAttach(int a_no);
	
	// 첨부파일 번호를 이용해 첨부파일 정보 조회
	AttachVo selectAttach(int a_no);
}
