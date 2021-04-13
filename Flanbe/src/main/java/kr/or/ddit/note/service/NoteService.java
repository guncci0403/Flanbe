package kr.or.ddit.note.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.note.model.NoteVo;
import kr.or.ddit.note.model.ReplyVo;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.user.model.UserVo;

public interface NoteService {

	//글 갯수 가지고 오기 
	public int countList(NoteVo noteVo); 
	
	
	//진행전 노트리스트
	public List<NoteVo> selectNoteListBefore(HashMap<String, Object> map);
	
	//진행중 노트리스트
	public List<NoteVo> selectNoteListIng(HashMap<String, Object> map);
	
	//끝난노트리스트
	public List<NoteVo> selectNoteListFinish(HashMap<String, Object> map);
	
	
	// 최상위 업무노트 등록
	public int insertNote(NoteVo noteVo);
	
	//답글 업무노트 등록 
	public int insertNoteReply(NoteVo noteVo);
	
	//업무노트 한개 조회
	public NoteVo selectNote(int n_no);
	
	//업무노트 답글 조회
	public List<NoteVo> selectReplyNote(int n_parent);
	
	
	//댓글 한개 조회
	public List<ReplyVo> selectReply(int n_no);
	
	//업무노트 한개 수정
	public int updateNote(NoteVo noteVo);
	
	//업무노트 한개 삭제
	public int deleteNote(int n_no);
	
	
	
	//최상위 댓글 등록하기
	public int insertGroupReply(ReplyVo replyVo);
	// 대댓글 등록하기
	public int insertChildReply(ReplyVo replyVo);
	//댓글 수정
	public int updateReply(ReplyVo replyVo);
	//댓글 삭제
	public String deleteReply(ReplyVo replyVo);
	
	// 참여중인 사용자 조회
	List<UserVo> userList(int p_code);
	
	// 참여중이 아닌 사용자 조회
	List<UserVo> notattenduserList(UserVo userVo);
	
	// 사용자 초대
	int inviteUser(PAttendVo pattend);
	
	//프로젝트 종료 버튼이 보이는지 권한 체크위해 검사
	String checkFinishProjectBtnAble(int p_code);

	//협업툴 달력 리스트
	List<NoteVo> calendarListN(int p_code);
	
	//협업툴 달력 내것만 보는 리스트
	List<NoteVo> calendarUser(NoteVo noteVo);
}
