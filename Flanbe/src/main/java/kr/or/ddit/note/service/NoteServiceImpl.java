package kr.or.ddit.note.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.note.model.NoteVo;
import kr.or.ddit.note.model.ReplyVo;
import kr.or.ddit.note.repository.NoteDao;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.project.repository.ProjectDao;
import kr.or.ddit.user.model.UserVo;

@Service("NoteServiceImpl")
public class NoteServiceImpl implements NoteService {

	@Resource(name="NoteDaoImpl")
	private NoteDao noteDao;
	
	@Resource(name="projectDao")
	private ProjectDao projectDao;
	
	@Override
	public List<NoteVo> selectNoteListBefore(HashMap<String, Object> map) {
		return noteDao.selectNoteListBefore(map);
	}

	@Override
	public List<NoteVo> selectNoteListIng(HashMap<String, Object> map) {
		return noteDao.selectNoteListIng(map);
	}

	@Override
	public List<NoteVo> selectNoteListFinish(HashMap<String, Object> map) {
		return noteDao.selectNoteListFinish(map);
	}

	@Override
	public int countList(NoteVo noteVo) {
		return noteDao.countList(noteVo);
	}

	@Override
	public int insertNote(NoteVo noteVo) {
		return noteDao.insertNote(noteVo);
	}

	@Override
	public int insertNoteReply(NoteVo noteVo) {
		return noteDao.insertNoteReply(noteVo);
	}

	@Override
	public NoteVo selectNote(int n_no) {
		return noteDao.selectNote(n_no);
	}

	@Override
	public List<NoteVo> selectReplyNote(int n_parent) {
		return noteDao.selectReplyNote(n_parent);
	}

	@Override
	public List<ReplyVo> selectReply(int n_no) {
		return noteDao.selectReply(n_no);
	}

	@Override
	public int updateNote(NoteVo noteVo) {
		return noteDao.updateNote(noteVo);
	}

	@Override
	public int insertGroupReply(ReplyVo replyVo) {
		return noteDao.insertGroupReply(replyVo);
	}

	@Override
	public int insertChildReply(ReplyVo replyVo) {
		return noteDao.insertChildReply(replyVo);
	}

	@Override
	public int updateReply(ReplyVo replyVo) {
		return noteDao.updateReply(replyVo);
	}

	@Override
	public String deleteReply(ReplyVo replyVo) {
		return noteDao.deleteReply(replyVo);
	}

	@Override
	public int deleteNote(int n_no) {
		return noteDao.deleteNote(n_no);
	}

	@Override
	public List<UserVo> userList(int p_code) {
		return noteDao.userList(p_code);
	}

	@Override
	public List<UserVo> notattenduserList(UserVo userVo) {
		return noteDao.notattenduserList(userVo);
	}

	@Override
	public int inviteUser(PAttendVo pattend) {
		return noteDao.inviteUser(pattend);
	}

	@Override
	public String checkFinishProjectBtnAble(int p_code) {
		return noteDao.checkFinishProjectBtnAble(p_code);
	}
	
	@Override
	public List<NoteVo> calendarListN(int p_code) {
		return noteDao.calendarListN(p_code);
	}

	@Override
	public List<NoteVo> calendarUser(NoteVo noteVo) {
		return noteDao.calendarUser(noteVo);
	}

}
