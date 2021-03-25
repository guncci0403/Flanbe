package kr.or.ddit.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.user.model.MessageVo;
import kr.or.ddit.user.repository.MessageDao;

@Service("messageService")
public class MessageServiceImpl implements MessageService{

	@Resource(name="messageDao")
	private MessageDao messageDao;

	@Override
	public List<MessageVo> inboxMessage(String user_id) {
		return messageDao.inboxMessage(user_id);
	}

	@Override
	public List<MessageVo> sentMessage(String user_id) {
		return messageDao.sentMessage(user_id);
	}

	@Override
	public MessageVo detailMessage(int m_no) {
		return messageDao.detailMessage(m_no);
	}

	@Override
	public int countMessage(String user_id) {
		return messageDao.countMessage(user_id);
	}

	@Override
	public int stateMessage(int m_no) {
		return messageDao.stateMessage(m_no);
	}

	@Override
	public int deleteMessage(int m_no) {
		return messageDao.deleteMessage(m_no);
	}

	@Override
	public int registMessage(MessageVo messageVo) {
		return messageDao.registMessage(messageVo);
	}

	@Override
	public List<MessageVo> alarmMessage(String user_id) {
		return messageDao.alarmMessage(user_id);
	}


}
