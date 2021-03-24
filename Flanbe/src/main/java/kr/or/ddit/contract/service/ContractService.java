package kr.or.ddit.contract.service;

import kr.or.ddit.contract.model.MeetingVo;

public interface ContractService {
	
	// 수락 시 미팅 잡기
	int insertContract(MeetingVo meeting);
}
