package kr.or.ddit.user.repository;

import java.util.List;

import kr.or.ddit.user.model.MessageVo;

public interface MessageDao {

	//쪽지 리스트 출력(받은쪽지함)
	List<MessageVo> inboxMessage(String user_id);
	
	//쪽지 리스트 출력(보낸쪽지함)
	List<MessageVo> sentMessage(String user_id);
	
	//쪽지 상세 리스트
	MessageVo detailMessage(int m_no);
	
	//받은 쪽지 갯수
	int countMessage(String user_id);
	
	//쪽지 읽었을 경우 상태변경
	int stateMessage(int m_no);
	
	//쪽지 삭제
	int deleteMessage(int m_no);
	
	//쪽지 등록
	int registMessage(MessageVo messageVo);
	
	//쪽지 알림
	List<MessageVo> alarmMessage(String user_id);

}
