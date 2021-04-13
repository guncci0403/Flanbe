package kr.or.ddit.note.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.note.model.NoteVo;
import kr.or.ddit.note.model.ReplyVo;
import kr.or.ddit.project.model.PAttendVo;
import kr.or.ddit.user.model.UserVo;


@Transactional
@Repository("NoteDaoImpl")
public class NoteDaoImpl implements NoteDao {
	
	private static final Logger logger = LoggerFactory.getLogger(NoteDaoImpl.class);


	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate sqlSessionTemplate;
	
	
	
	@Override
	public List<NoteVo> selectNoteListBefore(HashMap<String, Object> map) {
		logger.debug("map n_title 확인{}" , map.get("n_title"));
		
		
		return sqlSessionTemplate.selectList("note.selectNoteListBefore", map);
	}

	@Override
	public List<NoteVo> selectNoteListIng(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("note.selectNoteListIng" , map);
	}

	@Override
	public List<NoteVo> selectNoteListFinish(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("note.selectNoteListFinish" , map);
	}

	@Override
	public int countList(NoteVo noteVo) {
		return sqlSessionTemplate.selectOne("note.countList", noteVo);
	}

	@Override
	public int insertNote(NoteVo noteVo) {
		sqlSessionTemplate.insert("note.insertNote", noteVo) ;
		int n_no = noteVo.getN_no();
		return n_no; 
	}

	@Override
	public int insertNoteReply(NoteVo noteVo) {
		sqlSessionTemplate.insert("note.insertNoteReply", noteVo);
		int n_no = noteVo.getN_no();
		return n_no ; 
	}

	@Override
	public NoteVo selectNote(int n_no) {
		return sqlSessionTemplate.selectOne("note.selectNote", n_no);
	}

	@Override
	public List<NoteVo> selectReplyNote(int n_parent) {
		return sqlSessionTemplate.selectList("note.selectReplyNote", n_parent);
	}

	@Override
	public List<ReplyVo> selectReply(int n_no) {
		return sqlSessionTemplate.selectList("note.selectReply", n_no);
	}

	@Override
	public int updateNote(NoteVo noteVo) {
		return sqlSessionTemplate.update("note.updateNote", noteVo);
	}

	@Override
	public int insertGroupReply(ReplyVo replyVo) {
		return sqlSessionTemplate.insert("note.insertGroupReply", replyVo);
	}

	@Override
	public int insertChildReply(ReplyVo replyVo) {
		return sqlSessionTemplate.insert("note.insertChildReply", replyVo);
	}

	@Override
	public int updateReply(ReplyVo replyVo) {
		return sqlSessionTemplate.update("note.updateReply", replyVo);
	}

	@Override
	public String deleteReply(ReplyVo replyVo) {
		sqlSessionTemplate.update("note.deleteReply", replyVo);
		String r_cont = replyVo.getR_cont();
		return  r_cont;
	}

	@Override
	public int deleteNote(int n_no) {
		return sqlSessionTemplate.delete("note.deleteNote" , n_no);
	}

	@Override
	public List<UserVo> userList(int p_code) {
		return sqlSessionTemplate.selectList("note.userList", p_code);
	}

	@Override
	public List<UserVo> notattenduserList(UserVo userVo) {
		return sqlSessionTemplate.selectList("note.notattenduserList", userVo);
	}

	@Override
	public int inviteUser(PAttendVo pattend) {
		return sqlSessionTemplate.update("note.inviteUser", pattend);
	}

	@Override
	public String checkFinishProjectBtnAble(int p_code) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("note.checkFinishProjectBtnAble", p_code);
	}
	@Override
	public List<NoteVo> calendarListN(int p_code) {
		return sqlSessionTemplate.selectList("note.calendarListN", p_code);
	}

	@Override
	public List<NoteVo> calendarUser(NoteVo noteVo) {
		return sqlSessionTemplate.selectList("note.calendarUser", noteVo);
	}
}
