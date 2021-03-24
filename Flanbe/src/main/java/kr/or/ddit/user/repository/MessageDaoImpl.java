package kr.or.ddit.user.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.user.model.MessageVo;

@Repository("messageDao")
public class MessageDaoImpl implements MessageDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<MessageVo> inboxMessage(String user_id) {
		return template.selectList("message.inboxMessage", user_id);
	}

	@Override
	public List<MessageVo> sentMessage(String user_id) {
		return template.selectList("message.sentMessage", user_id);		
	}

	@Override
	public MessageVo detailMessage(int m_no) {
		return template.selectOne("message.detailMessage", m_no);
	}

	@Override
	public int countMessage(String user_id) {
		return template.selectOne("message.countMessage", user_id);
	}

	@Override
	public int stateMessage(int m_no) {
		return template.update("message.stateMessage", m_no);
	}

	@Override
	public int deleteMessage(int m_no) {
		return template.delete("message.deleteMessage", m_no);
	}

	@Override
	public int registMessage(MessageVo messageVo) {
		return template.insert("message.registMessage", messageVo);
	}

	@Override
	public List<MessageVo> alarmMessage(String user_id) {
		return template.selectList("message.alarmMessage", user_id);
	}


}
