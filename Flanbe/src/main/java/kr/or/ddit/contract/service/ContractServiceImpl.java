package kr.or.ddit.contract.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.contract.model.MeetingVo;
import kr.or.ddit.contract.repository.ContractDao;

@Service("contractService")
public class ContractServiceImpl implements ContractService {

	@Resource(name="contractDao")
	private ContractDao contractDao;

	@Override
	public int insertContract(MeetingVo meeting) {
		return contractDao.insertContract(meeting);
	}
	
}
